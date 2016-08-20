#property copyright "theclai@2014"
#property link      "theclai"

//#include <stdlib.mqh>
#import "stdlib.ex4"
   

bool Gi_76 = FALSE;
int Gi_80;
extern int MagicNumber = 2015;
extern string RobotName = "Boyak-Kepeng V.1b";
extern int Slippage = 2;
int Grid = 100;
double ProfitLock = 0.5;
int Gi_120 = 2;
extern string MM = "====== MM ======";
extern double Lots = 0.01;
double Gd_140 = 0.1;
extern double Risk = 100.0;
int Pips_Range = 100;
double G_ask_160 = 0.0;
double G_bid_168 = 99999999.0;
extern bool AutoLots = TRUE;
double Gd_188 = 0.1;
double Gd_196 = 0.0;
int G_datetime_204;
int Gi_208 = 1;
int Gi_212 = 0;
int Gi_216 = 0;
int Gi_220 = 1;
int Gi_224 = 0;
int Gi_228 = 0;
int Gi_232 = 6;
int Gi_236 = 0;
string Gs_unused_240 = "---------------------------------------------";
int G_period_248 = 60;
int Gi_252 = 100;
int Gi_256 = 0;
double Gd_260 = 0.02;
double Gd_268 = 0.2;
int Gi_276 = 1;
int G_period_280 = 56;
int Gi_284 = 1;
int G_period_288 = 7;
double Gd_292 = 20.0;
int Gi_300 = 0;
int G_period_304 = 110;
int G_period_308 = 3;
int G_slowing_312 = 3;
int G_shift_316 = 0;
int G_period_320 = 20;
int Gi_324 = 100;
int Gi_328 = 0;
string RobotComment;
int Gia_340[50];
int Gia_344[50];
double Gda_348[50];
double Gda_352[50];
double Gda_356[50];
double Gda_360[50];
double Gda_364[50];
double Gda_368[50];
double G_icci_372 = 0.0;
double G_icci_380 = 0.0;
double G_isar_388 = 0.0;
double G_isar_396 = 0.0;
double G_iclose_404 = 0.0;
double G_iclose_412 = 0.0;
double G_iwpr_420 = 0.0;
double G_iwpr_428 = 0.0;
double G_irsi_436 = 0.0;
double G_istochastic_444 = 0.0;
double G_istochastic_452 = 0.0;
double G_istochastic_460 = 0.0;
double G_istochastic_468 = 0.0;
double G_imomentum_476 = 0.0;
double G_imomentum_484 = 0.0;
int Gi_492 = 0;
int Gi_496 = 0;
double Gd_500 = 0.0;
double Gd_508 = 0.0;
double Gd_516 = 0.0;
double Gd_524 = 0.0;
double Gd_532 = 0.0;
double Gd_540 = 0.0;
double Gd_548 = 0.0;
double Gd_556 = 0.0;
int Gi_564 = 0;
int Gi_568 = 10;
double Gd_572 = 4.0;
double Gd_580 = 25.0;
string Gs_588 = "OrderReliable";
int G_error_596 = 0/* NO_ERROR */;
string Gs_600 = "V1_1_1";
double Gd_608 = 0.0;
double Gd_616 = 99999999.0;
double Gd_624 = 5.0;
int SwitchPeriod = 1;
int BrokerDigits = 0;	

int init() 
{
   DeleteDisplay();
   Comment("");    // clear the chart	
   RobotComment = RobotName;
   
   ObjectCreate("Logo", OBJ_LABEL, 0, 0, 0, 0, 0);
   ObjectSetText("Logo",RobotName,7, "Tahoma", Blue);
   ObjectSet("Logo", OBJPROP_CORNER, 0);
   ObjectSet("Logo", OBJPROP_XDISTANCE, 10);
   ObjectSet("Logo", OBJPROP_YDISTANCE, 15);
   
   BrokerDigits = Digits; 
   
	Gi_80 = 1;  
   if (Gi_80 == 1) {
   
      if (IsTradeAllowed() == FALSE) {
         return (0);
      }
      f0_13();
   } 
  
   return (0);
}
	 								 	  	 	     	 		   	 	    						 	   		 	  		 			 	    	  		  		  		 				  	  	     				    		 							  	 	   	 			  		 			 	 	      	 

int deinit() {

   DeleteDisplay();
   if (ObjectFind("Logo") > -1) ObjectDelete("Logo");
   return (0);
}

int start() {
   
    Comment("\n  Balance     : ", NormalizeDouble(AccountBalance(), 1), 
            "\n  Equity      : ", NormalizeDouble(AccountEquity(), 1), 
            "\n  Use Margin  : ", NormalizeDouble(AccountMargin(), 1), 
            "\n  Free Margin : ", NormalizeDouble(AccountFreeMargin(), 1), 
            "\n  Server Time : ", TimeToStr(TimeCurrent(), TIME_SECONDS), 
            "\n ");
      
   if (Gi_80 == 1) {
      RefreshRates();
      f0_20();
      f0_14();
      f0_23();
      f0_10();
   }
   return (0);
}
		 			  	 		   				    		 	  		  		 		  	 		  	 		   	 		   	 		  	 					 	 			 	    						     	 	        			   	  	 				 		 	 		 		  				   	  
void f0_13() {
   if (MarketInfo(Symbol(), MODE_DIGITS) == 4.0 || MarketInfo(Symbol(), MODE_DIGITS) == 2.0) Gi_564 = Slippage;
   else
      if (MarketInfo(Symbol(), MODE_DIGITS) == 5.0 || MarketInfo(Symbol(), MODE_DIGITS) == 3.0) Gi_564 = 10 * Slippage;
   Gd_188 = Lots;
   G_datetime_204 = TimeCurrent();
   Gd_196 = AccountBalance();
   Gd_140 = Lots / 2.0;
   if (Gd_140 < MarketInfo(Symbol(), MODE_LOTSTEP)) Gd_140 = MarketInfo(Symbol(), MODE_LOTSTEP);
   Gi_492 = 0;
   Gi_496 = 0;
   for (int index_0 = 0; index_0 < 50; index_0++) {
      Gia_340[index_0] = 0;
      Gda_348[index_0] = 0;
      Gda_356[index_0] = 0;
      Gda_364[index_0] = 0;
      Gia_344[index_0] = 0;
      Gda_352[index_0] = 0;
      Gda_360[index_0] = 0;
      Gda_368[index_0] = 0;
   }
}
					 	 	  	 					   				        	  	 	 	  	 	  			   			 	 		 	    	  		   	   	 	    			   		 	    		   			 	  		 		 							  										   	   
