#property copyright "theclai"

/*
#import "wininet.dll"
   int InternetOpenA(string a0, int a1, string a2, string a3, int a4);
   int InternetOpenUrlA(int a0, string a1, string a2, int a3, int a4, int a5);
   int InternetReadFile(int a0, string a1, int a2, int& a3[]);
   int InternetCloseHandle(int a0);
*/   
#import "FCS242.dll"
   int dllInit(int a0, int a1, int a2, int a3, int a4);
   int dllOpenCond1(int a0, double a1, double a2, double a3, double a4, double a5, double a6, int a7, int a8, int a9);
   int dllCloseCond1(int a0, double a1, double a2);
   int dllOpenCond2(int a0, double a1, double a2, double a3, double a4, double a5, double a6);
   int dllCloseCond2(int a0, double a1, double a2, double a3, double a4);
   int dllOpenCond3(int a0, double a1, double a2, double a3, double a4, double a5, double a6);
   int dllCloseCond3(int a0, double a1, double a2, double a3, double a4, double a5, double a6);
   int dllParamInit1(int a0);
   int dllParamInit2(int a0);
   double dllExpTrailLong(double a0, double a1, double a2);
   double dllExpTrailShort(double a0, double a1, double a2);
   int dllGMTOffset();
#import

//string gs_76 = "http://forex-combo.com/verify.php";
bool ea_validation = TRUE;
extern string A = "====================";
extern bool Use_FXCOMBO_Scalping = TRUE;
extern bool Use_FXCOMBO_Breakout = TRUE;
extern bool Use_FXCOMBO_Reversal = TRUE;
extern string B = "====================";
extern bool Use_ECN_Execution = TRUE;
extern bool Hidden_StopAndTarget = FALSE;
extern bool No_Hedge_Trades = FALSE;
extern bool NFA_Compatibility = FALSE;
extern string C = "====================";
extern string CommentSys1 = "*** 1 ***";
extern string CommentSys2 = "*** 2 ***";
extern string CommentSys3 = "*** 3 ***";
extern string D = "====================";
extern int Magic1 = 111;
extern int Magic2 = 222;
extern int Magic3 = 333;
extern string E = "====================";
extern double MaxSPREAD = 4.0;
extern int Slippage = 2;
extern bool AutoGMT_Offset = TRUE;
extern int ManualGMT_Offset = 2;
extern bool UseAgresiveMM = FALSE;
extern bool EMAIL_Notification = FALSE;
extern string MMSys1 = "==== FXCOMBO Scalping MM Parameters ====";
extern double LotsSys1 = 0.01;
extern double TradeMMSys1 = 0.0;
extern double LossFactorSys1 = 2.0;
int gi_252 = 0;
int gi_256 = 2;
int gi_260 = 0;
extern string MMSys2 = "==== FXCOMBO Breakout MM Parameters ====";
extern double LotsSys2 = 0.01;
extern double TradeMMSys2 = 0.0;
extern double LossFactorSys2 = 2.0;
int gi_296 = 0;
int gi_300 = 2;
int gi_304 = 0;
extern string MMSys3 = "==== FXCOMBO Reversal MM Parameters ====";
extern double LotsSys3 = 0.01;
extern double TradeMMSys3 = 0.0;
extern double LossFactorSys3 = 2.0;
int gi_340 = 0;
int gi_344 = 2;
int gi_348 = 0;
extern string CommonMM = "==== Main MM Parameters ====";
extern double MMMax = 20.0;
extern double MaximalLots = 50.0;
extern string Scalping = "==== FXCOMBO Scalping System Parameters ====";
extern int StopLoss = 100;
extern int TakeProfit = 22;
int g_period_392 = 60;
extern int TREND_STR = 20;
int g_period_400 = 18;
extern int OSC_open = 11;
extern int OSC_close = 13;
int gi_412 = -5;
int gi_416 = -1;
int gi_420 = -1;
int gi_424 = 6;
extern string Breakout = "==== FXCOMBO Breakout System Parameters ====";
extern int TakeProfit_II = 300;
extern int StopLoss_II = 33;
extern int MaxPipsTrailing2 = 180;
extern int MinPipsTrailing2 = 10;
extern int Break = 9;
int g_period_456 = 1;
int g_period_460 = 19;
double gd_464 = 1.4;
extern double ATRTrailingFactor2 = 3.9;
int gi_480 = 300;
extern int F_TrailingProfit_II = 270;
extern int F_Trailing_II = 20;
extern bool Use_Exp_Trailing_II = FALSE;
extern double Exp_Trail_Factor_II = 1.35;
int gi_504 = 0;
int gi_508 = 0;
int gi_512 = 1;
int gi_516 = -1;
int gi_520 = -1;
int gi_524 = -1;
int gi_528 = -1;
int gi_532 = -1;
int gi_536 = -1;
int gi_540 = -1;
int gi_544 = -1;
int gi_548 = -1;
int gi_552 = -1;
int gi_556 = -1;
int gi_560 = -1;
extern string Reversal = "==== FXCOMBO Reversal System Parameters ====";
extern int BegHourSys_III = 22;
extern int EndHourSys_III = 0;
extern int TakeProfit_III = 160;
extern int StopLoss_III = 70;
int gi_588 = 300;
extern int MaxPipsTrailing3 = 60;
extern int MinPipsTrailing3 = 20;
int g_period_600 = 55;
double gd_604 = 8.0;
int g_period_612 = 26;
int gi_616 = 1;
int gi_620 = 30;
extern int F_TrailingProfit_III = 120;
extern int F_Trailing_III = 30;
extern bool Use_Exp_Trailing_III = FALSE;
extern double Exp_Trail_Factor_III = 0.1;
bool gi_644 = TRUE;
string gs_648 = "";
string gs_656 = "";
int gi_664 = -1;
int gi_668 = 0;
double g_minlot_672 = 0.0;
double g_maxlot_680 = 0.0;
int g_leverage_688 = 0;
int g_lotsize_692 = 0;
double g_lotstep_696 = 0.0;
int g_datetime_704 = 0;
int g_datetime_708 = 0;
int gi_712;
int gi_716;
int gi_720 = 0;
int gi_724 = 1;
int gi_unused_728 = 3;
int gi_732 = 13;
int g_datetime_736 = 0;

int init() {
   gi_644 = TRUE;
   ea_validation = TRUE;
   Comment("");
   return (0);
}

int deinit() {
   Comment("");
   return (0);
}

