
#property copyright "@theclai"

#import "stdlib.ex4"
   string ErrorDescription(int a0); 
#import

extern int Filter = 200;
extern int MagicNumber = 021081;
extern string MM = "---------- MM ----------";
extern int StopLoss = 100;
extern double MinLots = 0.01;
extern double MaxLots = 100000.0;
extern double Risk = 10.0;
extern double FixedLots = 0.1;
extern bool UseMM = TRUE;
extern string Trade_Setting = "---------- Trade_Setting ----------";
extern double Max_Spread = 15;
extern int Limit = 20;
extern int Distance = 0;
extern int Env_period = 15;
extern double Env_deviation = 0.07; // 0.05
extern int Env_shift = 0;

int Env_low_band_price = PRICE_HIGH;
int Env_high_band_price = PRICE_LOW;
double min_pips = 0.0;
int min_digits = 0;
double min_point = 0.0;
int math_log;
double min_lots;
double max_lots;
double min_risk;
double Gd_232;
double Gd_240;
double Gd_248;
double Gd_256;
int slippage = 3;
bool Gi_268;
double Gd_272;
double Gda_280[30];
int Gi_284 = 0;
string TradeComment = "Cidomo v.1c";
string expired_date = "2015.05.03 00:00";

int init() {
   
   ArrayInitialize(Gda_280, 0);
   min_digits = Digits;
   min_point = Point;
   double lotstep_0 = MarketInfo(Symbol(), MODE_LOTSTEP);
   math_log = MathLog(lotstep_0) / MathLog(0.1);
   min_lots = MathMax(MinLots, MarketInfo(Symbol(), MODE_MINLOT));
   max_lots = MathMin(MaxLots, MarketInfo(Symbol(), MODE_MAXLOT));
   min_risk = Risk / 100.0;
   Gd_232 = NormalizeDouble(Max_Spread * min_point, min_digits + 1);
   Gd_240 = NormalizeDouble(Limit * min_point, min_digits);
   Gd_248 = NormalizeDouble(Distance * min_point, min_digits);
   Gd_256 = NormalizeDouble(min_point * Filter, min_digits);
   Gi_268 = FALSE;
   Gd_272 = NormalizeDouble(min_pips * min_point, min_digits + 1);
 
   return (0);
}

int deinit() {
   
   Comment("");
   
   return (0);
}

