#property copyright "theclai"


/*#import "wininet.dll"
   int InternetOpenA(string a0, int a1, string a2, string a3, int a4);
   int InternetOpenUrlA(int a0, string a1, string a2, int a3, int a4, int a5);
   int InternetReadFile(int a0, string a1, int a2, int& a3[]);
   int InternetCloseHandle(int a0);*/
#include <WinUser32.mqh>
#import "kernel32.dll"
   int GetTimeZoneInformation(int& a0[]);
#import "FCS242.dll"
   int dllInit(int a0, int a1, int a2, int a3, int a4);
   int dllOpenCond1(int a0, double a1, double a2, double a3, double a4, double a5, double a6, int a7, int a8, int a9);
   int dllCloseCond1(int a0, double a1, double a2);
   int dllOpenCond2(int a0, double a1, double a2, double a3, double a4, double a5, double a6);
   int dllCloseCond2(int a0, double a1, double a2, double a3, double a4);
   int dllOpenCond3(int a0, double a1, double a2, double a3, double a4, double a5, double a6);
   int dllCloseCond3(int a0, double a1, double a2, double a3, double a4, double a5, double a6);
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
extern int Magic1 = 121212;
extern int Magic2 = 343434;
extern int Magic3 = 565656;
extern string E = "====================";
extern double MaxSPREAD = 5.0;
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
extern double LotsSys3 = 0.1;
extern double TradeMMSys3 = 0.0;
extern double LossFactorSys3 = 2.0;
int gi_340 = 0;
int gi_344 = 2;
int gi_348 = 0;
extern string CommonMM = "==== Main MM Parameters ====";
extern double MMMax = 20.0;
extern double MaximalLots = 50.0;
extern string Scalping = "==== FXCOMBO Scalping System Parameters ====";
extern int StopLoss = 160;
extern int TakeProfit = 27;
int g_period_392 = 75;
extern int TREND_STR = 35;
int g_period_400 = 13;
extern int OSC_open = 6;
extern int OSC_close = 20;
extern int ExtraPips = -5;
int gi_416 = 21;
int gi_unused_420 = 21;
int gi_424 = 0;
int gi_428 = 10;
int gi_432 = 1;
extern string Breakout = "==== FXCOMBO Breakout System Parameters ====";
extern int TakeProfit_II = 300;
extern int StopLoss_II = 60;
extern int MaxPipsTrailing2 = 200;
extern int MinPipsTrailing2 = 20;
extern int Break = 13;
int g_period_464 = 1;
int g_period_468 = 19;
double gd_472 = 1.44;
extern double ATRTrailingFactor2 = 3.1;
int gi_488 = 1200;
extern int F_TrailingProfit_II = 240;
extern int F_Trailing_II = 15;
extern bool Use_Exp_Trailing_II = FALSE;
extern double Exp_Trail_Factor_II = 1.5;
int gi_512 = 14;
int gi_516 = 7;
int gi_520 = 12;
int gi_524 = 9;
int gi_528 = 9;
int gi_532 = 9;
int gi_536 = 9;
int gi_540 = 9;
int gi_544 = 9;
int gi_548 = 9;
int gi_552 = 9;
int gi_556 = 9;
int gi_560 = 3;
int gi_564 = 5;
extern string Reversal = "==== FXCOMBO Reversal System Parameters ====";
extern int BegHourSys_III = 23;
extern int EndHourSys_III = 0;
extern int TakeProfit_III = 100;
extern int StopLoss_III = 260;
int gi_592 = 300;
extern int MaxPipsTrailing3 = 90;
extern int MinPipsTrailing3 = 50;
int g_period_604 = 80;
double gd_608 = 13.0;
int g_period_616 = 7;
int gi_620 = 1;
int gi_624 = 40;
extern int F_TrailingProfit_III = 100;
extern int F_Trailing_III = 30;
extern bool Use_Exp_Trailing_III = FALSE;
extern double Exp_Trail_Factor_III = 0.1;
bool gi_648 = TRUE;
string gs_652 = "";
string gs_660 = "";
int gi_668 = -1;
int gi_672 = 0;
double g_minlot_676 = 0.0;
double g_maxlot_684 = 0.0;
int g_leverage_692 = 0;
int g_lotsize_696 = 0;
double g_lotstep_700 = 0.0;
int g_datetime_708 = 0;
int g_datetime_712 = 0;
int gi_716;
int gi_720;
int gi_724 = 0;
int gi_728 = 1;
int gi_unused_732 = 3;
int gi_736 = 13;
int g_datetime_740 = 0;