void f0_17() {
   double Ld_0;
   double Ld_12;
   if (Gd_196 > 0.0) {
      if (OrdersHistoryTotal() > 0) {
         Ld_0 = 0;
         for (int pos_8 = OrdersHistoryTotal() - 1; pos_8 >= 0; pos_8--) {
            if (OrderSelect(pos_8, SELECT_BY_POS, MODE_HISTORY) && OrderMagicNumber() == MagicNumber && OrderSymbol() == Symbol() && OrderType() <= OP_SELL) {
               if (OrderCloseTime() < G_datetime_204) break;
               Ld_0 = Ld_0 + OrderProfit() + OrderSwap() + OrderCommission();
            }
         }
         if (Ld_0 > 0.0) {
            Ld_12 = Ld_0 / Gd_196;
            Ld_12 *= Gd_188;
            if (Gd_188 + Ld_12 >= Lots + MarketInfo(Symbol(), MODE_LOTSTEP)) {
               Lots = NormalizeDouble(Gd_188 + Ld_12, 2);
               Gd_140 = Lots / 2.0;
               if (Gd_140 < MarketInfo(Symbol(), MODE_LOTSTEP)) Gd_140 = MarketInfo(Symbol(), MODE_LOTSTEP);
            }
         }
      }
   }
}
	  		  					 	  	 	  	  			   		  	 	  					 				       		  			  		 	 	 			 	 				    	 	 	  	 				  	 	 	 		  	    			 	  						  			  	 	  			 
void f0_21() {
   Gd_532 = 0;
   Gd_540 = 0;
   Gd_608 = 0;
   G_ask_160 = 0;
   ObjectDelete("line_buy");
   ObjectDelete("line_buy_ts");
}
	  	  	 									 	 							 	     	   	 						  	   	 				   	 	 		    				     		  	  		 	 			 			 			  	 	  	      	 		  	 	  	  	 				 	 		   
void f0_3() {
   Gd_548 = 0;
   Gd_556 = 0;
   Gd_616 = 99999999;
   G_bid_168 = 99999999;
   ObjectDelete("line_sell");
   ObjectDelete("line_sell_ts");
}
			 	 	 	    					 	 				  	     	 		 	 	    	  				  			 				 	   		  		  		   	 		   			 	 		 	  	 		   	 	 	  					 				 		  			 						 	 	   
void f0_20() {
   int index_0 = 0;
   int index_4 = 0;
   double Ld_8 = 0;
   double Ld_16 = 0;
   double Ld_24 = 0;
   double Ld_32 = 0;
   for (int pos_40 = 0; pos_40 < OrdersTotal(); pos_40++) {
      if (OrderSelect(pos_40, SELECT_BY_POS, MODE_TRADES) == TRUE) {
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber && OrderType() == OP_BUY) {
            Gia_340[index_0] = OrderTicket();
            Gda_348[index_0] = OrderLots();
            Gda_356[index_0] = OrderProfit() + OrderCommission() + OrderSwap();
            Gda_364[index_0] = OrderOpenPrice();
            Ld_8 += Gda_356[index_0];
            Ld_24 += OrderLots();
            index_0++;
         }
         if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber && OrderType() == OP_SELL) {
            Gia_344[index_4] = OrderTicket();
            Gda_352[index_4] = OrderLots();
            Gda_360[index_4] = OrderProfit() + OrderCommission() + OrderSwap();
            Gda_368[index_4] = OrderOpenPrice();
            Ld_16 += Gda_360[index_4];
            Ld_32 += OrderLots();
            index_4++;
         }
      }
   }
   Gi_492 = index_0;
   if (Gi_492 > 0) G_ask_160 = Gda_364[Gi_492 - 1];
   Gi_496 = index_4;
   if (Gi_496 > 0) G_bid_168 = Gda_368[Gi_496 - 1];
   Gd_500 = Ld_8;
   Gd_508 = Ld_16;
   Gd_516 = Ld_24;
   Gd_524 = Ld_32;
}
		  		  	 	    					   		 		 		  					  	 	   	 		 	 	 		  		 		  							 					 	  	 							    	 		        		   	 		 				  	 	 		  	  					  	  
void f0_14() {
   int Li_0;
   double Ld_4;
   double Ld_12;
   double Ld_20;
   for (int index_28 = 0; index_28 < Gi_492 - 1; index_28++) {
      for (int Li_32 = index_28 + 1; Li_32 < Gi_492; Li_32++) {
         if (Gda_348[index_28] > 0.0 && Gda_348[Li_32] > 0.0) {
            if (Gda_348[Li_32] < Gda_348[index_28]) {
               Ld_4 = Gda_348[index_28];
               Gda_348[index_28] = Gda_348[Li_32];
               Gda_348[Li_32] = Ld_4;
               Li_0 = Gia_340[index_28];
               Gia_340[index_28] = Gia_340[Li_32];
               Gia_340[Li_32] = Li_0;
               Ld_12 = Gda_356[index_28];
               Gda_356[index_28] = Gda_356[Li_32];
               Gda_356[Li_32] = Ld_12;
               Ld_20 = Gda_364[index_28];
               Gda_364[index_28] = Gda_364[Li_32];
               Gda_364[Li_32] = Ld_20;
            }
         }
      }
   }
   for (index_28 = 0; index_28 < Gi_496 - 1; index_28++) {
      for (Li_32 = index_28 + 1; Li_32 < Gi_496; Li_32++) {
         if (Gda_352[index_28] > 0.0 && Gda_352[Li_32] > 0.0) {
            if (Gda_352[Li_32] < Gda_352[index_28]) {
               Ld_4 = Gda_352[index_28];
               Gda_352[index_28] = Gda_352[Li_32];
               Gda_352[Li_32] = Ld_4;
               Li_0 = Gia_344[index_28];
               Gia_344[index_28] = Gia_344[Li_32];
               Gia_344[Li_32] = Li_0;
               Ld_12 = Gda_360[index_28];
               Gda_360[index_28] = Gda_360[Li_32];
               Gda_360[Li_32] = Ld_12;
               Ld_20 = Gda_368[index_28];
               Gda_368[index_28] = Gda_368[Li_32];
               Gda_368[Li_32] = Ld_20;
            }
         }
      }
   }
}
			  	 		   	   		 		   	  					 	 	 	 		   	 								  	 		  	    	 		 	  	 				 					 		 		  		  		  	  	  	 	 			  	 			   					     		 		 		 