int start() {
   double price_0;
   double price_8;
   double price_16;
   color color_32;
   string ls_48;
   int li_56;
   string ls_60;
   bool bool_68;
   bool bool_72;
   double ld_84;
   int ticket_364;
   int ticket_368;
   int ticket_372;
   double price_380;
   double price_388;
   double price_396;
   double price_404;
   double ld_412;
   double price_420;
   double price_428;
   double price_436;
   double ld_444;
   double price_452;
   string ls_500;
   double ld_40 = 1;
   if (gi_644) {
      gi_644 = FALSE;
      g_minlot_672 = MarketInfo(Symbol(), MODE_MINLOT);
      g_maxlot_680 = MarketInfo(Symbol(), MODE_MAXLOT);
      g_leverage_688 = AccountLeverage();
      g_lotsize_692 = MarketInfo(Symbol(), MODE_LOTSIZE);
      g_lotstep_696 = MarketInfo(Symbol(), MODE_LOTSTEP);
      gi_664 = -1;
   }
   if ((!IsTesting()) && IsStopped()) return (0);
   if ((!IsTesting()) && !IsTradeAllowed()) {
      Comment("Trading server: Trading is not Allowed ...");
      return (0);
   }
   if ((!IsTesting()) && IsTradeContextBusy()) {
      Comment("Trading server: Trade Context is Busy ...");
      return (0);
   }
   if (iATR(NULL, PERIOD_M5, 1, 1) < Point / 2.0) return (0);
   if (IsDllsAllowed() == FALSE) {
      Comment("Warning: Set Parameter **AllowDLL Imports** ON in menu Tools -> Options -> ExpertAdvisors.");
      Print("Warning: Set Parameter **AllowDLL Imports** ON in menu Tools -> Options -> ExpertAdvisors.");
      Alert("Warning: Set Parameter **AllowDLL Imports** ON in menu Tools -> Options -> ExpertAdvisors.");
      Sleep(30000);
      return (0);
   }
   /*if ((!ea_validation) && !IsTesting()) {
      if (IsDemo() == FALSE) ls_60 = "AccountType=2";
      else ls_60 = "AccountType=1";
      if (f0_4(gs_76 + "?AccountId=" + DoubleToStr(AccountNumber(), 0) + "&" + ls_60, ls_48)) {
         if (StringTrimRight(StringTrimLeft(f0_5(ls_48, 0, "<result>", "</result>", li_56))) == "OK") ea_validation = TRUE;
         else {
            Comment("Online validation is not passed. For more information, contact us at support@forex-combo.com!");
            Alert("Online validation is not passed. For more information, contact us at support@forex-combo.com!");
            Sleep(30000);
            return (0);
         }
      } else {
         Comment("\n Online validation failed (error number " + DoubleToStr(GetLastError(), 0) + "). Visit www.fxautomater.com for more information!");
         Alert("Online validation failed (error number " + DoubleToStr(GetLastError(), 0) + "). Visit www.fxautomater.com for more information!");
         Sleep(30000);
         return (0);
      }
   }*/
   if (gi_664 <= 0) {
      gi_664 = f0_6(AccountNumber(), IsTesting(), IsDemo(), WindowHandle(Symbol(), Period()), TimeCurrent());
      if (!IsTesting() && AutoGMT_Offset == TRUE) gi_668 = f0_17();
      else gi_668 = ManualGMT_Offset;
   }
   if (gi_664 <= 0 && ea_validation && (!IsTesting())) {
      Comment("DLL initialization is failed (" + DoubleToStr(gi_664, 0) + "). For more information, contact us at support@forex-combo.com!");
      Alert("DLL initialization is failed (" + DoubleToStr(gi_664, 0) + "). For more information, contact us at support@forex-combo.com!");
      Sleep(10000);
      return (0);
   }
   if (gi_664 <= 0 && IsTesting()) Print("DLL initialization is failed (" + DoubleToStr(gi_664, 0) + "). Please register you test account at forex-combo.com!");
   int stoplevel_76 = MarketInfo(Symbol(), MODE_STOPLEVEL);
   bool li_80 = TRUE;
   if (stoplevel_76 == 0 || Use_ECN_Execution == TRUE || Hidden_StopAndTarget == TRUE) li_80 = FALSE;
   if (Digits <= 3) ld_84 = 0.01;
   else ld_84 = 0.0001;
   double ld_92 = NormalizeDouble((Ask - Bid) / ld_84, 1);
   string ls_100 = "*** SPREAD OK ***";
   if (ld_92 > MaxSPREAD) ls_100 = "*** SPREAD IS TOO HIGH ***";
   gs_648 = "\n\n   Greenwich Mean Time : " + TimeToStr(TimeCurrent() - 3600 * gi_668, TIME_DATE|TIME_MINUTES|TIME_SECONDS) 
   + "\n   Broker Time : " + TimeToStr(TimeCurrent(), TIME_DATE|TIME_MINUTES|TIME_SECONDS);
   string ls_108 = "FX COMBO is running on your account - Validation OK";
   string ls_116 = "FX COMBO is set up for time zone GMT " + gi_668;
   string ls_124 = "Spread= " + DoubleToStr(ld_92, 1) + " pips";
   string ls_132 = "Account Balance= " + DoubleToStr(AccountBalance(), 2);
   string ls_140 = ls_100;
   Comment("\n\n\n\n\n   " + ls_108 + " \n   " + ls_116 + " \n   " + ls_124 + " \n   " + ls_132 + " \n\n   " + ls_140 + " " + gs_648 + " " + gs_656);
   ObjectCreate("klc", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("klc", "   FOREX COMBO SYSTEM ", 9, "System", Red);
   ObjectSet("klc", OBJPROP_CORNER, 0);
   ObjectSet("klc", OBJPROP_XDISTANCE, 0);
   ObjectSet("klc", OBJPROP_YDISTANCE, 29);
   ObjectCreate("klc2", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("klc2", "   by FXautomater ", 9, "System", Gray);
   ObjectSet("klc2", OBJPROP_CORNER, 0);
   ObjectSet("klc2", OBJPROP_XDISTANCE, 165);
   ObjectSet("klc2", OBJPROP_YDISTANCE, 29);
   ObjectCreate("klc3", OBJ_LABEL, 0, 0, 0);
   ObjectSetText("klc3", "   Copyright © www.fxautomater.com ", 9, "System", Gray);
   ObjectSet("klc3", OBJPROP_CORNER, 0);
   ObjectSet("klc3", OBJPROP_XDISTANCE, 0);
   ObjectSet("klc3", OBJPROP_YDISTANCE, 45);
   if (UseAgresiveMM != TRUE) {
      LossFactorSys1 = 1;
      LossFactorSys2 = 1;
      LossFactorSys3 = 1;
   }
   HideTestIndicators(TRUE);
   double iclose_148 = iClose(NULL, PERIOD_M15, 1);
   double ima_156 = iMA(NULL, PERIOD_M15, g_period_392, 0, MODE_SMMA, PRICE_CLOSE, 1);
   double iwpr_164 = iWPR(NULL, PERIOD_M15, g_period_400, 1);
   double iatr_172 = iATR(NULL, PERIOD_H1, g_period_460, 1);
   double ima_180 = iMA(NULL, PERIOD_H1, g_period_456, 0, MODE_EMA, PRICE_CLOSE, 1);
   double ld_188 = ima_180 + iatr_172 * gd_464;
   double ld_196 = ima_180 - iatr_172 * gd_464;
   double iclose_204 = iClose(NULL, PERIOD_M5, 1);
   double iatr_212 = iATR(NULL, PERIOD_M5, 5, 1);
   double iatr_220 = iATR(NULL, PERIOD_M5, g_period_600, 1);
   double ihigh_228 = iHigh(NULL, PERIOD_H1, 1);
   double ilow_236 = iLow(NULL, PERIOD_H1, 1);
   double ibands_244 = iBands(NULL, PERIOD_H1, g_period_612, 2, 0, PRICE_CLOSE, MODE_UPPER, 1);
   double ibands_252 = iBands(NULL, PERIOD_H1, g_period_612, 2, 0, PRICE_CLOSE, MODE_LOWER, 1);
   HideTestIndicators(FALSE);
   if (gi_416 < 0) f0_13(gi_416, gi_420);
   if (gi_516 < 0) f0_14(gi_516, gi_520, gi_524, gi_528, gi_532, gi_536, gi_540, gi_544, gi_548, gi_552, gi_556, gi_560);
   if (TakeProfit < stoplevel_76 * Point / ld_84) TakeProfit = stoplevel_76 * Point / ld_84;
   if (TakeProfit_II < stoplevel_76 * Point / ld_84) TakeProfit_II = stoplevel_76 * Point / ld_84;
   if (StopLoss < stoplevel_76 * Point / ld_84) StopLoss = stoplevel_76 * Point / ld_84;
   if (StopLoss_II < stoplevel_76 * Point / ld_84) StopLoss_II = stoplevel_76 * Point / ld_84;
   if (TakeProfit_III < stoplevel_76 * Point / ld_84) TakeProfit_III = stoplevel_76 * Point / ld_84;
   if (StopLoss_III < stoplevel_76 * Point / ld_84) StopLoss_III = stoplevel_76 * Point / ld_84;
   int li_260 = gi_416 + gi_668;
   int li_264 = gi_416 + gi_668;
   int li_268 = BegHourSys_III + gi_668;
   int li_272 = EndHourSys_III + gi_668;
   if (li_260 > 23) li_260 -= 24;
   if (li_260 < 0) li_260 += 24;
   if (li_268 > 23) li_268 -= 24;
   if (li_268 < 0) li_268 += 24;
   if (li_264 > 23) li_264 -= 24;
   if (li_264 < 0) li_264 += 24;
   if (li_272 > 23) li_272 -= 24;
   if (li_272 < 0) li_272 += 24;
   int li_276 = gi_516 + gi_668;
   int li_280 = gi_520 + gi_668;
   int li_284 = gi_524 + gi_668;
   int li_288 = gi_528 + gi_668;
   int li_292 = gi_532 + gi_668;
   int li_296 = gi_536 + gi_668;
   int li_300 = gi_540 + gi_668;
   int li_304 = gi_544 + gi_668;
   int li_308 = gi_548 + gi_668;
   int li_312 = gi_552 + gi_668;
   int li_316 = gi_556 + gi_668;
   int li_320 = gi_560 + gi_668;
   if (li_276 > 23) li_276 -= 24;
   if (li_276 < 0) li_276 += 24;
   if (li_280 > 23) li_280 -= 24;
   if (li_280 < 0) li_280 += 24;
   if (li_284 > 23) li_284 -= 24;
   if (li_284 < 0) li_284 += 24;
   if (li_288 > 23) li_288 -= 24;
   if (li_288 < 0) li_288 += 24;
   if (li_292 > 23) li_292 -= 24;
   if (li_292 < 0) li_292 += 24;
   if (li_296 > 23) li_296 -= 24;
   if (li_296 < 0) li_296 += 24;
   if (li_300 > 23) li_300 -= 24;
   if (li_300 < 0) li_300 += 24;
   if (li_304 > 23) li_304 -= 24;
   if (li_304 < 0) li_304 += 24;
   if (li_308 > 23) li_308 -= 24;
   if (li_308 < 0) li_308 += 24;
   if (li_312 > 23) li_312 -= 24;
   if (li_312 < 0) li_312 += 24;
   if (li_316 > 23) li_316 -= 24;
   if (li_316 < 0) li_316 += 24;
   if (li_320 > 23) li_320 -= 24;
   if (li_320 < 0) li_320 += 24;
   Slippage = Slippage * ld_84;
   int count_324 = 0;
   int count_328 = 0;
   int count_332 = 0;
   int count_336 = 0;
   int count_340 = 0;
   int count_344 = 0;
   int datetime_348 = g_datetime_704;
   int li_352 = g_datetime_704 + gi_480;
   int datetime_356 = g_datetime_708;
   int li_360 = g_datetime_708 + gi_588;
   for (int pos_376 = OrdersTotal() - 1; pos_376 >= 0; pos_376--) {
      if (!OrderSelect(pos_376, SELECT_BY_POS, MODE_TRADES)) Print("Error in OrderSelect! Position:", pos_376);
      else {
         if (OrderType() <= OP_SELL && OrderSymbol() == Symbol()) {
            if (OrderMagicNumber() == Magic1) {
               if (OrderType() == OP_BUY) {
                  if (OrderStopLoss() == 0.0 && Hidden_StopAndTarget == FALSE) {
                     price_380 = NormalizeDouble(OrderOpenPrice() - StopLoss * ld_84, Digits);
                     price_388 = NormalizeDouble(OrderOpenPrice() + TakeProfit * ld_84, Digits);
                     OrderModify(OrderTicket(), OrderOpenPrice(), price_380, price_388, 0, Green);
                  }
                  if ((f0_8(gi_664, iwpr_164, OSC_close) == 0 && Bid > iclose_148 + gi_412 * ld_84) || Bid >= OrderOpenPrice() + TakeProfit * ld_84 || Bid <= OrderOpenPrice() - StopLoss * ld_84) {
                     RefreshRates();
                     OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, Digits), Slippage, Violet);
                     Sleep(5000);
                  } else count_324++;
               } else {
                  if (OrderStopLoss() == 0.0 && Hidden_StopAndTarget == FALSE) {
                     price_380 = NormalizeDouble(OrderOpenPrice() + StopLoss * ld_84, Digits);
                     price_388 = NormalizeDouble(OrderOpenPrice() - TakeProfit * ld_84, Digits);
                     OrderModify(OrderTicket(), OrderOpenPrice(), price_380, price_388, 0, Green);
                  }
                  if ((f0_8(gi_664, iwpr_164, OSC_close) == 1 && Bid < iclose_148 - gi_412 * ld_84) || Ask <= OrderOpenPrice() - TakeProfit * ld_84 || Ask >= OrderOpenPrice() + StopLoss * ld_84) {
                     RefreshRates();
                     OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, Digits), Slippage, Violet);
                     Sleep(5000);
                  } else count_328++;
               }
            }
            if (OrderMagicNumber() == Magic2) {
               if (OrderType() == OP_BUY) {
                  if (OrderStopLoss() == 0.0 && Hidden_StopAndTarget == FALSE) {
                     price_396 = NormalizeDouble(OrderOpenPrice() - StopLoss_II * ld_84, Digits);
                     price_404 = NormalizeDouble(OrderOpenPrice() + TakeProfit_II * ld_84, Digits);
                     OrderModify(OrderTicket(), OrderOpenPrice(), price_396, price_404, 0, Green);
                  }
                  if ((f0_10(gi_664, iclose_204, ld_196, ld_188, Break * ld_84) == 0 && TimeCurrent() - OrderOpenTime() > 3600) || Bid >= OrderOpenPrice() + TakeProfit_II * ld_84 ||
                     Bid <= OrderOpenPrice() - StopLoss_II * ld_84) {
                     RefreshRates();
                     OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, Digits), Slippage, Violet);
                     Sleep(5000);
                  } else count_332++;
                  if (TimeCurrent() >= li_352) {
                     if (Use_Exp_Trailing_II) {
                        ld_412 = f0_15(Exp_Trail_Factor_II * ld_84, OrderOpenPrice(), iHigh(NULL, PERIOD_M5, iHighest(NULL, PERIOD_M5, MODE_HIGH, iBarShift(NULL, PERIOD_M5, OrderOpenTime()) +
                           1, 0)));
                     } else ld_412 = iatr_172 * ATRTrailingFactor2;
                     if (ld_412 > MaxPipsTrailing2 * ld_84) ld_412 = MaxPipsTrailing2 * ld_84;
                     if (ld_412 < MinPipsTrailing2 * ld_84) ld_412 = MinPipsTrailing2 * ld_84;
                     if (Bid - OrderOpenPrice() > F_TrailingProfit_II * ld_84 && (!Use_Exp_Trailing_II)) ld_412 = F_Trailing_II * ld_84;
                     price_420 = NormalizeDouble(Bid - ld_412, Digits);
                     if (Hidden_StopAndTarget) {
                        if (TimeCurrent() - OrderOpenTime() > 60 && Bid <= MathMax(OrderOpenPrice() - StopLoss_II * ld_84, iHigh(NULL, PERIOD_M5, iHighest(NULL, PERIOD_M5, MODE_HIGH, iBarShift(NULL,
                           PERIOD_M5, OrderOpenTime()) + 1, 0)) - ld_412) && iHigh(NULL, PERIOD_M5, iHighest(NULL, PERIOD_M5, MODE_HIGH, iBarShift(NULL, PERIOD_M5, OrderOpenTime()) + 1, 0)) - OrderOpenPrice() > ld_412) {
                           RefreshRates();
                           OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, Digits), Slippage, Violet);
                           Sleep(5000);
                        }
                     } else {
                        if (Bid - OrderOpenPrice() > ld_412) {
                           if (OrderStopLoss() <= price_420 - Point) {
                              bool_68 = OrderModify(OrderTicket(), OrderOpenPrice(), price_420, OrderTakeProfit(), 0, Blue);
                              if (bool_68) {
                                 datetime_348 = TimeCurrent();
                                 g_datetime_704 = datetime_348;
                              }
                           }
                        }
                     }
                  }
               } else {
                  if (OrderStopLoss() == 0.0 && Hidden_StopAndTarget == FALSE) {
                     price_396 = NormalizeDouble(OrderOpenPrice() + StopLoss_II * ld_84, Digits);
                     price_404 = NormalizeDouble(OrderOpenPrice() - TakeProfit_II * ld_84, Digits);
                     OrderModify(OrderTicket(), OrderOpenPrice(), price_396, price_404, 0, Green);
                  }
                  if ((f0_10(gi_664, iclose_204, ld_196, ld_188, Break * ld_84) == 1 && TimeCurrent() - OrderOpenTime() > 3600) || Ask <= OrderOpenPrice() - TakeProfit_II * ld_84 ||
                     Ask >= OrderOpenPrice() + StopLoss_II * ld_84) {
                     RefreshRates();
                     OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, Digits), Slippage, Violet);
                     Sleep(5000);
                  } else count_336++;
                  if (TimeCurrent() >= li_352) {
                     if (Use_Exp_Trailing_II) {
                        ld_412 = f0_16(Exp_Trail_Factor_II * ld_84, OrderOpenPrice(), iLow(NULL, PERIOD_M5, iLowest(NULL, PERIOD_M5, MODE_LOW, iBarShift(NULL, PERIOD_M5, OrderOpenTime()) +
                           1, 0)) + Ask - Bid);
                     } else ld_412 = iatr_172 * ATRTrailingFactor2;
                     if (ld_412 > MaxPipsTrailing2 * ld_84) ld_412 = MaxPipsTrailing2 * ld_84;
                     if (ld_412 < MinPipsTrailing2 * ld_84) ld_412 = MinPipsTrailing2 * ld_84;
                     if (OrderOpenPrice() - Ask > F_TrailingProfit_II * ld_84 && (!Use_Exp_Trailing_II)) ld_412 = F_Trailing_II * ld_84;
                     price_420 = NormalizeDouble(Ask + ld_412, Digits);
                     if (Hidden_StopAndTarget) {
                        if (TimeCurrent() - OrderOpenTime() > 60 && Ask >= Ask - Bid + MathMin(OrderOpenPrice() + StopLoss_II * ld_84, iLow(NULL, PERIOD_M5, iLowest(NULL, PERIOD_M5, MODE_LOW,
                           iBarShift(NULL, PERIOD_M5, OrderOpenTime()) + 1, 0)) + ld_412) && OrderOpenPrice() - (iLow(NULL, PERIOD_M5, iLowest(NULL, PERIOD_M5, MODE_LOW, iBarShift(NULL, PERIOD_M5,
                           OrderOpenTime()) + 1, 0)) + Ask - Bid) > ld_412) {
                           RefreshRates();
                           OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, Digits), Slippage, Violet);
                           Sleep(5000);
                        }
                     } else {
                        if (OrderOpenPrice() - Ask > ld_412) {
                           if (OrderStopLoss() >= price_420 + Point) {
                              bool_68 = OrderModify(OrderTicket(), OrderOpenPrice(), price_420, OrderTakeProfit(), 0, Red);
                              if (bool_68) {
                                 datetime_348 = TimeCurrent();
                                 g_datetime_704 = datetime_348;
                              }
                           }
                        }
                     }
                  }
               }
            }
            if (OrderMagicNumber() == Magic3) {
               if (OrderType() == OP_BUY) {
                  if (OrderStopLoss() == 0.0 && Hidden_StopAndTarget == FALSE) {
                     price_428 = NormalizeDouble(OrderOpenPrice() - StopLoss_III * ld_84, Digits);
                     price_436 = NormalizeDouble(OrderOpenPrice() + TakeProfit_III * ld_84, Digits);
                     OrderModify(OrderTicket(), OrderOpenPrice(), price_428, price_436, 0, Green);
                  }
                  if (((li_268 <= li_272 && TimeHour(TimeCurrent()) >= li_268 && TimeHour(TimeCurrent()) <= li_272) || (li_268 > li_272 && TimeHour(TimeCurrent()) >= li_268 || TimeHour(TimeCurrent()) <= li_272) &&
                     f0_12(gi_664, ibands_244, ibands_252, gi_620 * ld_84, ihigh_228, ilow_236, gi_616 * ld_84) == 0 && TimeCurrent() - OrderOpenTime() > 7200) || Bid >= OrderOpenPrice() +
                     TakeProfit_III * ld_84 || Bid <= OrderOpenPrice() - StopLoss_III * ld_84) {
                     RefreshRates();
                     OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, Digits), Slippage, Violet);
                     Sleep(5000);
                  } else count_340++;
                  if (TimeCurrent() < li_360) continue;
                  if (Use_Exp_Trailing_III) ld_444 = Exp_Trail_Factor_III * ld_84 / (iHigh(NULL, PERIOD_M5, iHighest(NULL, PERIOD_M5, MODE_HIGH, iBarShift(NULL, PERIOD_M5, OrderOpenTime()) + 1, 0)) - OrderOpenPrice());
                  else ld_444 = iatr_220 * gd_604;
                  if (ld_444 > MaxPipsTrailing3 * ld_84) ld_444 = MaxPipsTrailing3 * ld_84;
                  if (ld_444 < MinPipsTrailing3 * ld_84) ld_444 = MinPipsTrailing3 * ld_84;
                  if (Bid - OrderOpenPrice() > F_TrailingProfit_III * ld_84 && (!Use_Exp_Trailing_III)) ld_444 = F_Trailing_III * ld_84;
                  price_452 = NormalizeDouble(Bid - ld_444, Digits);
                  if (Hidden_StopAndTarget) {
                     if (TimeCurrent() - OrderOpenTime() > 300 && Bid <= MathMax(OrderOpenPrice() - StopLoss_III * ld_84, iHigh(NULL, PERIOD_M5, iHighest(NULL, PERIOD_M5, MODE_HIGH, iBarShift(NULL,
                        PERIOD_M5, OrderOpenTime()) + 1, 0)) - ld_444) && iHigh(NULL, PERIOD_M5, iHighest(NULL, PERIOD_M5, MODE_HIGH, iBarShift(NULL, PERIOD_M5, OrderOpenTime()) + 1, 0)) - OrderOpenPrice() > ld_444) {
                        RefreshRates();
                        OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, Digits), Slippage, Violet);
                        Sleep(5000);
                     }
                  } else {
                     if (Bid - OrderOpenPrice() > ld_444) {
                        if (OrderStopLoss() <= price_452 - Point) {
                           bool_72 = OrderModify(OrderTicket(), OrderOpenPrice(), price_452, OrderTakeProfit(), 0, Blue);
                           if (bool_72) {
                              datetime_356 = TimeCurrent();
                              g_datetime_708 = datetime_356;
                              continue;
                           }
                        }
                     }
                  }
               }
               if (OrderStopLoss() == 0.0 && Hidden_StopAndTarget == FALSE) {
                  price_428 = NormalizeDouble(OrderOpenPrice() + StopLoss_III * ld_84, Digits);
                  price_436 = NormalizeDouble(OrderOpenPrice() - TakeProfit_III * ld_84, Digits);
                  OrderModify(OrderTicket(), OrderOpenPrice(), price_428, price_436, 0, Green);
               }
               if (((li_268 <= li_272 && TimeHour(TimeCurrent()) >= li_268 && TimeHour(TimeCurrent()) <= li_272) || (li_268 > li_272 && TimeHour(TimeCurrent()) >= li_268 || TimeHour(TimeCurrent()) <= li_272) &&
                  f0_12(gi_664, ibands_244, ibands_252, gi_620 * ld_84, ihigh_228, ilow_236, gi_616 * ld_84) == 1 && TimeCurrent() - OrderOpenTime() > 7200) || Ask <= OrderOpenPrice() - TakeProfit_III * ld_84 ||
                  Ask >= OrderOpenPrice() + StopLoss_III * ld_84) {
                  RefreshRates();
                  OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, Digits), Slippage, Violet);
                  Sleep(5000);
               } else count_344++;
               if (TimeCurrent() >= li_360) {
                  if (Use_Exp_Trailing_III) {
                     ld_444 = Exp_Trail_Factor_III * ld_84 / (OrderOpenPrice() - (iLow(NULL, PERIOD_M5, iLowest(NULL, PERIOD_M5, MODE_LOW, iBarShift(NULL, PERIOD_M5, OrderOpenTime()) +
                        1, 0)) + Ask - Bid));
                  } else ld_444 = iatr_220 * gd_604;
                  if (ld_444 > MaxPipsTrailing3 * ld_84) ld_444 = MaxPipsTrailing3 * ld_84;
                  if (ld_444 < MinPipsTrailing3 * ld_84) ld_444 = MinPipsTrailing3 * ld_84;
                  if (OrderOpenPrice() - Ask > F_TrailingProfit_III * ld_84 && (!Use_Exp_Trailing_III)) ld_444 = F_Trailing_III * ld_84;
                  price_452 = NormalizeDouble(Ask + ld_444, Digits);
                  if (Hidden_StopAndTarget) {
                     if (!(TimeCurrent() - OrderOpenTime() > 300 && Ask >= Ask - Bid + MathMin(OrderOpenPrice() + StopLoss_III * ld_84, iLow(NULL, PERIOD_M5, iLowest(NULL, PERIOD_M5,
                        MODE_LOW, iBarShift(NULL, PERIOD_M5, OrderOpenTime()) + 1, 0)) + ld_444) && OrderOpenPrice() - (iLow(NULL, PERIOD_M5, iLowest(NULL, PERIOD_M5, MODE_LOW, iBarShift(NULL,
                        PERIOD_M5, OrderOpenTime()) + 1, 0)) + Ask - Bid) > ld_444)) continue;
                     RefreshRates();
                     OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, Digits), Slippage, Violet);
                     Sleep(5000);
                     continue;
                  }
                  if (OrderOpenPrice() - Ask > ld_444) {
                     if (OrderStopLoss() >= price_452 + Point) {
                        bool_72 = OrderModify(OrderTicket(), OrderOpenPrice(), price_452, OrderTakeProfit(), 0, Red);
                        if (bool_72) {
                           datetime_356 = TimeCurrent();
                           g_datetime_708 = datetime_356;
                        }
                     }
                  }
               }
            }
         }
      }
   }
   double ld_460 = 0;
   if (StringSubstr(AccountCurrency(), 0, 3) == "JPY") {
      ld_460 = MarketInfo("USDJPY" + StringSubstr(Symbol(), 6), MODE_BID);
      if (ld_460 > 0.1) ld_40 = ld_460;
      else ld_40 = 84;
   }
   if (StringSubstr(AccountCurrency(), 0, 3) == "GBP") {
      ld_460 = MarketInfo("GBPUSD" + StringSubstr(Symbol(), 6), MODE_BID);
      if (ld_460 > 0.1) ld_40 = 1 / ld_460;
      else ld_40 = 0.6211180124;
   }
   if (StringSubstr(AccountCurrency(), 0, 3) == "EUR") {
      ld_460 = MarketInfo("EURUSD" + StringSubstr(Symbol(), 6), MODE_BID);
      if (ld_460 > 0.1) ld_40 = 1 / ld_460;
      else ld_40 = 0.7042253521;
   }
   if (EMAIL_Notification == TRUE) f0_19();
   bool li_468 = TRUE;
   bool li_472 = TRUE;
   if (No_Hedge_Trades == TRUE && count_328 > 0 || count_336 > 0 || count_344 > 0) li_468 = FALSE;
   if (No_Hedge_Trades == TRUE && count_324 > 0 || count_332 > 0 || count_340 > 0) li_472 = FALSE;
   if (NFA_Compatibility == TRUE && count_328 > 0 || count_336 > 0 || count_344 > 0 || count_324 > 0 || count_332 > 0 || count_340 > 0) {
      li_468 = FALSE;
      li_472 = FALSE;
   }
   double lots_476 = MathMin(g_maxlot_680, MathMax(g_minlot_672, LotsSys1));
   if (TradeMMSys1 > 0.0) lots_476 = MathMax(g_minlot_672, MathMin(g_maxlot_680, NormalizeDouble(f0_0() / ld_40 / 100.0 * AccountFreeMargin() / g_lotstep_696 / (g_lotsize_692 / 100), 0) * g_lotstep_696));
   if (lots_476 > MaximalLots) lots_476 = MaximalLots;
   double lots_484 = MathMin(g_maxlot_680, MathMax(g_minlot_672, LotsSys2));
   if (TradeMMSys2 > 0.0) lots_484 = MathMax(g_minlot_672, MathMin(g_maxlot_680, NormalizeDouble(f0_1() / ld_40 / 100.0 * AccountFreeMargin() / g_lotstep_696 / (g_lotsize_692 / 100), 0) * g_lotstep_696));
   if (lots_484 > MaximalLots) lots_484 = MaximalLots;
   double lots_492 = MathMin(g_maxlot_680, MathMax(g_minlot_672, LotsSys3));
   if (TradeMMSys3 > 0.0) lots_492 = MathMax(g_minlot_672, MathMin(g_maxlot_680, NormalizeDouble(f0_2() / ld_40 / 100.0 * AccountFreeMargin() / g_lotstep_696 / (g_lotsize_692 / 100), 0) * g_lotstep_696));
   if (lots_492 > MaximalLots) lots_492 = MaximalLots;
   gs_656 = "\n\n   LOTS Sys1 : " + DoubleToStr(lots_476, 2) 
      + "\n   LOTS Sys2 : " + DoubleToStr(lots_484, 2) 
   + "\n   LOTS Sys3 : " + DoubleToStr(lots_492, 2);
   int cmd_36 = -1;
   if (Use_FXCOMBO_Scalping != FALSE) {
      if (count_324 < 1 && li_468 && f0_7(gi_664, iclose_148, ima_156, TREND_STR * ld_84, iwpr_164, OSC_open, gi_424, Hour(), li_260, li_264) == 0 && Bid < iclose_148 - gi_412 * ld_84) {
         if (ld_92 > MaxSPREAD) Print("System 1 BUY not taken due to high spead!");
         else {
            ls_500 = "BUY";
            cmd_36 = 0;
            color_32 = Aqua;
            RefreshRates();
            price_0 = NormalizeDouble(Ask, Digits);
            price_8 = price_0 - StopLoss * ld_84;
            price_16 = price_0 + TakeProfit * ld_84;
         }
      }
      if (count_328 < 1 && li_472 && f0_7(gi_664, iclose_148, ima_156, TREND_STR * ld_84, iwpr_164, OSC_open, gi_424, Hour(), li_260, li_264) == 1 && Bid > iclose_148 +
         gi_412 * ld_84) {
         if (ld_92 > MaxSPREAD) Print("System 1 SELL not taken due to high spead!");
         else {
            ls_500 = "SELL";
            cmd_36 = 1;
            color_32 = Red;
            RefreshRates();
            price_0 = NormalizeDouble(Bid, Digits);
            price_8 = price_0 + StopLoss * ld_84;
            price_16 = price_0 - TakeProfit * ld_84;
         }
      }
   }
   if (cmd_36 >= OP_BUY) {
      if (li_80 == FALSE) ticket_364 = OrderSend(Symbol(), cmd_36, lots_476, price_0, Slippage, 0, 0, CommentSys1, Magic1, 0, color_32);
      else ticket_364 = OrderSend(Symbol(), cmd_36, lots_476, price_0, Slippage, price_8, price_16, CommentSys1, Magic1, 0, color_32);
      Sleep(5000);
      if (ticket_364 > 0) {
         if (OrderSelect(ticket_364, SELECT_BY_TICKET, MODE_TRADES)) Print("Order " + ls_500 + " opened!: ", OrderOpenPrice());
      } else Print("Error opening " + ls_500 + " order!: ", GetLastError());
   }
   cmd_36 = -1;
   if (!(TimeHour(TimeCurrent()) != li_276 && TimeHour(TimeCurrent()) != li_280 && TimeHour(TimeCurrent()) != li_284 && TimeHour(TimeCurrent()) != li_288 && TimeHour(TimeCurrent()) != li_292 &&
      TimeHour(TimeCurrent()) != li_296 && TimeHour(TimeCurrent()) != li_300 && TimeHour(TimeCurrent()) != li_304 && TimeHour(TimeCurrent()) != li_308 && TimeHour(TimeCurrent()) != li_312 && TimeHour(TimeCurrent()) != li_316) ||
      !(TimeHour(TimeCurrent()) != li_320)) {
      if (Use_FXCOMBO_Breakout != FALSE) {
         if (DayOfWeek() != gi_512) {
            if (f0_18()) {
               if (count_336 < 1 && li_472 && f0_9(gi_664, iclose_204, ld_196, ld_188, Break * ld_84, Bid, (Break - 3) * ld_84) == 1) {
                  if (ld_92 > MaxSPREAD) Print("System 2 SELL not taken due to high spead!");
                  else {
                     ls_500 = "SELL";
                     cmd_36 = 1;
                     color_32 = Yellow;
                     RefreshRates();
                     price_0 = NormalizeDouble(Bid, Digits);
                     price_8 = price_0 + StopLoss_II * ld_84;
                     price_16 = price_0 - TakeProfit_II * ld_84;
                  }
               }
               if (count_332 < 1 && li_468 && f0_9(gi_664, iclose_204, ld_196, ld_188, Break * ld_84, Bid, (Break - 3) * ld_84) == 0) {
                  if (ld_92 > MaxSPREAD) Print("System 2 BUY not taken due to high spead!");
                  else {
                     ls_500 = "BUY";
                     cmd_36 = 0;
                     color_32 = DodgerBlue;
                     RefreshRates();
                     price_0 = NormalizeDouble(Ask, Digits);
                     price_8 = price_0 - StopLoss_II * ld_84;
                     price_16 = price_0 + TakeProfit_II * ld_84;
                  }
               }
            }
         }
      }
   }
   if (cmd_36 >= OP_BUY) {
      if (li_80 == FALSE) ticket_368 = OrderSend(Symbol(), cmd_36, lots_484, price_0, Slippage, 0, 0, CommentSys2, Magic2, 0, color_32);
      else ticket_368 = OrderSend(Symbol(), cmd_36, lots_484, price_0, Slippage, price_8, price_16, CommentSys2, Magic2, 0, color_32);
      Sleep(5000);
      if (ticket_368 > 0) {
         if (OrderSelect(ticket_368, SELECT_BY_TICKET, MODE_TRADES)) Print("Order " + ls_500 + " opened!: ", OrderOpenPrice());
      } else Print("Error opening " + ls_500 + " order!: ", GetLastError());
   }
   cmd_36 = -1;
   if (Use_FXCOMBO_Reversal != FALSE) {
      if (count_340 < 1 && li_468 && (li_268 <= li_272 && TimeHour(TimeCurrent()) >= li_268 && TimeHour(TimeCurrent()) <= li_272) || (li_268 > li_272 && TimeHour(TimeCurrent()) >= li_268 ||
         TimeHour(TimeCurrent()) <= li_272) && f0_11(gi_664, ibands_244, ibands_252, gi_620 * ld_84, ihigh_228, ilow_236, gi_616 * ld_84) == 0) {
         if (ld_92 > MaxSPREAD) Print("System 3 BUY not taken due to high spead!");
         else {
            ls_500 = "BUY";
            cmd_36 = 0;
            color_32 = Aqua;
            RefreshRates();
            price_0 = NormalizeDouble(Ask, Digits);
            price_8 = price_0 - StopLoss_III * ld_84;
            price_16 = price_0 + TakeProfit_III * ld_84;
         }
      }
      if (count_344 < 1 && li_472 && (li_268 <= li_272 && TimeHour(TimeCurrent()) >= li_268 && TimeHour(TimeCurrent()) <= li_272) || (li_268 > li_272 && TimeHour(TimeCurrent()) >= li_268 ||
         TimeHour(TimeCurrent()) <= li_272) && f0_11(gi_664, ibands_244, ibands_252, gi_620 * ld_84, ihigh_228, ilow_236, gi_616 * ld_84) == 1) {
         if (ld_92 > MaxSPREAD) Print("System 3 SELL not taken due to high spead!");
         else {
            ls_500 = "SELL";
            cmd_36 = 1;
            color_32 = DeepPink;
            RefreshRates();
            price_0 = NormalizeDouble(Bid, Digits);
            price_8 = price_0 + StopLoss_III * ld_84;
            price_16 = price_0 - TakeProfit_III * ld_84;
         }
      }
   }
   if (cmd_36 >= OP_BUY) {
      if (li_80 == FALSE) ticket_372 = OrderSend(Symbol(), cmd_36, lots_492, price_0, Slippage, 0, 0, CommentSys3, Magic3, 0, color_32);
      else ticket_372 = OrderSend(Symbol(), cmd_36, lots_492, price_0, Slippage, price_8, price_16, CommentSys3, Magic3, 0, color_32);
      Sleep(5000);
      if (ticket_372 > 0) {
         if (OrderSelect(ticket_372, SELECT_BY_TICKET, MODE_TRADES)) Print("Order " + ls_500 + " opened!: ", OrderOpenPrice());
      } else Print("Error opening " + ls_500 + " order!: ", GetLastError());
   }
   return (0);
}