int init() {
   gi_648 = TRUE;
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
   int ticket_356;
   int ticket_360;
   int ticket_364;
   double price_372;
   double price_380;
   double price_388;
   double price_396;
   double ld_404;
   double price_412;
   double price_420;
   double price_428;
   double ld_436;
   double price_444;
   string ls_492;
   double ld_40 = 1;
   if (gi_648) {
      gi_648 = FALSE;
      g_minlot_676 = MarketInfo(Symbol(), MODE_MINLOT);
      g_maxlot_684 = MarketInfo(Symbol(), MODE_MAXLOT);
      g_leverage_692 = AccountLeverage();
      g_lotsize_696 = MarketInfo(Symbol(), MODE_LOTSIZE);
      g_lotstep_700 = MarketInfo(Symbol(), MODE_LOTSTEP);
      gi_668 = -1;
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
   if (gi_668 <= 0) {
      gi_668 = f0_6(AccountNumber(), IsTesting(), IsDemo(), WindowHandle(Symbol(), Period()), TimeCurrent());
      if (!IsTesting() && AutoGMT_Offset == TRUE) gi_672 = GetGmtOffset();
      else gi_672 = ManualGMT_Offset;
   }
   if (gi_668 <= 0 && ea_validation && (!IsTesting())) {
      Comment("DLL initialization is failed (" + DoubleToStr(gi_668, 0) + "). For more information, contact us at support@forex-combo.com!");
      Alert("DLL initialization is failed (" + DoubleToStr(gi_668, 0) + "). For more information, contact us at support@forex-combo.com!");
      Sleep(10000);
      return (0);
   }
   if (gi_668 <= 0 && IsTesting()) Print("DLL initialization is failed (" + DoubleToStr(gi_668, 0) + "). Please register you test account at forex-combo.com!");
   int stoplevel_76 = MarketInfo(Symbol(), MODE_STOPLEVEL);
   bool li_80 = TRUE;
   if (stoplevel_76 == 0 || Use_ECN_Execution == TRUE || Hidden_StopAndTarget == TRUE) li_80 = FALSE;
   if (Digits <= 3) ld_84 = 0.01;
   else ld_84 = 0.0001;
   double ld_92 = NormalizeDouble((Ask - Bid) / ld_84, 1);
   string ls_100 = "*** SPREAD OK ***";
   if (ld_92 > MaxSPREAD) ls_100 = "*** SPREAD IS TOO HIGH ***";
   gs_652 = "\n\n   Greenwich Mean Time : " + TimeToStr(TimeCurrent() - 3600 * gi_672, TIME_DATE|TIME_MINUTES|TIME_SECONDS) 
   + "\n   Broker Time : " + TimeToStr(TimeCurrent(), TIME_DATE|TIME_MINUTES|TIME_SECONDS);
   string ls_108 = "FX COMBO is running on your account - Validation OK";
   string ls_116 = "FX COMBO is set up for time zone GMT " + gi_672;
   string ls_124 = "Spread= " + DoubleToStr(ld_92, 1) + " pips";
   string ls_132 = "Account Balance= " + DoubleToStr(AccountBalance(), 2);
   string ls_140 = ls_100;
   Comment("\n\n\n\n\n   " + ls_108 + " \n   " + ls_116 + " \n   " + ls_124 + " \n   " + ls_132 + " \n\n   " + ls_140 + " " + gs_652 + " " + gs_660);
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
   double iatr_172 = iATR(NULL, PERIOD_H1, g_period_468, 1);
   double ima_180 = iMA(NULL, PERIOD_H1, g_period_464, 0, MODE_EMA, PRICE_CLOSE, 1);
   double ld_188 = ima_180 + iatr_172 * gd_472;
   double ld_196 = ima_180 - iatr_172 * gd_472;
   double iclose_204 = iClose(NULL, PERIOD_M5, 1);
   double iatr_212 = iATR(NULL, PERIOD_M5, g_period_604, 1);
   double ihigh_220 = iHigh(NULL, PERIOD_H1, 1);
   double ilow_228 = iLow(NULL, PERIOD_H1, 1);
   double ibands_236 = iBands(NULL, PERIOD_H1, g_period_616, 2, 0, PRICE_CLOSE, MODE_UPPER, 1);
   double ibands_244 = iBands(NULL, PERIOD_H1, g_period_616, 2, 0, PRICE_CLOSE, MODE_LOWER, 1);
   HideTestIndicators(FALSE);
   if (TakeProfit < stoplevel_76 * Point / ld_84) TakeProfit = stoplevel_76 * Point / ld_84;
   if (TakeProfit_II < stoplevel_76 * Point / ld_84) TakeProfit_II = stoplevel_76 * Point / ld_84;
   if (StopLoss < stoplevel_76 * Point / ld_84) StopLoss = stoplevel_76 * Point / ld_84;
   if (StopLoss_II < stoplevel_76 * Point / ld_84) StopLoss_II = stoplevel_76 * Point / ld_84;
   if (TakeProfit_III < stoplevel_76 * Point / ld_84) TakeProfit_III = stoplevel_76 * Point / ld_84;
   if (StopLoss_III < stoplevel_76 * Point / ld_84) StopLoss_III = stoplevel_76 * Point / ld_84;
   int li_252 = gi_416 + gi_672;
   int li_256 = gi_416 + gi_672;
   int li_260 = BegHourSys_III + gi_672;
   int li_264 = EndHourSys_III + gi_672;
   if (li_252 > 23) li_252 -= 24;
   if (li_252 < 0) li_252 += 24;
   if (li_260 > 23) li_260 -= 24;
   if (li_260 < 0) li_260 += 24;
   if (li_256 > 23) li_256 -= 24;
   if (li_256 < 0) li_256 += 24;
   if (li_264 > 23) li_264 -= 24;
   if (li_264 < 0) li_264 += 24;
   int li_268 = gi_512 + gi_672;
   int li_272 = gi_516 + gi_672;
   int li_276 = gi_520 + gi_672;
   int li_280 = gi_524 + gi_672;
   int li_284 = gi_528 + gi_672;
   int li_288 = gi_532 + gi_672;
   int li_292 = gi_536 + gi_672;
   int li_296 = gi_540 + gi_672;
   int li_300 = gi_544 + gi_672;
   int li_304 = gi_548 + gi_672;
   int li_308 = gi_552 + gi_672;
   int li_312 = gi_556 + gi_672;
   if (li_268 > 23) li_268 -= 24;
   if (li_268 < 0) li_268 += 24;
   if (li_272 > 23) li_272 -= 24;
   if (li_272 < 0) li_272 += 24;
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
   Slippage = Slippage * ld_84;
   int count_316 = 0;
   int count_320 = 0;
   int count_324 = 0;
   int count_328 = 0;
   int count_332 = 0;
   int count_336 = 0;
   int datetime_340 = g_datetime_708;
   int li_344 = g_datetime_708 + gi_488;
   int datetime_348 = g_datetime_712;
   int li_352 = g_datetime_712 + gi_592;
   for (int pos_368 = OrdersTotal() - 1; pos_368 >= 0; pos_368--) {
      if (!OrderSelect(pos_368, SELECT_BY_POS, MODE_TRADES)) Print("Error in OrderSelect! Position:", pos_368);
      else {
         if (OrderType() <= OP_SELL && OrderSymbol() == Symbol()) {
            if (OrderMagicNumber() == Magic1) {
               if (OrderType() == OP_BUY) {
                  if (OrderStopLoss() == 0.0 && Hidden_StopAndTarget == FALSE) {
                     price_372 = NormalizeDouble(OrderOpenPrice() - StopLoss * ld_84, Digits);
                     price_380 = NormalizeDouble(OrderOpenPrice() + TakeProfit * ld_84, Digits);
                     OrderModify(OrderTicket(), OrderOpenPrice(), price_372, price_380, 0, Green);
                  }
                  if ((f0_8(gi_668, iwpr_164, OSC_close) == 0 && Bid > iclose_148 + ExtraPips * ld_84) || Bid >= OrderOpenPrice() + TakeProfit * ld_84 || Bid <= OrderOpenPrice() - StopLoss * ld_84) {
                     RefreshRates();
                     OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, Digits), Slippage, Violet);
                     Sleep(5000);
                  } else count_316++;
               } else {
                  if (OrderStopLoss() == 0.0 && Hidden_StopAndTarget == FALSE) {
                     price_372 = NormalizeDouble(OrderOpenPrice() + StopLoss * ld_84, Digits);
                     price_380 = NormalizeDouble(OrderOpenPrice() - TakeProfit * ld_84, Digits);
                     OrderModify(OrderTicket(), OrderOpenPrice(), price_372, price_380, 0, Green);
                  }
                  if ((f0_8(gi_668, iwpr_164, OSC_close) == 1 && Bid < iclose_148 - ExtraPips * ld_84) || Ask <= OrderOpenPrice() - TakeProfit * ld_84 || Ask >= OrderOpenPrice() + StopLoss * ld_84) {
                     RefreshRates();
                     OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, Digits), Slippage, Violet);
                     Sleep(5000);
                  } else count_320++;
               }
            }
            if (OrderMagicNumber() == Magic2) {
               if (OrderType() == OP_BUY) {
                  if (OrderStopLoss() == 0.0 && Hidden_StopAndTarget == FALSE) {
                     price_388 = NormalizeDouble(OrderOpenPrice() - StopLoss_II * ld_84, Digits);
                     price_396 = NormalizeDouble(OrderOpenPrice() + TakeProfit_II * ld_84, Digits);
                     OrderModify(OrderTicket(), OrderOpenPrice(), price_388, price_396, 0, Green);
                  }
                  if ((f0_10(gi_668, iclose_204, ld_196, ld_188, Break * ld_84) == 0 && TimeCurrent() - OrderOpenTime() > 3600) || Bid >= OrderOpenPrice() + TakeProfit_II * ld_84 ||
                     Bid <= OrderOpenPrice() - StopLoss_II * ld_84) {
                     RefreshRates();
                     OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, Digits), Slippage, Violet);
                     Sleep(5000);
                  } else count_324++;
                  if (TimeCurrent() >= li_344) {
                     if (Use_Exp_Trailing_II) {
                        ld_404 = f0_13(Exp_Trail_Factor_II * ld_84, OrderOpenPrice(), iHigh(NULL, PERIOD_M5, iHighest(NULL, PERIOD_M5, MODE_HIGH, iBarShift(NULL, PERIOD_M5, OrderOpenTime()) +
                           1, 0)));
                     } else ld_404 = iatr_172 * ATRTrailingFactor2;
                     if (ld_404 > MaxPipsTrailing2 * ld_84) ld_404 = MaxPipsTrailing2 * ld_84;
                     if (ld_404 < MinPipsTrailing2 * ld_84) ld_404 = MinPipsTrailing2 * ld_84;
                     if (Bid - OrderOpenPrice() > F_TrailingProfit_II * ld_84 && (!Use_Exp_Trailing_II)) ld_404 = F_Trailing_II * ld_84;
                     price_412 = NormalizeDouble(Bid - ld_404, Digits);
                     if (Hidden_StopAndTarget) {
                        if (TimeCurrent() - OrderOpenTime() > 60 && Bid <= MathMax(OrderOpenPrice() - StopLoss_II * ld_84, iHigh(NULL, PERIOD_M5, iHighest(NULL, PERIOD_M5, MODE_HIGH, iBarShift(NULL,
                           PERIOD_M5, OrderOpenTime()) + 1, 0)) - ld_404) && iHigh(NULL, PERIOD_M5, iHighest(NULL, PERIOD_M5, MODE_HIGH, iBarShift(NULL, PERIOD_M5, OrderOpenTime()) + 1, 0)) - OrderOpenPrice() > ld_404) {
                           RefreshRates();
                           OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, Digits), Slippage, Violet);
                           Sleep(5000);
                        }
                     } else {
                        if (Bid - OrderOpenPrice() > ld_404) {
                           if (OrderStopLoss() <= price_412 - Point) {
                              bool_68 = OrderModify(OrderTicket(), OrderOpenPrice(), price_412, OrderTakeProfit(), 0, Blue);
                              if (bool_68) {
                                 datetime_340 = TimeCurrent();
                                 g_datetime_708 = datetime_340;
                              }
                           }
                        }
                     }
                  }
               } else {
                  if (OrderStopLoss() == 0.0 && Hidden_StopAndTarget == FALSE) {
                     price_388 = NormalizeDouble(OrderOpenPrice() + StopLoss_II * ld_84, Digits);
                     price_396 = NormalizeDouble(OrderOpenPrice() - TakeProfit_II * ld_84, Digits);
                     OrderModify(OrderTicket(), OrderOpenPrice(), price_388, price_396, 0, Green);
                  }
                  if ((f0_10(gi_668, iclose_204, ld_196, ld_188, Break * ld_84) == 1 && TimeCurrent() - OrderOpenTime() > 3600) || Ask <= OrderOpenPrice() - TakeProfit_II * ld_84 ||
                     Ask >= OrderOpenPrice() + StopLoss_II * ld_84) {
                     RefreshRates();
                     OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, Digits), Slippage, Violet);
                     Sleep(5000);
                  } else count_328++;
                  if (TimeCurrent() >= li_344) {
                     if (Use_Exp_Trailing_II) {
                        ld_404 = f0_14(Exp_Trail_Factor_II * ld_84, OrderOpenPrice(), iLow(NULL, PERIOD_M5, iLowest(NULL, PERIOD_M5, MODE_LOW, iBarShift(NULL, PERIOD_M5, OrderOpenTime()) +
                           1, 0)) + Ask - Bid);
                     } else ld_404 = iatr_172 * ATRTrailingFactor2;
                     if (ld_404 > MaxPipsTrailing2 * ld_84) ld_404 = MaxPipsTrailing2 * ld_84;
                     if (ld_404 < MinPipsTrailing2 * ld_84) ld_404 = MinPipsTrailing2 * ld_84;
                     if (OrderOpenPrice() - Ask > F_TrailingProfit_II * ld_84 && (!Use_Exp_Trailing_II)) ld_404 = F_Trailing_II * ld_84;
                     price_412 = NormalizeDouble(Ask + ld_404, Digits);
                     if (Hidden_StopAndTarget) {
                        if (TimeCurrent() - OrderOpenTime() > 60 && Ask >= Ask - Bid + MathMin(OrderOpenPrice() + StopLoss_II * ld_84, iLow(NULL, PERIOD_M5, iLowest(NULL, PERIOD_M5, MODE_LOW,
                           iBarShift(NULL, PERIOD_M5, OrderOpenTime()) + 1, 0)) + ld_404) && OrderOpenPrice() - (iLow(NULL, PERIOD_M5, iLowest(NULL, PERIOD_M5, MODE_LOW, iBarShift(NULL, PERIOD_M5,
                           OrderOpenTime()) + 1, 0)) + Ask - Bid) > ld_404) {
                           RefreshRates();
                           OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, Digits), Slippage, Violet);
                           Sleep(5000);
                        }
                     } else {
                        if (OrderOpenPrice() - Ask > ld_404) {
                           if (OrderStopLoss() >= price_412 + Point) {
                              bool_68 = OrderModify(OrderTicket(), OrderOpenPrice(), price_412, OrderTakeProfit(), 0, Red);
                              if (bool_68) {
                                 datetime_340 = TimeCurrent();
                                 g_datetime_708 = datetime_340;
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
                     price_420 = NormalizeDouble(OrderOpenPrice() - StopLoss_III * ld_84, Digits);
                     price_428 = NormalizeDouble(OrderOpenPrice() + TakeProfit_III * ld_84, Digits);
                     OrderModify(OrderTicket(), OrderOpenPrice(), price_420, price_428, 0, Green);
                  }
                  if (((li_260 <= li_264 && TimeHour(TimeCurrent()) >= li_260 && TimeHour(TimeCurrent()) <= li_264) || (li_260 > li_264 && TimeHour(TimeCurrent()) >= li_260 || TimeHour(TimeCurrent()) <= li_264) &&
                     f0_12(gi_668, ibands_236, ibands_244, gi_624 * ld_84, ihigh_220, ilow_228, gi_620 * ld_84) == 0 && TimeCurrent() - OrderOpenTime() > 7200) || Bid >= OrderOpenPrice() +
                     TakeProfit_III * ld_84 || Bid <= OrderOpenPrice() - StopLoss_III * ld_84) {
                     RefreshRates();
                     OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, Digits), Slippage, Violet);
                     Sleep(5000);
                  } else count_332++;
                  if (TimeCurrent() < li_352) continue;
                  if (Use_Exp_Trailing_III) ld_436 = Exp_Trail_Factor_III * ld_84 / (iHigh(NULL, PERIOD_M5, iHighest(NULL, PERIOD_M5, MODE_HIGH, iBarShift(NULL, PERIOD_M5, OrderOpenTime()) + 1, 0)) - OrderOpenPrice());
                  else ld_436 = iatr_212 * gd_608;
                  if (ld_436 > MaxPipsTrailing3 * ld_84) ld_436 = MaxPipsTrailing3 * ld_84;
                  if (ld_436 < MinPipsTrailing3 * ld_84) ld_436 = MinPipsTrailing3 * ld_84;
                  if (Bid - OrderOpenPrice() > F_TrailingProfit_III * ld_84 && (!Use_Exp_Trailing_III)) ld_436 = F_Trailing_III * ld_84;
                  price_444 = NormalizeDouble(Bid - ld_436, Digits);
                  if (Hidden_StopAndTarget) {
                     if (TimeCurrent() - OrderOpenTime() > 300 && Bid <= MathMax(OrderOpenPrice() - StopLoss_III * ld_84, iHigh(NULL, PERIOD_M5, iHighest(NULL, PERIOD_M5, MODE_HIGH, iBarShift(NULL,
                        PERIOD_M5, OrderOpenTime()) + 1, 0)) - ld_436) && iHigh(NULL, PERIOD_M5, iHighest(NULL, PERIOD_M5, MODE_HIGH, iBarShift(NULL, PERIOD_M5, OrderOpenTime()) + 1, 0)) - OrderOpenPrice() > ld_436) {
                        RefreshRates();
                        OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, Digits), Slippage, Violet);
                        Sleep(5000);
                     }
                  } else {
                     if (Bid - OrderOpenPrice() > ld_436) {
                        if (OrderStopLoss() <= price_444 - Point) {
                           bool_72 = OrderModify(OrderTicket(), OrderOpenPrice(), price_444, OrderTakeProfit(), 0, Blue);
                           if (bool_72) {
                              datetime_348 = TimeCurrent();
                              g_datetime_712 = datetime_348;
                              continue;
                           }
                        }
                     }
                  }
               }
               if (OrderStopLoss() == 0.0 && Hidden_StopAndTarget == FALSE) {
                  price_420 = NormalizeDouble(OrderOpenPrice() + StopLoss_III * ld_84, Digits);
                  price_428 = NormalizeDouble(OrderOpenPrice() - TakeProfit_III * ld_84, Digits);
                  OrderModify(OrderTicket(), OrderOpenPrice(), price_420, price_428, 0, Green);
               }
               if (((li_260 <= li_264 && TimeHour(TimeCurrent()) >= li_260 && TimeHour(TimeCurrent()) <= li_264) || (li_260 > li_264 && TimeHour(TimeCurrent()) >= li_260 || TimeHour(TimeCurrent()) <= li_264) &&
                  f0_12(gi_668, ibands_236, ibands_244, gi_624 * ld_84, ihigh_220, ilow_228, gi_620 * ld_84) == 1 && TimeCurrent() - OrderOpenTime() > 7200) || Ask <= OrderOpenPrice() - TakeProfit_III * ld_84 ||
                  Ask >= OrderOpenPrice() + StopLoss_III * ld_84) {
                  RefreshRates();
                  OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, Digits), Slippage, Violet);
                  Sleep(5000);
               } else count_336++;
               if (TimeCurrent() >= li_352) {
                  if (Use_Exp_Trailing_III) {
                     ld_436 = Exp_Trail_Factor_III * ld_84 / (OrderOpenPrice() - (iLow(NULL, PERIOD_M5, iLowest(NULL, PERIOD_M5, MODE_LOW, iBarShift(NULL, PERIOD_M5, OrderOpenTime()) +
                        1, 0)) + Ask - Bid));
                  } else ld_436 = iatr_212 * gd_608;
                  if (ld_436 > MaxPipsTrailing3 * ld_84) ld_436 = MaxPipsTrailing3 * ld_84;
                  if (ld_436 < MinPipsTrailing3 * ld_84) ld_436 = MinPipsTrailing3 * ld_84;
                  if (OrderOpenPrice() - Ask > F_TrailingProfit_III * ld_84 && (!Use_Exp_Trailing_III)) ld_436 = F_Trailing_III * ld_84;
                  price_444 = NormalizeDouble(Ask + ld_436, Digits);
                  if (Hidden_StopAndTarget) {
                     if (!(TimeCurrent() - OrderOpenTime() > 300 && Ask >= Ask - Bid + MathMin(OrderOpenPrice() + StopLoss_III * ld_84, iLow(NULL, PERIOD_M5, iLowest(NULL, PERIOD_M5,
                        MODE_LOW, iBarShift(NULL, PERIOD_M5, OrderOpenTime()) + 1, 0)) + ld_436) && OrderOpenPrice() - (iLow(NULL, PERIOD_M5, iLowest(NULL, PERIOD_M5, MODE_LOW, iBarShift(NULL,
                        PERIOD_M5, OrderOpenTime()) + 1, 0)) + Ask - Bid) > ld_436)) continue;
                     RefreshRates();
                     OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, Digits), Slippage, Violet);
                     Sleep(5000);
                     continue;
                  }
                  if (OrderOpenPrice() - Ask > ld_436) {
                     if (OrderStopLoss() >= price_444 + Point) {
                        bool_72 = OrderModify(OrderTicket(), OrderOpenPrice(), price_444, OrderTakeProfit(), 0, Red);
                        if (bool_72) {
                           datetime_348 = TimeCurrent();
                           g_datetime_712 = datetime_348;
                        }
                     }
                  }
               }
            }
         }
      }
   }
   double ld_452 = 0;
   if (StringSubstr(AccountCurrency(), 0, 3) == "JPY") {
      ld_452 = MarketInfo("USDJPY" + StringSubstr(Symbol(), 6), MODE_BID);
      if (ld_452 > 0.1) ld_40 = ld_452;
      else ld_40 = 84;
   }
   if (StringSubstr(AccountCurrency(), 0, 3) == "GBP") {
      ld_452 = MarketInfo("GBPUSD" + StringSubstr(Symbol(), 6), MODE_BID);
      if (ld_452 > 0.1) ld_40 = 1 / ld_452;
      else ld_40 = 0.6211180124;
   }
   if (StringSubstr(AccountCurrency(), 0, 3) == "EUR") {
      ld_452 = MarketInfo("EURUSD" + StringSubstr(Symbol(), 6), MODE_BID);
      if (ld_452 > 0.1) ld_40 = 1 / ld_452;
      else ld_40 = 0.7042253521;
   }
   if (EMAIL_Notification == TRUE) f0_16();
   bool li_460 = TRUE;
   bool li_464 = TRUE;
   if (No_Hedge_Trades == TRUE && count_320 > 0 || count_328 > 0 || count_336 > 0) li_460 = FALSE;
   if (No_Hedge_Trades == TRUE && count_316 > 0 || count_324 > 0 || count_332 > 0) li_464 = FALSE;
   if (NFA_Compatibility == TRUE && count_320 > 0 || count_328 > 0 || count_336 > 0 || count_316 > 0 || count_324 > 0 || count_332 > 0) {
      li_460 = FALSE;
      li_464 = FALSE;
   }
   double lots_468 = MathMin(g_maxlot_684, MathMax(g_minlot_676, LotsSys1));
   if (TradeMMSys1 > 0.0) lots_468 = MathMax(g_minlot_676, MathMin(g_maxlot_684, NormalizeDouble(f0_0() / ld_40 / 100.0 * AccountFreeMargin() / g_lotstep_700 / (g_lotsize_696 / 100), 0) * g_lotstep_700));
   if (lots_468 > MaximalLots) lots_468 = MaximalLots;
   double lots_476 = MathMin(g_maxlot_684, MathMax(g_minlot_676, LotsSys2));
   if (TradeMMSys2 > 0.0) lots_476 = MathMax(g_minlot_676, MathMin(g_maxlot_684, NormalizeDouble(f0_1() / ld_40 / 100.0 * AccountFreeMargin() / g_lotstep_700 / (g_lotsize_696 / 100), 0) * g_lotstep_700));
   if (lots_476 > MaximalLots) lots_476 = MaximalLots;
   double lots_484 = MathMin(g_maxlot_684, MathMax(g_minlot_676, LotsSys3));
   if (TradeMMSys3 > 0.0) lots_484 = MathMax(g_minlot_676, MathMin(g_maxlot_684, NormalizeDouble(f0_2() / ld_40 / 100.0 * AccountFreeMargin() / g_lotstep_700 / (g_lotsize_696 / 100), 0) * g_lotstep_700));
   if (lots_484 > MaximalLots) lots_484 = MaximalLots;
   gs_660 = "\n\n   LOTS Sys1 : " + DoubleToStr(lots_468, 2) 
      + "\n   LOTS Sys2 : " + DoubleToStr(lots_476, 2) 
   + "\n   LOTS Sys3 : " + DoubleToStr(lots_484, 2);
   int cmd_36 = -1;
   if (Use_FXCOMBO_Scalping != FALSE) {
      if (count_316 < 1 && li_460 && (f0_7(gi_668, iclose_148, ima_156, TREND_STR * ld_84, iwpr_164, OSC_open, gi_424, Hour(), li_252, li_256) == 0 && Bid < iclose_148 - ExtraPips * ld_84) ||
         (iwpr_164 < gi_428 + (-100) && Bid < iclose_148 - gi_432 * ld_84 && Hour() == li_252 || Hour() == li_256)) {
         if (ld_92 > MaxSPREAD) Print("System 1 BUY not taken due to high spead!");
         else {
            ls_492 = "BUY";
            cmd_36 = 0;
            color_32 = Aqua;
            RefreshRates();
            price_0 = NormalizeDouble(Ask, Digits);
            price_8 = price_0 - StopLoss * ld_84;
            price_16 = price_0 + TakeProfit * ld_84;
         }
      }
      if (count_320 < 1 && li_464 && (f0_7(gi_668, iclose_148, ima_156, TREND_STR * ld_84, iwpr_164, OSC_open, gi_424, Hour(), li_252, li_256) == 1 && Bid > iclose_148 +
         ExtraPips * ld_84) || (iwpr_164 > (-gi_428) && Bid > iclose_148 + gi_432 * ld_84 && Hour() == li_252 || Hour() == li_256)) {
         if (ld_92 > MaxSPREAD) Print("System 1 SELL not taken due to high spead!");
         else {
            ls_492 = "SELL";
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
      if (li_80 == FALSE) ticket_356 = OrderSend(Symbol(), cmd_36, lots_468, price_0, Slippage, 0, 0, CommentSys1, Magic1, 0, color_32);
      else ticket_356 = OrderSend(Symbol(), cmd_36, lots_468, price_0, Slippage, price_8, price_16, CommentSys1, Magic1, 0, color_32);
      Sleep(5000);
      if (ticket_356 > 0) {
         if (OrderSelect(ticket_356, SELECT_BY_TICKET, MODE_TRADES)) Print("Order " + ls_492 + " opened!: ", OrderOpenPrice());
      } else Print("Error opening " + ls_492 + " order!: ", GetLastError());
   }
   cmd_36 = -1;
   if (!(TimeHour(TimeCurrent()) != li_268 && TimeHour(TimeCurrent()) != li_272 && TimeHour(TimeCurrent()) != li_276 && TimeHour(TimeCurrent()) != li_280 && TimeHour(TimeCurrent()) != li_284 &&
      TimeHour(TimeCurrent()) != li_288 && TimeHour(TimeCurrent()) != li_292 && TimeHour(TimeCurrent()) != li_296 && TimeHour(TimeCurrent()) != li_300 && TimeHour(TimeCurrent()) != li_304 && TimeHour(TimeCurrent()) != li_308) ||
      !(TimeHour(TimeCurrent()) != li_312)) {
      if (Use_FXCOMBO_Breakout != FALSE) {
         if (!(DayOfWeek() == gi_560) && !(DayOfWeek() == gi_564)) {
            if (count_328 < 1 && li_464 && f0_9(gi_668, iclose_204, ld_196, ld_188, Break * ld_84, Bid, (Break - 3) * ld_84) == 1) {
               if (ld_92 > MaxSPREAD) Print("System 2 SELL not taken due to high spead!");
               else {
                  ls_492 = "SELL";
                  cmd_36 = 1;
                  color_32 = Yellow;
                  RefreshRates();
                  price_0 = NormalizeDouble(Bid, Digits);
                  price_8 = price_0 + StopLoss_II * ld_84;
                  price_16 = price_0 - TakeProfit_II * ld_84;
               }
            }
            if (count_324 < 1 && li_460 && f0_9(gi_668, iclose_204, ld_196, ld_188, Break * ld_84, Bid, (Break - 3) * ld_84) == 0) {
               if (ld_92 > MaxSPREAD) Print("System 2 BUY not taken due to high spead!");
               else {
                  ls_492 = "BUY";
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
   if (cmd_36 >= OP_BUY) {
      if (li_80 == FALSE) ticket_360 = OrderSend(Symbol(), cmd_36, lots_476, price_0, Slippage, 0, 0, CommentSys2, Magic2, 0, color_32);
      else ticket_360 = OrderSend(Symbol(), cmd_36, lots_476, price_0, Slippage, price_8, price_16, CommentSys2, Magic2, 0, color_32);
      Sleep(5000);
      if (ticket_360 > 0) {
         if (OrderSelect(ticket_360, SELECT_BY_TICKET, MODE_TRADES)) Print("Order " + ls_492 + " opened!: ", OrderOpenPrice());
      } else Print("Error opening " + ls_492 + " order!: ", GetLastError());
   }
   cmd_36 = -1;
   if (Use_FXCOMBO_Reversal != FALSE) {
      if (count_332 < 1 && li_460 && (li_260 <= li_264 && TimeHour(TimeCurrent()) >= li_260 && TimeHour(TimeCurrent()) <= li_264) || (li_260 > li_264 && TimeHour(TimeCurrent()) >= li_260 ||
         TimeHour(TimeCurrent()) <= li_264) && f0_11(gi_668, ibands_236, ibands_244, gi_624 * ld_84, ihigh_220, ilow_228, gi_620 * ld_84) == 0) {
         if (ld_92 > MaxSPREAD) Print("System 3 BUY not taken due to high spead!");
         else {
            ls_492 = "BUY";
            cmd_36 = 0;
            color_32 = Aqua;
            RefreshRates();
            price_0 = NormalizeDouble(Ask, Digits);
            price_8 = price_0 - StopLoss_III * ld_84;
            price_16 = price_0 + TakeProfit_III * ld_84;
         }
      }
      if (count_336 < 1 && li_464 && (li_260 <= li_264 && TimeHour(TimeCurrent()) >= li_260 && TimeHour(TimeCurrent()) <= li_264) || (li_260 > li_264 && TimeHour(TimeCurrent()) >= li_260 ||
         TimeHour(TimeCurrent()) <= li_264) && f0_11(gi_668, ibands_236, ibands_244, gi_624 * ld_84, ihigh_220, ilow_228, gi_620 * ld_84) == 1) {
         if (ld_92 > MaxSPREAD) Print("System 3 SELL not taken due to high spead!");
         else {
            ls_492 = "SELL";
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
      if (li_80 == FALSE) ticket_364 = OrderSend(Symbol(), cmd_36, lots_484, price_0, Slippage, 0, 0, CommentSys3, Magic3, 0, color_32);
      else ticket_364 = OrderSend(Symbol(), cmd_36, lots_484, price_0, Slippage, price_8, price_16, CommentSys3, Magic3, 0, color_32);
      Sleep(5000);
      if (ticket_364 > 0) {
         if (OrderSelect(ticket_364, SELECT_BY_TICKET, MODE_TRADES)) Print("Order " + ls_492 + " opened!: ", OrderOpenPrice());
      } else Print("Error opening " + ls_492 + " order!: ", GetLastError());
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

/*int f0_3(bool ai_0) {
   string ls_4;
   if (gi_716 == 0) {
      ls_4 = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Q312461)";
      gi_716 = InternetOpenA(ls_4, gi_724, "0", "0", 0);
      gi_720 = InternetOpenA(ls_4, gi_728, "0", "0", 0);
   }
   if (ai_0) return (gi_720);
   return (gi_716);
}

int f0_4(string as_0, string &as_8) {
   int lia_24[] = {1};
   string ls_28 = "x";
   int li_16 = InternetOpenUrlA(f0_3(0), as_0, "0", 0, -2080374528, 0);
   if (li_16 == 0) return (0);
   int li_20 = InternetReadFile(li_16, ls_28, gi_736, lia_24);
   if (li_20 == 0) return (0);
   int li_36 = lia_24[0];
   for (as_8 = StringSubstr(ls_28, 0, lia_24[0]); lia_24[0] != 0; as_8 = as_8 + StringSubstr(ls_28, 0, lia_24[0])) {
      li_20 = InternetReadFile(li_16, ls_28, gi_736, lia_24);
      if (lia_24[0] == 0) break;
      li_36 += lia_24[0];
   }
   li_20 = InternetCloseHandle(li_16);
   if (li_20 == 0) return (0);
   return (1);
}

string f0_5(string as_0, int ai_8, string as_12, string as_20, int &ai_28) {
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

double f0_13(double ad_0, double ad_8, double ad_16) {
   return (dllExpTrailLong(ad_0, ad_8, ad_16));
}

double f0_14(double ad_0, double ad_8, double ad_16) {
   return (dllExpTrailShort(ad_0, ad_8, ad_16));
}

//int f0_15() {
   //return (dllGMTOffset());
//}

void f0_16() {
   string ls_0;
   string ls_8;
   bool li_16 = FALSE;
   if (IsTesting() || EMAIL_Notification == FALSE) return;
   if (g_datetime_740 == 0) {
      g_datetime_740 = TimeCurrent();
      return;
   }
   if (g_datetime_740 != TimeCurrent()) {
      for (int pos_20 = 0; pos_20 <= OrdersTotal() - 1; pos_20++) {
         if (OrderSelect(pos_20, SELECT_BY_POS, MODE_TRADES)) {
            if (OrderType() <= OP_SELL && OrderSymbol() == Symbol()) {
               ls_0 = "";
               ls_8 = "";
               if (OrderOpenTime() >= g_datetime_740) {
                  if (OrderMagicNumber() == Magic1) ls_0 = "FX COMBO GBPUSD - System 1";
                  else {
                     if (OrderMagicNumber() == Magic2) ls_0 = "FX COMBO GBPUSD - System 2";
                     else
                        if (OrderMagicNumber() == Magic3) ls_0 = "FX COMBO GBPUSD - System 3";
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
               if (OrderCloseTime() > g_datetime_740) {
                  ls_0 = "";
                  ls_8 = "";
                  if (OrderMagicNumber() == Magic1) ls_0 = "FX COMBO GBPUSD - System 1";
                  else {
                     if (OrderMagicNumber() == Magic2) ls_0 = "FX COMBO GBPUSD - System 2";
                     else
                        if (OrderMagicNumber() == Magic3) ls_0 = "FX COMBO GBPUSD - System 3";
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
      g_datetime_740 = TimeCurrent();
      if (li_16) Sleep(1000);
   }
}

/*GMT FUNCTION*/
double TimeZoneLocal() {
   int lia_0[43];
   switch (GetTimeZoneInformation(lia_0)) {
   case 0:
      return (lia_0[0] / (-60.0));
   case 1:
      return (lia_0[0] / (-60.0));
   case 2:
      return ((lia_0[0] + lia_0[42]) / (-60.0));
   }
   return (0);
}
double GetGmtOffset() {
   int li_0 = (TimeCurrent() - TimeLocal()) / 60;
   int li_4 = MathRound(li_0 / 30.0);
   li_0 = 30 * li_4;
   double ld_ret_8 = TimeZoneLocal() + li_0 / 60.0;
   //GmtOffset = TimeCurrent() - 3600.0 * GetGmtOffset();
   return (ld_ret_8);
}