void f0_23() {
   double Lda_84[50];
   double Lda_88[50];
   double Ld_0 = 0;
   double Ld_8 = 0;
   int Li_unused_16 = 1;
   double Ld_20 = 0;
   double Ld_28 = 0;
   double Ld_36 = 0;
   double Ld_44 = 0;
   double Ld_52 = 0;
   double Ld_60 = 0;
   double Ld_68 = 0;
   double Ld_76 = 0;
   double Ld_92 = MarketInfo(Symbol(), MODE_POINT);
   if (Gi_564 > Slippage) Ld_92 = 10.0 * Ld_92;
   if (Gi_492 >= 1) {
      if (Gi_120 == 1) Ld_0 = f0_12(Gda_348[0]);
      if (Gi_120 == 2) Ld_0 = f0_12(Gd_516) / Gi_492;
   }
   if (Gi_496 >= 1) {
      if (Gi_120 == 1) Ld_8 = f0_12(Gda_352[0]);
      if (Gi_120 == 2) Ld_8 = f0_12(Gd_524) / Gi_496;
   }
   if (Gi_492 >= 1) {
      Ld_68 = f0_18(Gda_348[0]);
      for (int index_100 = 0; index_100 < 50; index_100++) Lda_84[index_100] = 0;
      for (index_100 = 0; index_100 < Gi_492; index_100++) Lda_84[index_100] = MathRound(Gda_348[index_100] / Gda_348[0]);
      for (index_100 = 0; index_100 < Gi_492; index_100++) {
         Ld_36 += Lda_84[index_100];
         Ld_52 += Gda_364[index_100] * Lda_84[index_100];
      }
      Ld_20 = Ld_0 / (Ld_68 / Ld_92);
      Ld_20 += Ld_52;
      Ld_20 /= Ld_36;
      if (Gd_540 > 0.0) {
         Ld_20 = Gd_540 / (Ld_68 / Ld_92);
         Ld_20 += Ld_52;
         Ld_20 /= Ld_36;
         if (Ld_20 - Gd_608 >= Gd_624 * Ld_92) {
            Gd_608 = Ld_20;
            for (index_100 = 0; index_100 <= Gi_492 - 1; index_100++) f0_5(Gia_340[index_100], Gda_364[index_100], Gd_608, 0, 0, DodgerBlue);
         }
      }
   }
   if (Gi_496 >= 1) {
      Ld_76 = f0_18(Gda_352[0]);
      for (index_100 = 0; index_100 < 50; index_100++) Lda_88[index_100] = 0;
      for (index_100 = 0; index_100 < Gi_496; index_100++) Lda_88[index_100] = MathRound(Gda_352[index_100] / Gda_352[0]);
      for (index_100 = 0; index_100 < Gi_496; index_100++) {
         Ld_44 += Lda_88[index_100];
         Ld_60 += Gda_368[index_100] * Lda_88[index_100];
      }
      Ld_28 = -1.0 * (Ld_8 / (Ld_76 / Ld_92));
      Ld_28 += Ld_60;
      Ld_28 /= Ld_44;
      if (Gd_556 > 0.0) {
         Ld_28 = -1.0 * (Gd_556 / (Ld_76 / Ld_92));
         Ld_28 += Ld_60;
         Ld_28 /= Ld_44;
         if (Gd_616 - Ld_28 >= Gd_624 * Ld_92) {
            Gd_616 = Ld_28;
            for (index_100 = 0; index_100 <= Gi_496 - 1; index_100++) f0_5(Gia_344[index_100], Gda_368[index_100], Gd_616, 0, 0, Tomato);
         }
      }
   }
}
	 		 	 	 	 		       	    	  					    	 	 	 		 		  	 		   		   	 		   		  	   			 		 			     	  	 	  	  					 	 		 	   	   		  		  		        	 			
double f0_16() {
   if (AutoLots == TRUE) f0_17();
   double Ld_ret_0 = Lots;
   if (Ld_ret_0 > MarketInfo(Symbol(), MODE_MAXLOT)) Ld_ret_0 = MarketInfo(Symbol(), MODE_MAXLOT);
   if (Ld_ret_0 < MarketInfo(Symbol(), MODE_MINLOT)) Ld_ret_0 = MarketInfo(Symbol(), MODE_MINLOT);
   return (Ld_ret_0);
}
		 	      				 	 		 		 	  	 	 	 			       					  	  	  	     				 	   		  	   	     	 		 		 		    	 		  	  	    		   			 	 	 		  	 	 	 	 		 			 	
double f0_19(double Ad_0) {
   int count_16;
   if (Gd_140 >= 1.0) count_16 = 0;
   else {
      count_16 = 0;
      for (double Ld_8 = Ad_0; Ld_8 < 1.0; Ld_8 = 10.0 * Ld_8) count_16++;
   }
   return (count_16);
}
	  	   	 					    	 		   		 	 			 	    	 							    	    	   		 			   	  		   		 	  	 	   	 		 	 		 		 			 	   		    		    	 			   	 	    	 					
double f0_22(double Ad_0, int Ai_8, string A_symbol_12) {
   double Ld_ret_20;
   double Ld_44;
   double Ld_56;
   double Ld_28 = f0_12(Lots);
   double Ld_36 = MathFloor(MathAbs(Ad_0 / Ld_28));
   if (Ai_8 == 0) {
      if (Gi_236 < Gi_232) {
         Ld_44 = 0;
         for (int Li_52 = Gi_492 - 1; Li_52 > 0; Li_52--)
            if (Gda_348[Li_52] > Ld_44) Ld_44 = Gda_348[Li_52];
         Ld_56 = Ld_36 * Gd_140 - Ld_44;
         Ld_ret_20 = NormalizeDouble(Ld_44 + Ld_56 * Gi_236 / Gi_232, f0_19(Gd_140));
      } else Ld_ret_20 = NormalizeDouble(Ld_36 * Gd_140, MarketInfo(A_symbol_12, MODE_DIGITS));
   } else {
      if (Ai_8 == 1) {
         if (Gi_236 < Gi_232) {
            Ld_44 = 0;
            for (Li_52 = Gi_496 - 1; Li_52 > 0; Li_52--)
               if (Gda_352[Li_52] > Ld_44) Ld_44 = Gda_352[Li_52];
            Ld_56 = Ld_36 * Gd_140 - Ld_44;
            Ld_ret_20 = NormalizeDouble(Ld_44 + Ld_56 * Gi_236 / Gi_232, f0_19(Gd_140));
         } else Ld_ret_20 = NormalizeDouble(Ld_36 * Gd_140, MarketInfo(A_symbol_12, MODE_DIGITS));
      }
   }
   if (Ld_ret_20 < Lots) Ld_ret_20 = Lots;
   if (Ld_ret_20 > MarketInfo(Symbol(), MODE_MAXLOT)) Ld_ret_20 = MarketInfo(Symbol(), MODE_MAXLOT);
   if (Ld_ret_20 < MarketInfo(Symbol(), MODE_MINLOT)) Ld_ret_20 = MarketInfo(Symbol(), MODE_MINLOT);
   return (Ld_ret_20);
}
			 	 			    		 		 	 		 	  	   	 	 		 			    	 					  	 	 				     		   	  		  		 		    		 	 				  	 			  	 	 		 					  			 		 				 			 		 	 	 	 
double f0_18(double Ad_0) {
   double Ld_36;
   double Ld_ret_8 = 0;
   double Ld_16 = MarketInfo(Symbol(), MODE_TICKVALUE);
   double ticksize_24 = MarketInfo(Symbol(), MODE_TICKSIZE);
   int digits_32 = MarketInfo(Symbol(), MODE_DIGITS);
   if (Ad_0 != 0.0) {
      Ld_36 = 1 / Ad_0;
      if (digits_32 == 5 || digits_32 == 3) Ld_ret_8 = 10.0 * Ld_16;
      else
         if (digits_32 == 4 || digits_32 == 2) Ld_ret_8 = Ld_16;
      Ld_ret_8 /= Ld_36;
   }
   return (Ld_ret_8);
}
			 			 	     				 	  			  	 	   	 				 	       				 				 			  	   			 		  			  	 		 	 			 	  	 	  	  	   	 			  				  				 	   			 	 				 	     