double f0_0() {
   int li_8;
   double ld_16;
   double ld_ret_0 = TradeMMSys1;
   int li_12 = 0;
   if (Digits <= 3) ld_16 = 0.01;
   else ld_16 = 0.0001;
   for (int hist_total_24 = OrdersHistoryTotal(); hist_total_24 >= 0; hist_total_24--) {
      if (OrderSelect(hist_total_24, SELECT_BY_POS, MODE_HISTORY)) {
         if (OrderType() <= OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic1) {
            if (OrderProfit() > 0.0) {
               if (gi_260 == 0) break;
               if (MathAbs(OrderClosePrice() - OrderOpenPrice()) / ld_16 > gi_260) break;
               continue;
            }
            li_12++;
         }
      }
   }
   if (li_12 > gi_252 && gi_256 > 1) {
      li_8 = MathMod(li_12, gi_256);
      ld_ret_0 *= MathPow(LossFactorSys1, li_8);
   }
   if (MMMax > 0.0 && ld_ret_0 > MMMax) ld_ret_0 = MMMax;
   return (ld_ret_0);
}

double f0_1() {
   int li_8;
   double ld_16;
   double ld_ret_0 = TradeMMSys2;
   int li_12 = 0;
   if (Digits <= 3) ld_16 = 0.01;
   else ld_16 = 0.0001;
   for (int hist_total_24 = OrdersHistoryTotal(); hist_total_24 >= 0; hist_total_24--) {
      if (OrderSelect(hist_total_24, SELECT_BY_POS, MODE_HISTORY)) {
         if (OrderType() <= OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic2) {
            if (OrderProfit() > 0.0) {
               if (gi_304 == 0) break;
               if (MathAbs(OrderClosePrice() - OrderOpenPrice()) / ld_16 > gi_304) break;
               continue;
            }
            li_12++;
         }
      }
   }
   if (li_12 > gi_296 && gi_300 > 1) {
      li_8 = MathMod(li_12, gi_300);
      ld_ret_0 *= MathPow(LossFactorSys2, li_8);
   }
   if (MMMax > 0.0 && ld_ret_0 > MMMax) ld_ret_0 = MMMax;
   return (ld_ret_0);
}

