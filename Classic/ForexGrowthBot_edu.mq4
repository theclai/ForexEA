//+------------------------------------------------------------------+
//|                                               ForexGrowthBot.mq4 |
//|                   Copyright © 2010, ForexGrowthBot & E. Labunsky |
//|                                    http://www.ForexGrowthBot.com |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2010, ForexGrowthBot"
#property link      "http://www.ForexGrowthBot.com"

#include <WinUser32.mqh>
#include <stderror.mqh>

#import "quanttradermt4.dll"
int initQuant(int SystemID, int LotLimit, double CapGameProfit, double LossPerLot, double CapManagValue, int CapGameFreq, int EntryFreq, double Marging, int UseWaveTrailing, string WaveTrailing);
double GetVolatilityRatio (double &ArrClose[], double &ArrOpen[], int FastPeriod, int SlowPeriod, int arrLen); 
int GetQuantPositionChange(int SystemID, int useDerivativeSize, int DerivativeSize, double LastPrice, int Signal, int BarNum, double Profit, double Loss, double atrRatio);
int getSystemID();

int SYSTEM_ID = 0;
extern double LotSize = 0.1;
extern int Magic  = 4826809;
extern bool FIFO = false;
extern int  ClosePreviousSessionOrders = 2;
extern bool Assign_PT_and_ST = false;

//Advanced and power
extern string BotComment = "Forex Growth Bot";

extern int FastVolatilityBase = 5;
extern int SlowVolatilityBase = 60;
extern double VolatilityFactor = 2;

//Advanced
extern double ProfitTarget = 0.5;
extern double StopLoss = 0.2;
extern int ProfitLossVolatilityBase = 50;

//Power only
extern bool ReInvestCapital = false;

//All versions
extern double TrailProfitRisk = 0;

//Power only
extern bool UseWaveTrailing = false;
extern string WaveTrailing = "40-80;40-80;40-80;40";

bool UseDerivativeSize = false;
int DerivativeSize = 25;
int NoiseLevelBegin = 0; //By default do not add noice
int NoiseLevelEnd = 0; //By default do not add noice
int EntryNoiseCount = 1;
bool ConcervativeCapitalStrategy = true;

datetime LastBarTime;
int BarNumber = 0;

double ReInvestFactor = 1;
double cummProfit = 0;

int afterEntry = -1000;

double maxEntryVolatilityFactor = 0;

double baseLotSize = 0;

double entryRatio = 0;
int InPosCount = 0;
bool  UseAbsoluteLevel = false;
double StandardLotSize = 100000;

double CapManagementValue = 250;
int CapManagementAggLevel = 240;
int EntryManagementAggLevel = 15;

double LotLimit = 10;

bool CheckPrevSession = true;
bool CheckInit = true;

double RoundPrec (double Source, double Prec)
{
	return (MathRound(Source / Prec)*Prec);      
}

bool CareCloseOrder (int orderNum, int orderType, double Lots)
{

	bool res = false;
	color orderColor = CLR_NONE;
	int k = 0;
	int error = 0;
	double closePrice = 0;

	if (orderType == OP_BUY)
	{
		closePrice = Bid;
		orderColor = Green;  
	} else
	{
		closePrice = Ask;
		orderColor = Red;  
	}



	if (IsTesting())	
	{
		OrderClose(orderNum, Lots, closePrice, 100, orderColor);  
	} else
	{ 

		//Care close  

		k = 0;	

		while (k<20)
		{

			OrderClose(orderNum, Lots, closePrice, 100, orderColor);  

			error = GetLastError();

			if (!error) 
			{
				
				Sleep(2000);
				
				RefreshRates();	
				
	         if (orderType == OP_BUY)
	         {
		          closePrice = Bid;		      
	         } else
	         {
		          closePrice = Ask;
	         }								 

			} else {
				res = true;
				break;
			}

			k++;

		}

	}  

	return (res); 

}