double f0_12(double Ad_0) {
   int Li_ret_8 = Grid * f0_18(Ad_0);
   return (Li_ret_8);
}
	  	  	 									 	 							 	     	   	 						  	   	 				   	 	 		    				     		  	  		 	 			 			 			  	 	  	      	 		  	 	  	  	 				 	 		   
double f0_4(double Ad_0) {
   int Li_ret_8 = (-1 * Grid) * f0_18(Ad_0);
   return (Li_ret_8);
}
	  		   				 	 		 	  	 				   	   	 	   				 		 	      			  				 		 	 					 	 	 		    			 	  	  			  	   	 		       					  				 	  			 		 	  		  
void f0_10() {
   int Li_28;
   int Li_32;
   int Li_36;
   int Li_40;
   int Li_0 = -1;
   bool Li_8 = FALSE;
   bool Li_12 = TRUE;
   double point_16 = MarketInfo(Symbol(), MODE_POINT);
   G_icci_372 = iCCI(Symbol(), 0, G_period_248, PRICE_TYPICAL, Gi_256);
   G_icci_380 = iCCI(Symbol(), 0, G_period_248, PRICE_TYPICAL, Gi_256 + 1);
   G_isar_388 = iSAR(Symbol(), 0, Gd_260, Gd_268, Gi_276);
   G_isar_396 = iSAR(Symbol(), 0, Gd_260, Gd_268, Gi_276 + 1);
   G_iclose_404 = iClose(Symbol(), 0, Gi_276);
   G_iclose_412 = iClose(Symbol(), 0, Gi_276 + 1);
   G_iwpr_420 = iWPR(Symbol(), 0, G_period_280, Gi_284);
   G_iwpr_428 = iWPR(Symbol(), 0, G_period_280, Gi_284 + 1);
   G_irsi_436 = iRSI(Symbol(), 0, G_period_288, PRICE_CLOSE, Gi_300);
   G_istochastic_444 = iStochastic(Symbol(), 0, G_period_304, G_period_308, G_slowing_312, MODE_EMA, 0, MODE_MAIN, G_shift_316);
   G_istochastic_452 = iStochastic(Symbol(), 0, G_period_304, G_period_308, G_slowing_312, MODE_EMA, 0, MODE_MAIN, G_shift_316 + 1);
   G_istochastic_460 = iStochastic(Symbol(), 0, G_period_304, G_period_308, G_slowing_312, MODE_EMA, 0, MODE_SIGNAL, G_shift_316);
   G_istochastic_468 = iStochastic(Symbol(), 0, G_period_304, G_period_308, G_slowing_312, MODE_EMA, 0, MODE_SIGNAL, G_shift_316 + 1);
   G_imomentum_476 = iMomentum(Symbol(), 0, G_period_320, PRICE_TYPICAL, Gi_328);
   G_imomentum_484 = iMomentum(Symbol(), 0, G_period_320, PRICE_TYPICAL, Gi_328 + 1);
   if ((100 - Risk) / 100.0 * AccountBalance() > AccountEquity()) {
      for (int index_4 = 0; index_4 <= Gi_492 - 1; index_4++) Li_8 = f0_2(Gia_340[index_4], Gda_348[index_4], MarketInfo(Symbol(), MODE_BID), Gi_564, Blue);
      for (index_4 = 0; index_4 <= Gi_496 - 1; index_4++) Li_8 = f0_2(Gia_344[index_4], Gda_352[index_4], MarketInfo(Symbol(), MODE_ASK), Gi_564, Red);
      f0_21();
      f0_3();
   }
   int Li_24 = UseSuperTrend(SwitchPeriod);
   
   if (Gi_492 == 0 && Li_24) {
   
      Li_28 = OpenMoreBuy(G_icci_372, G_icci_380, Gi_252, Gi_208, G_isar_388, G_iclose_404, G_isar_396, G_iclose_412, Gi_212, G_iwpr_428, G_iwpr_420, Gi_216, G_istochastic_444,
         G_istochastic_460, G_istochastic_452, G_istochastic_468, Gi_220, G_irsi_436, Gd_292, Gi_228, G_imomentum_476, Gi_324, G_imomentum_484, Gi_224);
      if (Li_28 >= 100) {
         Gi_236 = Li_28 - 100;
         Li_12 = TRUE;
      } else {
         Gi_236 = Li_28;
         Li_12 = FALSE;
      }
      if (Li_12) {
         G_ask_160 = MarketInfo(Symbol(), MODE_ASK);
         Li_0 = f0_11(Symbol(), OP_BUY, f0_16(), G_ask_160, Gi_564, 0, 0, RobotComment, MagicNumber, 0, Blue);
      }
   }
   if (Gi_492 >= 1) {
      if (G_ask_160 <= 0.0) G_ask_160 = Gda_364[Gi_492 - 1];
      if (Gd_500 < f0_4(Gd_516) && Li_24) {
         if (G_ask_160 - MarketInfo(Symbol(), MODE_ASK) >= 10.0 * (Pips_Range * point_16)) {

            Li_32 = OpenMoreBuy(G_icci_372, G_icci_380, Gi_252, Gi_208, G_isar_388, G_iclose_404, G_isar_396, G_iclose_412, Gi_212, G_iwpr_428, G_iwpr_420, Gi_216, G_istochastic_444,
               G_istochastic_460, G_istochastic_452, G_istochastic_468, Gi_220, G_irsi_436, Gd_292, Gi_228, G_imomentum_476, Gi_324, G_imomentum_484, Gi_224);
            if (Li_32 >= 100) {
               Gi_236 = Li_32 - 100;
               Li_12 = TRUE;
            } else {
               Gi_236 = Li_32;
               Li_12 = FALSE;
            }
            if (Gi_492 < 50 && Li_12) {
               G_ask_160 = MarketInfo(Symbol(), MODE_ASK);
               Li_0 = f0_11(Symbol(), OP_BUY, f0_22(Gd_500, 0, Symbol()), G_ask_160, Gi_564, 0, 0, RobotComment, MagicNumber, 0, Blue);
            }
         }
      }
      if (Gd_532 == 0.0 && Gi_120 == 1 && Gd_500 > f0_12(Gda_348[0])) {
         Gd_532 = Gd_500;
         Gd_540 = ProfitLock * Gd_532;
      }
      if (Gd_532 == 0.0 && Gi_120 == 2 && Gd_500 > f0_12(Gd_516) / Gi_492) {
         Gd_532 = Gd_500;
         Gd_540 = ProfitLock * Gd_532;
      }
      if (Gd_532 > 0.0) {
         if (Gd_500 > Gd_532) {
            Gd_532 = Gd_500;
            Gd_540 = ProfitLock * Gd_500;
         }
      }
      if (Gd_532 > 0.0 && Gd_540 > 0.0 && Gd_532 > Gd_540 && Gd_500 < Gd_540) {
         for (index_4 = 0; index_4 <= Gi_492 - 1; index_4++) Li_8 = f0_2(Gia_340[index_4], Gda_348[index_4], MarketInfo(Symbol(), MODE_BID), Gi_564, Blue);
         f0_21();
      }
   }
   if (Gi_496 == 0 && (!Li_24)) {

      Li_36 = OpenMoreSells(G_icci_372, G_icci_380, Gi_252, Gi_208, G_isar_388, G_iclose_404, G_isar_396, G_iclose_412, Gi_212, G_iwpr_428, G_iwpr_420, Gi_216,
         G_istochastic_444, G_istochastic_460, G_istochastic_452, G_istochastic_468, Gi_220, G_irsi_436, Gd_292, Gi_228, G_imomentum_476, Gi_324, G_imomentum_484, Gi_224);
      if (Li_36 >= 100) {
         Gi_236 = Li_36 - 100;
         Li_12 = TRUE;
      } else {
         Gi_236 = Li_36;
         Li_12 = FALSE;
      }
      if (Li_12) {
         G_bid_168 = MarketInfo(Symbol(), MODE_BID);
         Li_0 = f0_11(Symbol(), OP_SELL, f0_16(), G_bid_168, Gi_564, 0, 0, RobotComment, MagicNumber, 0, Red);
      }
   }
   if (Gi_496 >= 1) {
      if (G_bid_168 >= 100.0 * MarketInfo(Symbol(), MODE_BID)) G_bid_168 = Gda_368[Gi_496 - 1];
      if (Gd_508 < f0_4(Gd_524) && (!Li_24)) {
         if (MarketInfo(Symbol(), MODE_BID) - G_bid_168 >= 10.0 * (Pips_Range * point_16)) {
            Li_40 = OpenMoreSells(G_icci_372, G_icci_380, Gi_252, Gi_208, G_isar_388, G_iclose_404, G_isar_396, G_iclose_412, Gi_212, G_iwpr_428, G_iwpr_420, Gi_216,
               G_istochastic_444, G_istochastic_460, G_istochastic_452, G_istochastic_468, Gi_220, G_irsi_436, Gd_292, Gi_228, G_imomentum_476, Gi_324, G_imomentum_484, Gi_224);
            if (Li_40 >= 100) {
               Gi_236 = Li_40 - 100;
               Li_12 = TRUE;
            } else {
               Gi_236 = Li_40;
               Li_12 = FALSE;
            }
            if (Gi_496 < 50 && Li_12) {
               G_bid_168 = MarketInfo(Symbol(), MODE_BID);
               Li_0 = f0_11(Symbol(), OP_SELL, f0_22(Gd_508, 1, Symbol()), G_bid_168, Gi_564, 0, 0, RobotComment, MagicNumber, 0, Red);
            }
         }
      }
      if (Gd_548 == 0.0 && Gi_120 == 1 && Gd_508 > f0_12(Gda_352[0])) {
         Gd_548 = Gd_508;
         Gd_556 = ProfitLock * Gd_548;
      }
      if (Gd_548 == 0.0 && Gi_120 == 2 && Gd_508 > f0_12(Gd_524) / Gi_496) {
         Gd_548 = Gd_508;
         Gd_556 = ProfitLock * Gd_548;
      }
      if (Gd_548 > 0.0) {
         if (Gd_508 > Gd_548) {
            Gd_548 = Gd_508;
            Gd_556 = ProfitLock * Gd_548;
         }
      }
      if (Gd_548 > 0.0 && Gd_556 > 0.0 && Gd_548 > Gd_556 && Gd_508 < Gd_556) {
         for (index_4 = 0; index_4 <= Gi_496 - 1; index_4++) Li_8 = f0_2(Gia_344[index_4], Gda_352[index_4], MarketInfo(Symbol(), MODE_ASK), Gi_564, Red);
         f0_3();
      }
   }
}
	  		 	  			 			  	  			 		     	 	 	 	  			 	        		 	  		 				 	  	 		 	    	     	  	  		  		  		 		 		 	 	   		 	   			     					  	  	  	