double f0_2() {
   int li_8;
   double ld_16;
   double ld_ret_0 = TradeMMSys3;
   int li_12 = 0;
   if (Digits <= 3) ld_16 = 0.01;
   else ld_16 = 0.0001;
   for (int hist_total_24 = OrdersHistoryTotal(); hist_total_24 >= 0; hist_total_24--) {
      if (OrderSelect(hist_total_24, SELECT_BY_POS, MODE_HISTORY)) {
         if (OrderType() <= OP_SELL && OrderSymbol() == Symbol() && OrderMagicNumber() == Magic3) {
            if (OrderProfit() > 0.0) {
               if (gi_348 == 0) break;
               if (MathAbs(OrderClosePrice() - OrderOpenPrice()) / ld_16 > gi_348) break;
               continue;
            }
            li_12++;
         }
      }
   }
   if (li_12 > gi_340 && gi_344 > 1) {
      li_8 = MathMod(li_12, gi_344);
      ld_ret_0 *= MathPow(LossFactorSys3, li_8);
   }
   if (MMMax > 0.0 && ld_ret_0 > MMMax) ld_ret_0 = MMMax;
   return (ld_ret_0);
}
/*
int f0_3(bool ai_0) {
   string ls_4;
   if (gi_712 == 0) {
      ls_4 = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Q312461)";
      gi_712 = InternetOpenA(ls_4, gi_720, "0", "0", 0);
      gi_716 = InternetOpenA(ls_4, gi_724, "0", "0", 0);
   }
   if (ai_0) return (gi_716);
   return (gi_712);
}

int f0_4(string as_0, string &as_8) {
   int lia_24[] = {1};
   string ls_28 = "x";
   int li_16 = InternetOpenUrlA(f0_3(0), as_0, "0", 0, -2080374528, 0);
   if (li_16 == 0) return (0);
   int li_20 = InternetReadFile(li_16, ls_28, gi_732, lia_24);
   if (li_20 == 0) return (0);
   int li_36 = lia_24[0];
   for (as_8 = StringSubstr(ls_28, 0, lia_24[0]); lia_24[0] != 0; as_8 = as_8 + StringSubstr(ls_28, 0, lia_24[0])) {
      li_20 = InternetReadFile(li_16, ls_28, gi_732, lia_24);
      if (lia_24[0] == 0) break;
      li_36 += lia_24[0];
   }
   li_20 = InternetCloseHandle(li_16);
   if (li_20 == 0) return (0);
   return (1);
}*/