void AdjustPosition(int PositionChange)
{

	//Looking for already opened position. Close it and then in case did not filled the position change open an another order 

	double MinLot=MarketInfo(Symbol(), MODE_MINLOT);
	double FinalNetPos = RoundPrec (PositionChange * LotSize * ReInvestFactor, MinLot);  	

	double tmpNetPos = 0;
	int k = 0;	
	int error = 0;	
	int ticket = 0;

	if (FIFO)
	{

		for (int i = 0; i < OrdersTotal(); i++)
		{

			if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES) == false)
			{
				Print ("SELECT ERROR");
				break;
			}

			if (OrderMagicNumber() != Magic || OrderSymbol() != Symbol())
				continue;

			//---- check order type
			if (OrderType() == OP_BUY && FinalNetPos < 0)
			{

				if (OrderLots() <= MathAbs(FinalNetPos)) 
				{                      

					//Print ("close long: " + OrderLots());
					FinalNetPos = FinalNetPos + OrderLots(); 					
					CareCloseOrder (OrderTicket(), OP_BUY, OrderLots());					
					i-- ;


				} else if (OrderLots() > MathAbs(FinalNetPos) && MathAbs(FinalNetPos)!=0)
				{

					CareCloseOrder (OrderTicket(), OP_BUY, MathAbs(FinalNetPos));			
					FinalNetPos = 0;
					i --;

				}

			}


			if (OrderType() == OP_SELL && FinalNetPos > 0)
			{

				if (OrderLots() <= MathAbs(FinalNetPos)) 
				{      

					FinalNetPos = FinalNetPos - OrderLots();   					
					CareCloseOrder (OrderTicket(), OP_SELL, OrderLots());			           					
					i --;

				} else if (OrderLots() > MathAbs(FinalNetPos) && MathAbs(FinalNetPos)!=0)
				{

					CareCloseOrder (OrderTicket(), OP_SELL, MathAbs(FinalNetPos));	
					FinalNetPos = 0;
					i --;

				}    

			}


		}

	} else
	{

		for (i = OrdersTotal()-1; i >=0 ; i--)
		{

			if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES) == false)
			{
				Print ("SELECT ERROR");
				break;
			}

			if (OrderMagicNumber() != Magic || OrderSymbol() != Symbol())
				continue;

			//---- check order type
			if (OrderType() == OP_BUY && FinalNetPos < 0)
			{

				if (OrderLots() <= MathAbs(FinalNetPos)) 
				{                      

					//Print ("close long: " + OrderLots());
					FinalNetPos = FinalNetPos + OrderLots(); 
					CareCloseOrder (OrderTicket(), OP_BUY, OrderLots());			 

				} else if (OrderLots() > MathAbs(FinalNetPos) && MathAbs(FinalNetPos)!=0)
				{

					CareCloseOrder (OrderTicket(), OP_BUY, MathAbs(FinalNetPos));			
					FinalNetPos = 0;

				}

			}


			if (OrderType() == OP_SELL && FinalNetPos > 0)
			{

				if (OrderLots() <= MathAbs(FinalNetPos)) 
				{      

					//Print ("close short: " + OrderLots());
					FinalNetPos = FinalNetPos - OrderLots();     
					CareCloseOrder (OrderTicket(), OP_SELL, OrderLots());			          

				} else if (OrderLots() > MathAbs(FinalNetPos) && MathAbs(FinalNetPos)!=0)
				{

					CareCloseOrder (OrderTicket(), OP_SELL, MathAbs(FinalNetPos));		
					FinalNetPos = 0;

				}    

			}


		}	

	}


	if ( FinalNetPos > 0)
	{    

		//Open new LONG order
		//Print (" Open new long order: " + FinalNetPos);

		if (IsTesting())
		{
			OrderSend(Symbol(), OP_BUY, MathAbs(FinalNetPos), Ask, 100, 0, 0, BotComment, Magic, 0, Green);   
		} else 
		{

			//Open new long order with care 

			k = 0;	

			while (k<20)
			{

				ticket = OrderSend(Symbol(), OP_BUY, MathAbs(FinalNetPos), Ask, 100, 0, 0, BotComment, Magic, 0, Green);   

				if (ticket < 0) 
				{
					Sleep(2000);
					RefreshRates();					 

				} else {
					break;
				}

				k++;	

			}

		}	

	}

	if ( FinalNetPos < 0)
	{    

		//Open new SHORT order
		//Print (" Open new short order: " + FinalNetPos);

		if (IsTesting())
		{
			OrderSend(Symbol(), OP_SELL, MathAbs(FinalNetPos), Bid, 100, 0, 0, BotComment, Magic, 0, Red);   
		} else 
		{

			//Open new short order with care 

			k = 0;	

			while (k<20)
			{

				ticket = OrderSend(Symbol(), OP_SELL, MathAbs(FinalNetPos), Bid, 100, 0, 0, BotComment, Magic, 0, Red); 

				if (ticket<0) 
				{
					Sleep(2000);
					RefreshRates();					 

				} else {
					break;
				}

				k++;	

			}

		}			


	}  

	if (cummProfit == 0)
	{
		cummProfit = AccountEquity();
	}

	/*
	if (FinalNetPos == 0 && ReInvestCapital)
	{

	if (AccountEquity() - cummProfit >= 1000 )  //* (baseLotSize / 0.05) )
	//if (AccountEquity() - cummProfit > 15000 * (baseLotSize / 0.1) )

	{

	//LotSize = MathRound (AccountEquity() / 450) * 0.01;
	LotSize += 0.05; //MathRound((AccountEquity() - cummProfit) / 150) * 0.01; // MathRound((AccountEquity() - cummProfit / 250)) *  0.01; //baseLotSize;
	cummProfit = AccountEquity();	     	     

	}

	}  	
	*/

	if (FinalNetPos == 0 && ReInvestCapital)
	{

		if (AccountEquity() - cummProfit > 4700 * (baseLotSize / 0.1) )
		{
			LotSize += baseLotSize;
			cummProfit = AccountEquity();
		}

	}		

}

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
{

	if (IsTesting())
		SYSTEM_ID = 0;
	else
		SYSTEM_ID = getSystemID();

	MathSrand(TimeLocal());
	
   if (TrailProfitRisk != 0)
	{
	
	  TrailProfitRisk = MathAbs (TrailProfitRisk);
     
     if (!UseWaveTrailing)
     {                                                      
         WaveTrailing = TrailProfitRisk;	  
         UseWaveTrailing = true;
     }     
          
	  
	}	  

	int iBoolUseWave = 0;
	if (UseWaveTrailing)
		iBoolUseWave = 1;

	int iSys_id = 0;
	if (SYSTEM_ID<0) 
		iSys_id = 0;
	else if (SYSTEM_ID>100) 
		iSys_id = 99;   
		
	EntryManagementAggLevel = Period();

	initQuant(SYSTEM_ID, LotLimit, ProfitTarget, StopLoss, CapManagementValue, CapManagementAggLevel, EntryManagementAggLevel, StandardLotSize, iBoolUseWave, WaveTrailing);      
	LastBarTime =  iTime( NULL, Period(), 0); 
	BarNumber = 0;

	baseLotSize = LotSize;

	return(0);

}