int f0_11(string A_symbol_0, int A_cmd_8, double A_lots_12, double A_price_20, int A_slippage_28, double A_price_32, double A_price_40, string A_comment_48, int A_magic_56, int A_datetime_60 = 0, color A_color_64 = -1) {
   int tk;
   double Ld_96;
   Gs_588 = "OrderSendReliable";
   f0_6(" attempted " + f0_8(A_cmd_8) + " " + A_lots_12 + " lots @" + A_price_20 + " sl:" + A_price_32 + " tp:" + A_price_40);
   if (IsStopped()) {
      f0_6("error: IsStopped() == true");
      G_error_596 = 2;
      return (-1);
   }
   for (int count_68 = 0; !IsTradeAllowed() && count_68 < Gi_568; count_68++) f0_0(Gd_572, Gd_580);
   if (!IsTradeAllowed()) {
      f0_6("error: no operation possible");
      G_error_596 = 146;
      return (-1);
   }
   int digits_72 = MarketInfo(A_symbol_0, MODE_DIGITS);
   if (digits_72 > 0) {
      A_price_20 = NormalizeDouble(A_price_20, digits_72);
      A_price_32 = NormalizeDouble(A_price_32, digits_72);
      A_price_40 = NormalizeDouble(A_price_40, digits_72);
   }
   if (A_price_32 != 0.0) f0_15(A_symbol_0, A_price_20, A_price_32);
   int error_76 = GetLastError();
   error_76 = 0;
   G_error_596 = 0;
   bool Li_80 = FALSE;
   bool Li_84 = FALSE;
   int ticket_88 = -1;
   if (A_cmd_8 == OP_BUYSTOP || A_cmd_8 == OP_SELLSTOP || A_cmd_8 == OP_BUYLIMIT || A_cmd_8 == OP_SELLLIMIT) {
      count_68 = 0;
      while (!Li_80) {
         if (IsTradeAllowed()) {
            ticket_88 = OrderSend(A_symbol_0, A_cmd_8, A_lots_12, A_price_20, A_slippage_28, A_price_32, A_price_40, A_comment_48, A_magic_56, A_datetime_60, A_color_64);
            error_76 = GetLastError();
            G_error_596 = error_76;
         } else count_68++;
         switch (error_76) {
         case 0/* NO_ERROR */:
            Li_80 = TRUE;
            break;
         case 4/* SERVER_BUSY */:
         case 6/* NO_CONNECTION */:
         case 129/* INVALID_PRICE */:
         case 136/* OFF_QUOTES */:
         case 137/* BROKER_BUSY */:
         case 146/* TRADE_CONTEXT_BUSY */:
            count_68++;
            break;
         case 135/* PRICE_CHANGED */:
         case 138/* REQUOTE */:
            RefreshRates();
            continue;
            break;
         case 130/* INVALID_STOPS */:
            Ld_96 = MarketInfo(A_symbol_0, MODE_STOPLEVEL) * MarketInfo(A_symbol_0, MODE_POINT);
            if (A_cmd_8 == OP_BUYSTOP) {
               if (MathAbs(MarketInfo(A_symbol_0, MODE_ASK) - A_price_20) <= Ld_96) Li_84 = TRUE;
            } else {
               if (A_cmd_8 == OP_SELLSTOP)
                  if (MathAbs(MarketInfo(A_symbol_0, MODE_BID) - A_price_20) <= Ld_96) Li_84 = TRUE;
            }
            Li_80 = TRUE;
            break;
         default:
            Li_80 = TRUE;
            if (count_68 > Gi_568) Li_80 = TRUE;
            if (Li_80) {
               if (error_76 != 0/* NO_ERROR */) f0_6("non-retryable error: " + f0_7(error_76));
               if (count_68 > Gi_568) f0_6("retry attempts maxed at " + Gi_568);
            }
            if (!(!Li_80)) continue;
            f0_6("retryable error (" + count_68 + "/" + Gi_568 + "): " + f0_7(error_76));
            f0_0(Gd_572, Gd_580);
            RefreshRates();
         }
      }
      if (error_76 == 0/* NO_ERROR */) {
         f0_6("apparently successful OP_BUYSTOP or OP_SELLSTOP order placed, details follow.");
         tk = OrderSelect(ticket_88, SELECT_BY_TICKET, MODE_TRADES);
         OrderPrint();
         return (ticket_88);
      }
      if (!Li_84) {
         f0_6("failed to execute stop or limit order after " + count_68 + " retries");
         f0_6("failed trade: " + f0_8(A_cmd_8) + " " + A_symbol_0 + "@" + A_price_20 + " tp@" + A_price_40 + " sl@" + A_price_32);
         f0_6("last error: " + f0_7(error_76));
         return (-1);
      }
   }
   if (Li_84) {
      f0_6("going from limit order to market order because market is too close.");
      if (A_cmd_8 == OP_BUYSTOP || A_cmd_8 == OP_BUYLIMIT) {
         A_cmd_8 = 0;
         A_price_20 = MarketInfo(A_symbol_0, MODE_ASK);
      } else {
         if (A_cmd_8 == OP_SELLSTOP || A_cmd_8 == OP_SELLLIMIT) {
            A_cmd_8 = 1;
            A_price_20 = MarketInfo(A_symbol_0, MODE_BID);
         }
      }
   }
   error_76 = GetLastError();
   error_76 = 0;
   G_error_596 = 0;
   ticket_88 = -1;
   if (A_cmd_8 == OP_BUY || A_cmd_8 == OP_SELL) {
      count_68 = 0;
      while (!Li_80) {
         if (IsTradeAllowed()) {
            ticket_88 = OrderSend(A_symbol_0, A_cmd_8, A_lots_12, A_price_20, A_slippage_28, A_price_32, A_price_40, A_comment_48, A_magic_56, A_datetime_60, A_color_64);
            error_76 = GetLastError();
            G_error_596 = error_76;
         } else count_68++;
         switch (error_76) {
         case 0/* NO_ERROR */:
            Li_80 = TRUE;
            break;
         case 4/* SERVER_BUSY */:
         case 6/* NO_CONNECTION */:
         case 129/* INVALID_PRICE */:
         case 136/* OFF_QUOTES */:
         case 137/* BROKER_BUSY */:
         case 146/* TRADE_CONTEXT_BUSY */:
            count_68++;
            break;
         case 135/* PRICE_CHANGED */:
         case 138/* REQUOTE */:
            RefreshRates();
            continue;
            break;
         default:
            Li_80 = TRUE;
            if (count_68 > Gi_568) Li_80 = TRUE;
            if (!Li_80) {
               f0_6("retryable error (" + count_68 + "/" + Gi_568 + "): " + f0_7(error_76));
               f0_0(Gd_572, Gd_580);
               RefreshRates();
            }
            if (!(Li_80)) continue;
            if (error_76 != 0/* NO_ERROR */) f0_6("non-retryable error: " + f0_7(error_76));
            if (count_68 <= Gi_568) continue;
            f0_6("retry attempts maxed at " + Gi_568);
         }
      }
      if (error_76 == 0/* NO_ERROR */) {
         f0_6("apparently successful OP_BUY or OP_SELL order placed, details follow.");
         tk = OrderSelect(ticket_88, SELECT_BY_TICKET, MODE_TRADES);
         OrderPrint();
         return (ticket_88);
      }
      f0_6("failed to execute OP_BUY/OP_SELL, after " + count_68 + " retries");
      f0_6("failed trade: " + f0_8(A_cmd_8) + " " + A_symbol_0 + "@" + A_price_20 + " tp@" + A_price_40 + " sl@" + A_price_32);
      f0_6("last error: " + f0_7(error_76));
      return (-1);
   }
   return (0);
}
			 	 	 	    					 	 				  	     	 		 	 	    	  				  			 				 	   		  		  		   	 		   			 	 		 	  	 		   	 	 	  					 				 		  			 						 	 	   