/*string f0_5(string as_0, int ai_8, string as_12, string as_20, int &ai_28) {
   int li_40;
   string ls_ret_32 = "";
   ai_28 = StringFind(as_0, as_12, ai_8);
   if (ai_28 != -1) {
      ai_28 += StringLen(as_12);
      li_40 = StringFind(as_0, as_20, ai_28 + 1);
      ls_ret_32 = StringTrimLeft(StringTrimRight(StringSubstr(as_0, ai_28, li_40 - ai_28)));
   }
   return (ls_ret_32);
}*/

int f0_6(int ai_0, int ai_4, int ai_8, int ai_12, int ai_16) {
   return (dllInit(ai_0, ai_4, ai_8, ai_12, ai_16));
}

int f0_7(int ai_0, double ad_4, double ad_12, double ad_20, double ad_28, double ad_36, double ad_44, int ai_52, int ai_56, int ai_60) {
   return (dllOpenCond1(ai_0, ad_4, ad_12, ad_20, ad_28, ad_36, ad_44, ai_52, ai_56, ai_60));
}

int f0_8(int ai_0, double ad_4, double ad_12) {
   return (dllCloseCond1(ai_0, ad_4, ad_12));
}

int f0_9(int ai_0, double ad_4, double ad_12, double ad_20, double ad_28, double ad_36, double ad_44) {
   return (dllOpenCond2(ai_0, ad_4, ad_12, ad_20, ad_28, ad_36, ad_44));
}

