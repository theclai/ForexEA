
#property copyright "@theclai"

#import "stdlib.ex4"
   string ErrorDescription(int a0); 
#import

extern int Filter = 180;
extern int MagicNumber = 021081;
extern int StopLoss = 60;
extern double MinLots = 0.01;
double MaxLots = 100000.0;
extern double Risk = 10.0;
double FixedLots = 0.1;
extern bool UseMM = TRUE;
double MaxSpreadPlusCommission = 15;
int Limit = 20;
extern int Distance = 30;
extern int Env_period = 10;
extern double Env_deviation = 0.07; // 0.05
int Env_shift = 0;
int Env_low_band_price = PRICE_HIGH;
int Env_high_band_price = PRICE_LOW;
string TimeFilter = "----------Time Filter";
int StartHour = 0;
int StartMinute = 0;
int EndHour = 23;
int EndMinute = 59;
int Gi_180 = 0;
double G_pips_184 = 0.0;
int G_digits_192 = 0;
double G_point_196 = 0.0;
int Gi_204;
double Gd_208;
double Gd_216;
double Gd_224;
double Gd_232;
double Gd_240;
double Gd_248;
double Gd_256;
int G_slippage_264 = 3;
bool Gi_268;
double Gd_272;
double Gda_280[30];
int Gi_284 = 0;
string Gs_dummy_288;
double Gd_336;
double Gd_344;
int G_time_352;
int Gi_356;
int G_datetime_360;
string Gs_364 = "000,000,000";
string Gs_372 = "000,000,255";
int Gi_380;
int Gi_384;
int Gi_388;
int Gi_392 = 40;
double G_timeframe_396 = 240.0;
bool Gi_404 = TRUE;
color G_color_408 = DimGray;
string G_name_412 = "SpreadIndikatorObj";
double Gd_420;
color G_color_428 = Red;
color G_color_432 = DarkGray;
color G_color_436 = SpringGreen;
bool Gi_440 = TRUE;
double G_ihigh_444;
double G_ilow_452;
double Gd_460;
int G_datetime_468;
string TradeComment = "Cidomo v.1b";
string Gs_80 = "2015.05.03 00:00";

int init() {
   
   int timeframe_8;
   ArrayInitialize(Gda_280, 0);
   G_digits_192 = Digits;
   G_point_196 = Point;
   
   double lotstep_0 = MarketInfo(Symbol(), MODE_LOTSTEP);
   Gi_204 = MathLog(lotstep_0) / MathLog(0.1);
   Gd_208 = MathMax(MinLots, MarketInfo(Symbol(), MODE_MINLOT));
   Gd_216 = MathMin(MaxLots, MarketInfo(Symbol(), MODE_MAXLOT));
   Gd_224 = Risk / 100.0;
   Gd_232 = NormalizeDouble(MaxSpreadPlusCommission * G_point_196, G_digits_192 + 1);
   Gd_240 = NormalizeDouble(Limit * G_point_196, G_digits_192);
   Gd_248 = NormalizeDouble(Distance * G_point_196, G_digits_192);
   Gd_256 = NormalizeDouble(G_point_196 * Filter, G_digits_192);
   Gi_268 = FALSE;
   Gd_272 = NormalizeDouble(G_pips_184 * G_point_196, G_digits_192 + 1);
   if (!IsTesting()) {
  
      if (Gi_404) {
         timeframe_8 = Period();
         switch (timeframe_8) {
         case PERIOD_M1:
            G_timeframe_396 = 5;
            break;
         case PERIOD_M5:
            G_timeframe_396 = 15;
            break;
         case PERIOD_M15:
            G_timeframe_396 = 30;
            break;
         case PERIOD_M30:
            G_timeframe_396 = 60;
            break;
         case PERIOD_H1:
            G_timeframe_396 = 240;
            break;
         case PERIOD_H4:
            G_timeframe_396 = 1440;
            break;
         case PERIOD_D1:
            G_timeframe_396 = 10080;
            break;
         case PERIOD_W1:
            G_timeframe_396 = 43200;
            break;
         case PERIOD_MN1:
            G_timeframe_396 = 43200;
         }
      }
      Gd_420 = 0.0001;
    
   }
   return (0);
}