int f0_5(int A_ticket_0, double A_price_4, double A_price_12, double A_price_20, int A_datetime_28, color A_color_32 = -1) {
   int tk;
   string Ls_40;
   Gs_588 = "OrderModifyReliable";
   f0_6(" attempted modify of #" + A_ticket_0 + " price:" + A_price_4 + " sl:" + A_price_12 + " tp:" + A_price_20);
   if (IsStopped()) {
      f0_6("error: IsStopped() == true");
      return (0);
   }
   for (int count_36 = 0; !IsTradeAllowed() && count_36 < Gi_568; count_36++) f0_0(Gd_572, Gd_580);
   if (!IsTradeAllowed()) {
      f0_6("error: no operation possible because IsTradeAllowed()==false, even after retries.");
      G_error_596 = 146;
      return (0);
   }
   int error_52 = GetLastError();
   error_52 = 0;
   G_error_596 = 0;
   bool Li_56 = FALSE;
   count_36 = 0;
   bool bool_60 = FALSE;
   while (!Li_56) {
      if (IsTradeAllowed()) {
         bool_60 = OrderModify(A_ticket_0, A_price_4, A_price_12, A_price_20, A_datetime_28, A_color_32);
         error_52 = GetLastError();
         G_error_596 = error_52;
      } else count_36++;
      if (bool_60 == TRUE) Li_56 = TRUE;
      switch (error_52) {
      case 0/* NO_ERROR */:
         Li_56 = TRUE;
         break;
      case 1/* NO_RESULT */:
         Li_56 = TRUE;
         break;
      case 4/* SERVER_BUSY */:
      case 6/* NO_CONNECTION */:
      case 129/* INVALID_PRICE */:
      case 136/* OFF_QUOTES */:
      case 137/* BROKER_BUSY */:
      case 146/* TRADE_CONTEXT_BUSY */:
      case 128/* TRADE_TIMEOUT */:
         count_36++;
         break;
      case 135/* PRICE_CHANGED */:
      case 138/* REQUOTE */:
         RefreshRates();
         continue;
         break;
      default:
         Li_56 = TRUE;
         if (count_36 > Gi_568) Li_56 = TRUE;
         if (!Li_56) {
            f0_6("retryable error (" + count_36 + "/" + Gi_568 + "): " + f0_7(error_52));
            f0_0(Gd_572, Gd_580);
            RefreshRates();
         }
         if (!(Li_56)) continue;
         if (error_52 != 0/* NO_ERROR */ && error_52 != 1/* NO_RESULT */) f0_6("non-retryable error: " + f0_7(error_52));
         if (count_36 <= Gi_568) continue;
         f0_6("retry attempts maxed at " + Gi_568);
      }
   }
   if (bool_60 == TRUE || error_52 == 0/* NO_ERROR */) {
      f0_6("apparently successful modification order, updated trade details follow.");
      tk = OrderSelect(A_ticket_0, SELECT_BY_TICKET, MODE_TRADES);
      OrderPrint();
      return (1);
   }
   if (error_52 == 1/* NO_RESULT */) {
      f0_6("Server reported modify order did not actually change parameters.");
      f0_6("redundant modification: " + A_ticket_0 + " " + Ls_40 + "@" + A_price_4 + " tp@" + A_price_20 + " sl@" + A_price_12);
      f0_6("Suggest modifying code logic to avoid.");
      return (1);
   }
   f0_6("failed to execute modify after " + count_36 + " retries");
   f0_6("failed modification: " + A_ticket_0 + " " + Ls_40 + "@" + A_price_4 + " tp@" + A_price_20 + " sl@" + A_price_12);
   f0_6("last error: " + f0_7(error_52));
   return (0);
}
		 	      				 	 		 		 	  	 	 	 			       					  	  	  	     				 	   		  	   	     	 		 		 		    	 		  	  	    		   			 	 	 		  	 	 	 	 		 			 	