int f0_10(int ai_0, double ad_4, double ad_12, double ad_20, double ad_28) {
   return (dllCloseCond2(ai_0, ad_4, ad_12, ad_20, ad_28));
}

int f0_11(int ai_0, double ad_4, double ad_12, double ad_20, double ad_28, double ad_36, double ad_44) {
   return (dllOpenCond3(ai_0, ad_4, ad_12, ad_20, ad_28, ad_36, ad_44));
}

int f0_12(int ai_0, double ad_4, double ad_12, double ad_20, double ad_28, double ad_36, double ad_44) {
   return (dllCloseCond3(ai_0, ad_4, ad_12, ad_20, ad_28, ad_36, ad_44));
}

void f0_13(int &ai_0, int &ai_4) {
   ai_0 = dllParamInit1(1);
   ai_4 = dllParamInit1(2);
}

void f0_14(int &ai_0, int &ai_4, int &ai_8, int &ai_12, int &ai_16, int &ai_20, int &ai_24, int &ai_28, int &ai_32, int &ai_36, int &ai_40, int &ai_44) {
   ai_0 = dllParamInit2(1);
   ai_4 = dllParamInit2(2);
   ai_8 = dllParamInit2(3);
   ai_12 = dllParamInit2(4);
   ai_16 = dllParamInit2(5);
   ai_20 = dllParamInit2(6);
   ai_24 = dllParamInit2(7);
   ai_28 = dllParamInit2(8);
   ai_32 = dllParamInit2(9);
   ai_36 = dllParamInit2(10);
   ai_40 = dllParamInit2(11);
   ai_44 = dllParamInit2(12);
}