//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
{      
	return(0);
}
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start()
{      

	if (CheckPrevSession && !IsTesting())
	{

		CheckPrevSession = false; 

		if (ClosePreviousSessionOrders > 0)
		{

			bool error=true;
			int lastError;
			bool askedClear = false;
			bool clearOrder = true;

			if (ClosePreviousSessionOrders > 1)
			{
				askedClear = true;
				clearOrder = true;
			}

			for (int j =0; j <= OrdersTotal();  j++)
			{

				if (OrderSelect(j, SELECT_BY_POS, MODE_TRADES) == false)
				{
					//Print ("SELECT ERROR");
					break;
				}

				if (OrderMagicNumber() != Magic || OrderSymbol() != Symbol())
					continue;

				if (!askedClear)
				{
					askedClear = true;
					int ret = MessageBox("Trades operated by Forex Growth Bot are still open.  We recommend closing them as they will not be tracked by the robot after MT4 has restart.",
						"Forex Growth Bot", MB_YESNO|MB_ICONQUESTION);
					if(ret==IDNO) clearOrder = false;
				} 

				int k = 0;				

				while (k<20)
				{

					RefreshRates();

					//---- check order type				
					if (OrderType() == OP_BUY && clearOrder)
					{
						error = OrderClose(OrderTicket(), OrderLots(), Bid, 10, Green);		            		              
					}

					if (OrderType() == OP_SELL && clearOrder)
					{
						error = OrderClose(OrderTicket(), OrderLots(), Ask, 10, Red); 
					}

					int err=GetLastError();
					//Print("error = ",err);

					if (!error) 
					{
					
						Sleep(3000);
						RefreshRates();

						//Print ("Can''t delete order. Try again...");	                		        

					} else {
						j--;
						break;
					}

					k++;

				}		


			}

			//Print ("Prev. session clean finished...");	

		}	      

		return(0);

	}



	int SystemPeriod = Period(); // 15; //   
	j  = 0;

	if (iTime( NULL, Period(), 0) - LastBarTime>= SystemPeriod)
	{

		BarNumber += Period();

		double NoiseLevel = 0;

		for (NoiseLevel = NoiseLevelBegin; NoiseLevel <= NoiseLevelEnd; NoiseLevel ++) 
		{

			bool breakIt = false;        

			for (j=0; j<EntryNoiseCount; j++) 	   
			{

				double arrayClose[];
				double arrayOpen[];

				if (ArraySize (Close) > 101) 				
				{

					//Copy last 100 prices (15 mins)
					ArrayCopy (arrayClose, Close,0,1, 100);
					ArrayCopy (arrayOpen, Open,0,1, 100);

					double randomAdd = 0;

					int i;

					if (NoiseLevel > 0) // Add noise
					{				

						for (i=0;i<ArraySize (arrayClose); i++)
						{	     

							if (MathRand()>32767/2)
								randomAdd = (MathRand() + 0.0000001)/32767.0*(NoiseLevel*Point);		
							else
								randomAdd = - (MathRand() + 0.0000001)/32767.0*(NoiseLevel*Point);		      

							arrayClose[i] += randomAdd;

						}


						for (i=0;i<ArraySize (arrayOpen); i++)
						{

							if (MathRand()>32767/2)
								randomAdd = (MathRand() + 0.0000001)/32767.0*(NoiseLevel*Point);		
							else
								randomAdd = - (MathRand() + 0.0000001)/32767.0*(NoiseLevel*Point);		     

							arrayOpen[i] += randomAdd;

						}

					}

				}

				LastBarTime =  iTime( NULL, Period(), 0);     
				int Signal = 0; 
				double volatatilityRatio = 0;


				if (ArraySize (Close) > 101)
				{  

					volatatilityRatio = GetVolatilityRatio (arrayClose, arrayOpen, FastVolatilityBase, SlowVolatilityBase, 100);  

					if (MathAbs (volatatilityRatio) > VolatilityFactor)				  				
					{


						if (volatatilityRatio>0)
							Signal = 1;
						else  
							Signal =  -1;							

					}	

				}																	 

				double InternalProfitTarget = ProfitTarget; 
				double InternalStopLoss = StopLoss;

				double atrRatio = High[iHighest(NULL,0,MODE_HIGH,ProfitLossVolatilityBase,1 )] - Low[iLowest(NULL,0,MODE_LOW,ProfitLossVolatilityBase,1)] ;			   
				atrRatio *=  StandardLotSize;  

				if (!Assign_PT_and_ST)
				{

					/*

					double TPLevel1 = 0.3; 
					double TPLevel2 = 0.375;
					double TPLevel3 = 0.45;

					double TP_Level = High[iHighest(NULL,0,MODE_HIGH,ProfitLossVolatilityBase,1 )] - Low[iLowest(NULL,0,MODE_LOW,ProfitLossVolatilityBase,1)] ;			    

					if (Signal == 1)
					{
					OrderSend(Symbol(), OP_BUYLIMIT, LotSize, Ask + TP_Level * TPLevel1 , 100, Close[0] - PTSL_Level * StopLoss , Close[0] + PTSL_Level * ProfitTarget, BotComment, Magic, 0, Green);				     				     				     
					}
					if (Signal == -1)
					{
					OrderSend(Symbol(), OP_SELLLIMIT, LotSize, Bid, 100, Close[0] + PTSL_Level * StopLoss , Close[0] - PTSL_Level * ProfitTarget, BotComment, Magic, 0, Red);				     				     				     
					}

					*/

					int ChangePosition = GetQuantPositionChange(SYSTEM_ID, 0, DerivativeSize, arrayClose[0], Signal, BarNumber, InternalProfitTarget, InternalStopLoss, atrRatio);

					if (ChangePosition != 0) 
					{
						//Print ("System change >> " + (ChangePosition));
						AdjustPosition (ChangePosition);
					}   

					if (Signal!=0)
					{

						breakIt = true;
						break;

					}	

				} else 
				{

					double PTSL_Level = High[iHighest(NULL,0,MODE_HIGH,ProfitLossVolatilityBase,1 )] - Low[iLowest(NULL,0,MODE_LOW,ProfitLossVolatilityBase,1)] ;			    
					if (Signal == 1)
					{
						OrderSend(Symbol(), OP_BUY, LotSize, Ask, 100, Close[0] - PTSL_Level * StopLoss , Close[0] + PTSL_Level * ProfitTarget, BotComment, Magic, 0, Green);				     				     				     
					}
					if (Signal == -1)
					{
						OrderSend(Symbol(), OP_SELL, LotSize, Ask, 100, Close[0] + PTSL_Level * StopLoss , Close[0] - PTSL_Level * ProfitTarget, BotComment, Magic, 0, Red);				     				     				     
					}

				}		

			}

		}	

	}
	
	return(0);

}
//+------------------------------------------------------------------+