int f0_2(int A_ticket_0, double A_lots_4, double A_price_12, int A_slippage_20, color A_color_24 = -1) {
   int tk;
   Gs_588 = "OrderCloseReliable";
   f0_6(" attempted close of #" + A_ticket_0 + " price:" + A_price_12 + " lots:" + A_lots_4 + " slippage:" + A_slippage_20);
   if (!OrderSelect(A_ticket_0, SELECT_BY_TICKET)) {
      G_error_596 = GetLastError();
      
      return (0);
   }
   int cmd_28 = OrderType();
   string symbol_32 = OrderSymbol();
   if (cmd_28 != OP_BUY && cmd_28 != OP_SELL) {
      G_error_596 = 4108;
      f0_6("error: trying to close ticket #" + A_ticket_0 + ", which is " + f0_8(cmd_28) + ", not OP_BUY or OP_SELL");
      return (0);
   }
   if (IsStopped()) {
      f0_6("error: IsStopped() == true");
      return (0);
   }
   int count_40 = 0;
   int error_44 = GetLastError();
   error_44 = 0;
   G_error_596 = 0;
   bool Li_48 = FALSE;
   count_40 = 0;
   bool is_closed_52 = FALSE;
   while (!Li_48) {
      if (IsTradeAllowed()) {
         is_closed_52 = OrderClose(A_ticket_0, A_lots_4, A_price_12, A_slippage_20, A_color_24);
         error_44 = GetLastError();
         G_error_596 = error_44;
      } else count_40++;
      if (is_closed_52 == 1) Li_48 = TRUE;
      switch (error_44) {
      case 135/* PRICE_CHANGED */: continue;
      case 138/* REQUOTE */: continue;
      case 0/* NO_ERROR */:
         Li_48 = TRUE;
         break;
      case 4/* SERVER_BUSY */:
      case 6/* NO_CONNECTION */:
      case 129/* INVALID_PRICE */:
      case 136/* OFF_QUOTES */:
      case 137/* BROKER_BUSY */:
      case 146/* TRADE_CONTEXT_BUSY */:
      case 128/* TRADE_TIMEOUT */:
         count_40++;
         break;
      default:
         Li_48 = TRUE;
      }
      if (count_40 > Gi_568) Li_48 = TRUE;
      if (!Li_48) {
         f0_6("retryable error (" + count_40 + "/" + Gi_568 + "): " + f0_7(error_44));
         f0_0(Gd_572, Gd_580);
         if (cmd_28 == OP_BUY) A_price_12 = NormalizeDouble(MarketInfo(symbol_32, MODE_BID), MarketInfo(symbol_32, MODE_DIGITS));
         if (cmd_28 == OP_SELL) A_price_12 = NormalizeDouble(MarketInfo(symbol_32, MODE_ASK), MarketInfo(symbol_32, MODE_DIGITS));
      }
      if (Li_48) {
         if (error_44 != 0/* NO_ERROR */ && error_44 != 1/* NO_RESULT */) f0_6("non-retryable error: " + f0_7(error_44));
         if (count_40 > Gi_568) f0_6("retry attempts maxed at " + Gi_568);
      }
   }
   if (is_closed_52 == 1 || error_44 == 0/* NO_ERROR */) {
      f0_6("apparently successful close order, updated trade details follow.");
      tk = OrderSelect(A_ticket_0, SELECT_BY_TICKET, MODE_TRADES);
      OrderPrint();
      return (1);
   }
   f0_6("failed to execute close after " + count_40 + " retries");
   f0_6("failed close: Ticket #" + A_ticket_0 + ", Price: " + A_price_12 + ", Slippage: " + A_slippage_20);
   f0_6("last error: " + f0_7(error_44));
   return (0);
}
			 	 			    		 		 	 		 	  	   	 	 		 			    	 					  	 	 				     		   	  		  		 		    		 	 				  	 			  	 	 		 					  			 		 				 			 		 	 	 	 
string f0_7(int Ai_0) {
   return ("" + Ai_0 + "" );
}
		   	 	  	 	    				     										 	 	  	 	 		 	 			     	  	 	 		 		   		 			   				  				  	  			  		    	 			 	  	  	    		 	       				 			
void f0_6(string As_0) {
   if (!IsTesting() || IsOptimization()) Print(Gs_588 + " " + Gs_600 + ":" + As_0);
}
					 	 	  	 					   				        	  	 	 	  	 	  			   			 	 		 	    	  		   	   	 	    			   		 	    		   			 	  		 		 							  										   	   
string f0_8(int Ai_0) {
   if (Ai_0 == 0) return ("OP_BUY");
   if (Ai_0 == 1) return ("OP_SELL");
   if (Ai_0 == 4) return ("OP_BUYSTOP");
   if (Ai_0 == 5) return ("OP_SELLSTOP");
   if (Ai_0 == 2) return ("OP_BUYLIMIT");
   if (Ai_0 == 3) return ("OP_SELLLIMIT");
   return ("(CMD==" + Ai_0 + ")");
}
				 	 	   		    	  	       						   	 	   		 		 		 		    	   	 	    		      			  	 			  	  	  	    	  		 		 	 				   	  			  		 			     	  	 			