double f0_15(double ad_0, double ad_8, double ad_16) {
   return (dllExpTrailLong(ad_0, ad_8, ad_16));
}

double f0_16(double ad_0, double ad_8, double ad_16) {
   return (dllExpTrailShort(ad_0, ad_8, ad_16));
}

int f0_17() {
   return (dllGMTOffset());
}

bool f0_18() {
   double ld_4;
   int datetime_12;
   bool li_ret_0 = TRUE;
   if (Digits <= 3) ld_4 = 0.01;
   else ld_4 = 0.0001;
   if (gi_504 > 0 && gi_508 > 0) {
      datetime_12 = 0;
      for (int pos_16 = OrdersHistoryTotal() - 1; pos_16 >= 0; pos_16--) {
         if (OrderSelect(pos_16, SELECT_BY_POS, MODE_HISTORY)) {
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == Magic2) {
               if ((OrderType() == OP_BUY && (OrderClosePrice() - OrderOpenPrice()) / ld_4 <= (-gi_504)) || (OrderType() == OP_SELL && (OrderOpenPrice() - OrderClosePrice()) / ld_4 <= (-gi_504))) {
                  datetime_12 = OrderCloseTime();
                  break;
               }
            }
         }
      }
      if (TimeCurrent() - datetime_12 < 60 * gi_508) li_ret_0 = FALSE;
   }
   return (li_ret_0);
}