int start() {
   int error_8;
   string Ls_12;
   int ticket_20;
   double price_24;
   bool bool_32;
   double Ld_36;
   double Ld_44;
   double price_60;
   double Ld_112;
   int signal;
   int CmdOrder;
   double Ld_196;
   double Ld_204;
   
   double indicator_low;
	double indicator_high;
	double indicator_highlow_diff;
	double currentSpread = MarketInfo(Symbol(),MODE_SPREAD);
	
	Comment("\n  Balance     : ", NormalizeDouble(AccountBalance(), 1), 
            "\n  Equity      : ", NormalizeDouble(AccountEquity(), 1), 
            "\n  Use Margin  : ", NormalizeDouble(AccountMargin(), 1), 
            "\n  Free Margin : ", NormalizeDouble(AccountFreeMargin(), 1), 
            "\n  Server Time : ", TimeToStr(TimeCurrent(), TIME_SECONDS), 
            "\n  Spread      : ", currentSpread, 
            "\n ");
             
            
   double indiHigh = iHigh(NULL, 0, 0);
   double indiLow = iLow(NULL, 0, 0);
   double volatilityLimit = indiHigh - indiLow;
   
   indicator_low = iEnvelopes ( NULL, 0, Env_period, MODE_SMA, Env_shift, Env_low_band_price, Env_deviation, MODE_LOWER, 0 );
	indicator_high = iEnvelopes ( NULL,0, Env_period, MODE_SMA, Env_shift, Env_high_band_price, Env_deviation, MODE_UPPER, 0 );
   indicator_highlow_diff = indicator_high - indicator_low;	

   
    if (IsExpiredDate()) {   
    
     if (!Gi_268) {
      for (int position = OrdersHistoryTotal() - 1; position >= 0; position--) {
         if (OrderSelect(position, SELECT_BY_POS, MODE_HISTORY)) {
            if (OrderProfit() != 0.0) {
               if (OrderClosePrice() != OrderOpenPrice()) {
                  if (OrderSymbol() == Symbol()) {
                     Gi_268 = TRUE;
                     Ld_112 = MathAbs(OrderProfit() / (OrderClosePrice() - OrderOpenPrice()));
                     Gd_272 = (-OrderCommission()) / Ld_112;
                     break;
                  }
               }
            }
         }
      }
   }
   
   double Ld_120 = Ask - Bid;
   ArrayCopy(Gda_280, Gda_280, 0, 1, 29);
   Gda_280[29] = Ld_120;
   if (Gi_284 < 30) Gi_284++;
   double Ld_128 = 0;
   position = 29;
   for (int count_136 = 0; count_136 < Gi_284; count_136++) {
      Ld_128 += Gda_280[position];
      position--;
   }
   double Ld_140 = Ld_128 / Gi_284;
   double Ld_148 = NormalizeDouble(Ask + Gd_272, min_digits);
   double Ld_156 = NormalizeDouble(Bid - Gd_272, min_digits);
   double Ld_164 = NormalizeDouble(Ld_140 + Gd_272, min_digits + 1);
  
   
   if (volatilityLimit > Gd_256) {
      if (Ask < indicator_low)
      {
         signal = -1;  
      }     
      else if (Bid > indicator_high)
      {
         signal = 1; 
      }
   }
   
   int counter = 0;
   for (position = 0; position < OrdersTotal(); position++) {
      if (OrderSelect(position, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderMagicNumber() == MagicNumber) {
            CmdOrder = OrderType();
            if (CmdOrder == OP_BUYLIMIT || CmdOrder == OP_SELLLIMIT) continue;
            if (OrderSymbol() == Symbol()) {
               counter++;
               switch (CmdOrder) {
               case OP_BUY:
                  if (Distance < 0) break;
                  Ld_44 = NormalizeDouble(OrderStopLoss(), min_digits);
                  price_60 = NormalizeDouble(Bid - Gd_248, min_digits);
                  if (!((Ld_44 == 0.0 || price_60 > Ld_44))) break;
                  bool_32 = OrderModify(OrderTicket(), OrderOpenPrice(), price_60, OrderTakeProfit(), 0, Blue);
                  if (!(!bool_32)) break;
                  error_8 = GetLastError();
                  Ls_12 = ErrorDescription(error_8);
                  Print("BUY Modify Error Code: " + error_8 + " Message: " + Ls_12 + " OP: " + DoubleToStr(price_24, min_digits) + " SL: " + DoubleToStr(price_60, min_digits) +
                     " Bid: " + DoubleToStr(Bid, min_digits) + " Ask: " + DoubleToStr(Ask, min_digits));
                  break;
               case OP_SELL:
                  if (Distance < 0) break;
                  Ld_44 = NormalizeDouble(OrderStopLoss(), min_digits);
                  price_60 = NormalizeDouble(Ask + Gd_248, min_digits);
                  if (!((Ld_44 == 0.0 || price_60 < Ld_44))) break;
                  bool_32 = OrderModify(OrderTicket(), OrderOpenPrice(), price_60, OrderTakeProfit(), 0, Red);
                  if (!(!bool_32)) break;
                  error_8 = GetLastError();
                  Ls_12 = ErrorDescription(error_8);
                  Print("SELL Modify Error Code: " + error_8 + " Message: " + Ls_12 + " OP: " + DoubleToStr(price_24, min_digits) + " SL: " + DoubleToStr(price_60, min_digits) +
                     " Bid: " + DoubleToStr(Bid, min_digits) + " Ask: " + DoubleToStr(Ask, min_digits));
                  break;
               case OP_BUYSTOP:
                  Ld_36 = NormalizeDouble(OrderOpenPrice(), min_digits);
                  price_24 = NormalizeDouble(Ask + Gd_240, min_digits);
                  if (!((price_24 < Ld_36))) break;
                  price_60 = NormalizeDouble(price_24 - StopLoss * Point, min_digits);
                  bool_32 = OrderModify(OrderTicket(), price_24, price_60, OrderTakeProfit(), 0, Blue);
                  if (!(!bool_32)) break;
                  error_8 = GetLastError();
                  Ls_12 = ErrorDescription(error_8);
                  Print("BUYSTOP Modify Error Code: " + error_8 + " Message: " + Ls_12 + " OP: " + DoubleToStr(price_24, min_digits) + " SL: " + DoubleToStr(price_60, min_digits) +
                     " Bid: " + DoubleToStr(Bid, min_digits) + " Ask: " + DoubleToStr(Ask, min_digits));
                  break;
               case OP_SELLSTOP:
                  Ld_36 = NormalizeDouble(OrderOpenPrice(), min_digits);
                  price_24 = NormalizeDouble(Bid - Gd_240, min_digits);
                  if (!((price_24 > Ld_36))) break;
                  price_60 = NormalizeDouble(price_24 + StopLoss * Point, min_digits);
                  bool_32 = OrderModify(OrderTicket(), price_24, price_60, OrderTakeProfit(), 0, Red);
                  if (!(!bool_32)) break;
                  error_8 = GetLastError();
                  Ls_12 = ErrorDescription(error_8);
                  Print("SELLSTOP Modify Error Code: " + error_8 + " Message: " + Ls_12 + " OP: " + DoubleToStr(price_24, min_digits) + " SL: " + DoubleToStr(price_60, min_digits) +
                     " Bid: " + DoubleToStr(Bid, min_digits) + " Ask: " + DoubleToStr(Ask, min_digits));
               }
            }
         }
      }
   }
   
   if (counter == 0 && signal != 0 && Ld_164 <= Gd_232) {
      
      Ld_196 = AccountBalance() * AccountLeverage() * min_risk;
      if (!UseMM) Ld_196 = FixedLots;
      Ld_204 = NormalizeDouble(Ld_196 / MarketInfo(Symbol(), MODE_LOTSIZE), math_log);
      Ld_204 = MathMax(min_lots, Ld_204);
      Ld_204 = MathMin(max_lots, Ld_204);
      
      if (signal < 0) 
      {   
         price_24 = NormalizeDouble(Ask + Gd_240, min_digits);
         price_60 = NormalizeDouble(price_24 - StopLoss * Point, min_digits);
         ticket_20 = OrderSend(Symbol(), OP_BUYSTOP, Ld_204, price_24, slippage, price_60, 0, TradeComment, MagicNumber, 0, Blue);
         if (ticket_20 <= 0) {
            error_8 = GetLastError();
            Ls_12 = ErrorDescription(error_8);
            Print("BUY_STOP Send Error Code: " + error_8 + " Message: " + Ls_12 + " LT: " + DoubleToStr(Ld_204, math_log) + " OP: " + DoubleToStr(price_24, min_digits) + " SL: " +
               DoubleToStr(price_60, min_digits) + " Bid: " + DoubleToStr(Bid, min_digits) + " Ask: " + DoubleToStr(Ask, min_digits));        
         }
      } 
      else 
      {
         price_24 = NormalizeDouble(Bid - Gd_240, min_digits);
         price_60 = NormalizeDouble(price_24 + StopLoss * Point, min_digits);
         ticket_20 = OrderSend(Symbol(), OP_SELLSTOP, Ld_204, price_24, slippage, price_60, 0, TradeComment, MagicNumber, 0, Red);
         if (ticket_20 <= 0) {
            error_8 = GetLastError();
            Ls_12 = ErrorDescription(error_8);
            Print("SELL_STOP Send Error Code: " + error_8 + " Message: " + Ls_12 + " LT: " + DoubleToStr(Ld_204, math_log) + " OP: " + DoubleToStr(price_24, min_digits) + " SL: " +
               DoubleToStr(price_60, min_digits) + " Bid: " + DoubleToStr(Bid, min_digits) + " Ask: " + DoubleToStr(Ask, min_digits));
         }
      }
   }
   
   string Ls_212 = "AvgSpread:" + DoubleToStr(Ld_140, min_digits) + "  Commission rate:" + DoubleToStr(Gd_272, min_digits + 1) + "  Real avg. spread:" + DoubleToStr(Ld_164,
      min_digits + 1);
   
   if (Ld_164 > Gd_232) {
      Ls_212 = Ls_212 
         + "\n" 
         + "The EA can not run with this spread ( " + DoubleToStr(Ld_164, min_digits + 1) + " > " + DoubleToStr(Gd_232, min_digits + 1) + " )";
      }
   
   }
 
   return (0);
}

bool IsExpiredDate() {

   int str2time_0 = StrToTime(expired_date);
   if (TimeCurrent() > str2time_0) {
      Alert("Trial time is over");
      return (TRUE);
   }
   return (TRUE);
}
			 	   	    	 			 						 				 			 		 	 	   				    	  	   		  	   		 		  	   	 				 		  		 			 	  	 		  		 		 	  				  	  		     		   					 	   
	  				  			  		  	 	  	 	  	 		  	 		   				  												 							 		 			 	 	          	  		    		     	  		 				  	 	  		 			 		   			      	 	
	  	   			   			 	 							   		    	  		 			  	 				 		 				 		  				       		 	  	 	 		   	 	 	  	 	 											  	 		 	 				  		  		 		 		 			       		 	 		  	  			 		 	 			      	  		   					  						  			 		 	  	   			    			 	      	    			 	 			 			 	    				 	 		 			 			  	 	

	 			   		 	 	 		   							 		 		   	 	 		 					 	 		  	 	  	  	 	  	 		 			  	 	 	  		   					 		   		   				 	 		 		  		  	    		    		 	  	   
	