void f0_15(string A_symbol_0, double Ad_8, double &Ad_16) {
   double Ld_24;
   if (Ad_16 != 0.0) {
      Ld_24 = MarketInfo(A_symbol_0, MODE_STOPLEVEL) * MarketInfo(A_symbol_0, MODE_POINT);
      if (MathAbs(Ad_8 - Ad_16) <= Ld_24) {
         if (Ad_8 > Ad_16) Ad_16 = Ad_8 - Ld_24;
         else {
            if (Ad_8 < Ad_16) Ad_16 = Ad_8 + Ld_24;
            else f0_6("EnsureValidStop: error, passed in price == sl, cannot adjust");
         }
         Ad_16 = NormalizeDouble(Ad_16, MarketInfo(A_symbol_0, MODE_DIGITS));
      }
   }
}
	 	    	 	  		     			   	 		 			  	   	 	  				  			    			 		 		 	  	  	 	  		 				 	    			 	 	 			 				    		 		 		   	  			  	  	     						
void f0_0(double Ad_0, double Ad_8) {
   double Ld_16;
   int Li_24;
   double Ld_28;
   if (IsTesting() == FALSE) {
      Ld_16 = MathCeil(Ad_0 / 0.1);
      if (Ld_16 > 0.0) {
         Li_24 = MathRound(Ad_8 / 0.1);
         Ld_28 = 1.0 - 1.0 / Ld_16;
         Sleep(100);
         for (int count_36 = 0; count_36 < Li_24; count_36++) {
            if (MathRand() > 32768.0 * Ld_28) break;
            Sleep(100);
         }
      }
   }
}
		  	 		  	  		  			 		   		   						 		  	  	 	 	 	  	    			  	 			     			  	   	     			 			  		 				   	 				 			   	  		 	 	  			  			 	 		
int UseSuperTrend(int Ai_0) {
   int timeframe_4;
   string symbol_8 = Symbol();
   if (Ai_0 == 0) timeframe_4 = 0;
   else timeframe_4 = SelectTimeFrame(Ai_0);
   double icustom_16 = iCustom(symbol_8, timeframe_4, "SuperTrend", symbol_8, 0, 1);
   double icustom_24 = iCustom(symbol_8, timeframe_4, "SuperTrend", symbol_8, 1, 1);
   if (icustom_16 == EMPTY_VALUE && icustom_24 != EMPTY_VALUE) return (1);
   return (0);
}
	 	   	  	  				   					 	 		   	  	  	  	  		    			 		 			 	 			 	   	 	 	     				  	   				  	 				 			   	 	 		 	 	  	  	    	  			   			  	
int SelectTimeFrame(int Ai_0) {
   int Li_ret_4 = 0;
   switch (Ai_0) {
   case 1:
      Li_ret_4 = 1;
      break;
   case 2:
      Li_ret_4 = 5;
      break;
   case 3:
      Li_ret_4 = 15;
      break;
   case 4:
      Li_ret_4 = 30;
      break;
   case 5:
      Li_ret_4 = 60;
      break;
   case 6:
      Li_ret_4 = 240;
      break;
   case 7:
      Li_ret_4 = 1440;
      break;
   case 8:
      Li_ret_4 = 10080;
      break;
   case 9:
      Li_ret_4 = 43200;
   }
   return (Li_ret_4);
}

//------------------------ DLL-functions -------------------
int OpenMoreBuy ( double a1, double a2, double a3, int a4, double a5, double a6, int a7, double a8, int a9, double a10, double a11, int a12, double a13, double a14, double a15, double a16, int a17, double a18, double a19, int a20, double a21, double a22, double a23, int a24 )
{
  int result; 
  string v25; 
  int v26; 
  
	v26 = 0;
	v25 = 1;
	if ( a3 * -1.0 >= a1 || a3 * -1.0 <= a2 )
	{
		if ( a4 == 1 )
			v25 = 0;
	}
	else
	{
		v26 = 1;
	}
  
	if ( a6 <= a5 || a7 <= a8 )
	{
		if ( a9 == 1 )
			v25 = 0;
	}
	else
	{
		v26++;
	}
  
	if ( a10 >= -80.0 || a11 <= -80.0 )
	{
		if ( a12 == 1 )
			v25 = 0;
	}
	else
	{
		v26++;
	}
  
	if ( a14 >= a13 || a16 <= a15 )
	{
		if ( a17 == 1 )
			v25 = 0;
	}
	else
	{
		v26++;
	}
	
	if ( a19 > a18 )
	{
		v26++;
	}
	else
	{
		if ( a20 == 1 )
			v25 = 0;
	}
	if ( a22 < a21 && a22 > a23 )
	{
		v26++;
//		goto LABEL_31;   => added that section below instead
		result = v26 + 100;
		if ( v25 )
			return ( result );
		return ( v26 );	
	}
	
	if ( a24 != 1 )
	{

		result = v26 + 100;
		if ( v25 )
			return ( result );
	}
	return ( v26 );
}

//-------------------------------------------------

int OpenMoreSells ( double a1, double a2, double a3, int a4, double a5, double a6, int a7, double a8, int a9, double a10, double a11, int a12, double a13, double a14, double a15, double a16, int a17, double a18, double a19, int a20, double a21, double a22, double a23, int a24)
{
	int result; 
	string v25; 
	int v26; 

	v26 = 0;
	v25 = 1;
  
	if ( a3 <= a1 || a3 >= a2 )
	{
		if ( a4 == 1 )
			v25 = 0;
	}
	else
	{
		v26 = 1;
	}
  
	if ( a6 >= a5 || a7 >= a8 )
	{
		if ( a9 == 1 )
			v25 = 0;
	}
	else
	{
		++v26;
	}
  
	if ( a10 <= -20.0 || a11 >= -20.0 )
	{
		if ( a12 == 1 )
			v25 = 0;
	}
	else
	{
		v26++;
	}
  
	if ( a14 <= a13 || a16 >= a15 )
	{
		if ( a17 == 1 )
			v25 = 0;
	}
	else
	{
		v26++;
	}
  
	if ( 100.0 - a19 < a18 )
	{
		v26++;
	}
	else
	{
		if ( a20 == 1 )
			v25 = 0;
	}
  
	if ( a22 > a21 && a22 < a23 )
	{
		v26++;
//    goto LABEL_31;  => added that section below instead
	   result = v26 + 100;
		if ( v25 )
			return ( result );
		return ( v26 );	
	}
  
	if ( a24 != 1 )
	{
// LABEL_31:
		result = v26 + 100;
		if ( v25 )
			return ( result );
	}
	return ( v26 );
}

void DeleteDisplay()
{
   ObjectsDeleteAll();
}