void f0_19() {
   string ls_0;
   string ls_8;
   bool li_16 = FALSE;
   if (IsTesting() || EMAIL_Notification == FALSE) return;
   if (g_datetime_736 == 0) {
      g_datetime_736 = TimeCurrent();
      return;
   }
   if (g_datetime_736 != TimeCurrent()) {
      for (int pos_20 = 0; pos_20 <= OrdersTotal() - 1; pos_20++) {
         if (OrderSelect(pos_20, SELECT_BY_POS, MODE_TRADES)) {
            if (OrderType() <= OP_SELL && OrderSymbol() == Symbol()) {
               ls_0 = "";
               ls_8 = "";
               if (OrderOpenTime() >= g_datetime_736) {
                  if (OrderMagicNumber() == Magic1) ls_0 = "FX COMBO EURUSD - System 1";
                  else {
                     if (OrderMagicNumber() == Magic2) ls_0 = "FX COMBO EURUSD - System 2";
                     else
                        if (OrderMagicNumber() == Magic3) ls_0 = "FX COMBO EURUSD - System 3";
                  }
               }
               if (StringLen(ls_0) > 1) {
                  if (OrderType() == OP_BUY) ls_8 = "Buy";
                  else ls_8 = "Sell";
                  ls_8 = ls_8 + " order (" + OrderTicket() + ") is opened: " + DoubleToStr(OrderOpenPrice(), Digits) + ", SL:" + DoubleToStr(OrderStopLoss(), Digits) + ", TP:" + DoubleToStr(OrderTakeProfit(),
                     Digits);
                  li_16 = TRUE;
                  SendMail(ls_0, ls_8);
               }
            }
         }
      }
      for (pos_20 = OrdersHistoryTotal() - 1; pos_20 >= 0; pos_20--) {
         if (OrderSelect(pos_20, SELECT_BY_POS, MODE_HISTORY)) {
            if (OrderType() <= OP_SELL && OrderSymbol() == Symbol()) {
               if (OrderCloseTime() > g_datetime_736) {
                  ls_0 = "";
                  ls_8 = "";
                  if (OrderMagicNumber() == Magic1) ls_0 = "FX COMBO EURUSD - System 1";
                  else {
                     if (OrderMagicNumber() == Magic2) ls_0 = "FX COMBO EURUSD - System 2";
                     else
                        if (OrderMagicNumber() == Magic3) ls_0 = "FX COMBO EURUSD - System 3";
                  }
                  if (StringLen(ls_0) <= 1) continue;
                  if (OrderType() == OP_BUY) ls_8 = "Buy";
                  else ls_8 = "Sell";
                  ls_8 = ls_8 + " order (" + OrderTicket() + ") is closed at " + DoubleToStr(OrderClosePrice(), Digits) + ", result: " + DoubleToStr(OrderProfit(), 2);
                  li_16 = TRUE;
                  SendMail(ls_0, ls_8);
               }
            }
         }
      }
      g_datetime_736 = TimeCurrent();
      if (li_16) Sleep(1000);
   }
}