int deinit() {
   if (!IsTesting()) {
      for (int Li_0 = 1; Li_0 <= Gi_392; Li_0++) ObjectDelete("Padding_rect" + Li_0);
      for (int count_4 = 0; count_4 < 10; count_4++) {
         ObjectDelete("BD" + count_4);
         ObjectDelete("SD" + count_4);
      }
      ObjectDelete("time");
      ObjectDelete(G_name_412);
   }
   Comment("");
   ObjectDelete("B3LLogo");
   ObjectDelete("B3LCopy");
   ObjectDelete("FiboUp");
   ObjectDelete("FiboDn");
   ObjectDelete("FiboIn");
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
   int cmd_188;
   double Ld_196;
   double Ld_204;
   
   double indicator_low;
	double indicator_high;
	double indicator_highlow_diff;
	
	Comment("\n  Balance     : ", NormalizeDouble(AccountBalance(), 1), 
            "\n  Equity      : ", NormalizeDouble(AccountEquity(), 1), 
            "\n  Use Margin  : ", NormalizeDouble(AccountMargin(), 1), 
            "\n  Free Margin : ", NormalizeDouble(AccountFreeMargin(), 1), 
            "\n  Server Time : ", TimeToStr(TimeCurrent(), TIME_SECONDS), 
            "\n ");
            
   double ihigh_68 = iHigh(NULL, 0, 0);
   double ilow_76 = iLow(NULL, 0, 0);
   
   indicator_low = iEnvelopes ( NULL, 0, Env_period, MODE_SMA, Env_shift, Env_low_band_price, Env_deviation, MODE_LOWER, 0 );
	indicator_high = iEnvelopes ( NULL,0, Env_period, MODE_SMA, Env_shift, Env_high_band_price, Env_deviation, MODE_UPPER, 0 );
   indicator_highlow_diff = indicator_low - indicator_high;	

   
    if (IsExpiredDate()) {   
    
     if (!Gi_268) {
      for (int pos_108 = OrdersHistoryTotal() - 1; pos_108 >= 0; pos_108--) {
         if (OrderSelect(pos_108, SELECT_BY_POS, MODE_HISTORY)) {
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
   pos_108 = 29;
   for (int count_136 = 0; count_136 < Gi_284; count_136++) {
      Ld_128 += Gda_280[pos_108];
      pos_108--;
   }
   double Ld_140 = Ld_128 / Gi_284;
   double Ld_148 = NormalizeDouble(Ask + Gd_272, G_digits_192);
   double Ld_156 = NormalizeDouble(Bid - Gd_272, G_digits_192);
   double Ld_164 = NormalizeDouble(Ld_140 + Gd_272, G_digits_192 + 1);
   double Ld_172 = ihigh_68 - ilow_76;
   
   if (Ld_172 > Gd_256) {
      if (Ask < indicator_low)
      {
         signal = -1;  
      }     
      else if (Bid > indicator_high)
      {
         signal = 1; 
      }
   }
   
   int count_184 = 0;
   for (pos_108 = 0; pos_108 < OrdersTotal(); pos_108++) {
      if (OrderSelect(pos_108, SELECT_BY_POS, MODE_TRADES)) {
         if (OrderMagicNumber() == MagicNumber) {
            cmd_188 = OrderType();
            if (cmd_188 == OP_BUYLIMIT || cmd_188 == OP_SELLLIMIT) continue;
            if (OrderSymbol() == Symbol()) {
               count_184++;
               switch (cmd_188) {
               case OP_BUY:
                  if (Distance < 0) break;
                  Ld_44 = NormalizeDouble(OrderStopLoss(), G_digits_192);
                  price_60 = NormalizeDouble(Bid - Gd_248, G_digits_192);
                  if (!((Ld_44 == 0.0 || price_60 > Ld_44))) break;
                  bool_32 = OrderModify(OrderTicket(), OrderOpenPrice(), price_60, OrderTakeProfit(), 0, Lime);
                  if (!(!bool_32)) break;
                  error_8 = GetLastError();
                  Ls_12 = ErrorDescription(error_8);
                  Print("BUY Modify Error Code: " + error_8 + " Message: " + Ls_12 + " OP: " + DoubleToStr(price_24, G_digits_192) + " SL: " + DoubleToStr(price_60, G_digits_192) +
                     " Bid: " + DoubleToStr(Bid, G_digits_192) + " Ask: " + DoubleToStr(Ask, G_digits_192));
                  break;
               case OP_SELL:
                  if (Distance < 0) break;
                  Ld_44 = NormalizeDouble(OrderStopLoss(), G_digits_192);
                  price_60 = NormalizeDouble(Ask + Gd_248, G_digits_192);
                  if (!((Ld_44 == 0.0 || price_60 < Ld_44))) break;
                  bool_32 = OrderModify(OrderTicket(), OrderOpenPrice(), price_60, OrderTakeProfit(), 0, Orange);
                  if (!(!bool_32)) break;
                  error_8 = GetLastError();
                  Ls_12 = ErrorDescription(error_8);
                  Print("SELL Modify Error Code: " + error_8 + " Message: " + Ls_12 + " OP: " + DoubleToStr(price_24, G_digits_192) + " SL: " + DoubleToStr(price_60, G_digits_192) +
                     " Bid: " + DoubleToStr(Bid, G_digits_192) + " Ask: " + DoubleToStr(Ask, G_digits_192));
                  break;
               case OP_BUYSTOP:
                  Ld_36 = NormalizeDouble(OrderOpenPrice(), G_digits_192);
                  price_24 = NormalizeDouble(Ask + Gd_240, G_digits_192);
                  if (!((price_24 < Ld_36))) break;
                  price_60 = NormalizeDouble(price_24 - StopLoss * Point, G_digits_192);
                  bool_32 = OrderModify(OrderTicket(), price_24, price_60, OrderTakeProfit(), 0, Lime);
                  if (!(!bool_32)) break;
                  error_8 = GetLastError();
                  Ls_12 = ErrorDescription(error_8);
                  Print("BUYSTOP Modify Error Code: " + error_8 + " Message: " + Ls_12 + " OP: " + DoubleToStr(price_24, G_digits_192) + " SL: " + DoubleToStr(price_60, G_digits_192) +
                     " Bid: " + DoubleToStr(Bid, G_digits_192) + " Ask: " + DoubleToStr(Ask, G_digits_192));
                  break;
               case OP_SELLSTOP:
                  Ld_36 = NormalizeDouble(OrderOpenPrice(), G_digits_192);
                  price_24 = NormalizeDouble(Bid - Gd_240, G_digits_192);
                  if (!((price_24 > Ld_36))) break;
                  price_60 = NormalizeDouble(price_24 + StopLoss * Point, G_digits_192);
                  bool_32 = OrderModify(OrderTicket(), price_24, price_60, OrderTakeProfit(), 0, Orange);
                  if (!(!bool_32)) break;
                  error_8 = GetLastError();
                  Ls_12 = ErrorDescription(error_8);
                  Print("SELLSTOP Modify Error Code: " + error_8 + " Message: " + Ls_12 + " OP: " + DoubleToStr(price_24, G_digits_192) + " SL: " + DoubleToStr(price_60, G_digits_192) +
                     " Bid: " + DoubleToStr(Bid, G_digits_192) + " Ask: " + DoubleToStr(Ask, G_digits_192));
               }
            }
         }
      }
   }
   
   if (count_184 == 0 && signal != 0 && Ld_164 <= Gd_232 && f0_4()) {
      Ld_196 = AccountBalance() * AccountLeverage() * Gd_224;
      if (!UseMM) Ld_196 = FixedLots;
      Ld_204 = NormalizeDouble(Ld_196 / MarketInfo(Symbol(), MODE_LOTSIZE), Gi_204);
      Ld_204 = MathMax(Gd_208, Ld_204);
      Ld_204 = MathMin(Gd_216, Ld_204);
      if (signal < 0) {
      
         price_24 = NormalizeDouble(Bid - Gd_240, G_digits_192);
         price_60 = NormalizeDouble(price_24 + StopLoss * Point, G_digits_192);
         ticket_20 = OrderSend(Symbol(), OP_SELLSTOP, Ld_204, price_24, G_slippage_264, price_60, 0, TradeComment, MagicNumber, 0, Orange);
         if (ticket_20 <= 0) {
            error_8 = GetLastError();
            Ls_12 = ErrorDescription(error_8);
            Print("BUYSELL Send Error Code: " + error_8 + " Message: " + Ls_12 + " LT: " + DoubleToStr(Ld_204, Gi_204) + " OP: " + DoubleToStr(price_24, G_digits_192) + " SL: " +
               DoubleToStr(price_60, G_digits_192) + " Bid: " + DoubleToStr(Bid, G_digits_192) + " Ask: " + DoubleToStr(Ask, G_digits_192));
      
         }
      } 
      else {
      
         price_24 = NormalizeDouble(Ask + Gd_240, G_digits_192);
         price_60 = NormalizeDouble(price_24 - StopLoss * Point, G_digits_192);
         ticket_20 = OrderSend(Symbol(), OP_BUYSTOP, Ld_204, price_24, G_slippage_264, price_60, 0, TradeComment, MagicNumber, 0, Lime);
         if (ticket_20 <= 0) {
            error_8 = GetLastError();
            Ls_12 = ErrorDescription(error_8);
            Print("BUYSTOP Send Error Code: " + error_8 + " Message: " + Ls_12 + " LT: " + DoubleToStr(Ld_204, Gi_204) + " OP: " + DoubleToStr(price_24, G_digits_192) + " SL: " +
               DoubleToStr(price_60, G_digits_192) + " Bid: " + DoubleToStr(Bid, G_digits_192) + " Ask: " + DoubleToStr(Ask, G_digits_192));
               
         }
      }
   }
   
   string Ls_212 = "AvgSpread:" + DoubleToStr(Ld_140, G_digits_192) + "  Commission rate:" + DoubleToStr(Gd_272, G_digits_192 + 1) + "  Real avg. spread:" + DoubleToStr(Ld_164,
      G_digits_192 + 1);
   
   if (Ld_164 > Gd_232) {
      Ls_212 = Ls_212 
         + "\n" 
         + "The EA can not run with this spread ( " + DoubleToStr(Ld_164, G_digits_192 + 1) + " > " + DoubleToStr(Gd_232, G_digits_192 + 1) + " )";
      }
   
   }
 
   return (0);
}

bool IsExpiredDate() {

   int str2time_0 = StrToTime(Gs_80);
   if (TimeCurrent() > str2time_0) {
      Alert("Trial time is over");
      return (TRUE);
   }
   return (TRUE);
}
			 	   	    	 			 						 				 			 		 	 	   				    	  	   		  	   		 		  	   	 				 		  		 			 	  	 		  		 		 	  				  	  		     		   					 	   
int f0_4() {
   if ((Hour() > StartHour && Hour() < EndHour) || (Hour() == StartHour && Minute() >= StartMinute) || (Hour() == EndHour && Minute() < EndMinute)) return (1);
   return (0);
}
	  				  			  		  	 	  	 	  	 		  	 		   				  												 							 		 			 	 	          	  		    		     	  		 				  	 	  		 			 		   			      	 	
	  	   			   			 	 							   		    	  		 			  	 				 		 				 		  				       		 	  	 	 		   	 	 	  	 	 											  	 		 	 				  		  		 		 		 			       		 	 		  	  			 		 	 			      	  		   					  						  			 		 	  	   			    			 	      	    			 	 			 			 	    				 	 		 			 			  	 	

	 			   		 	 	 		   							 		 		   	 	 		 					 	 		  	 	  	  	 	  	 		 			  	 	 	  		   					 		   		   				 	 		 		  		  	    		    		 	  	   
	