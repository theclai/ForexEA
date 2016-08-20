/* Decompiled by exptomql@hotmail.com */

#property  copyright "FXautomater"
#property  link "www.fxautomater.com"

#import    "Kernel32.dll"
   void GetSystemTime(int& ia1[]);
#import    "wininet.dll"
   int InternetOpenA(string s1, int i1, string s2, string s3, int i2);
   int InternetOpenUrlA(int i1, string s1, string s2, int i2, int i3, int i4);
   int InternetReadFile(int i1, string s1, int i2, int& ia1[]);
   int InternetCloseHandle(int i1);
#import    "FCS20.dll"
   int dllInit(int i1, int i2, int i3);
   int dllOpenCond1(int i1, double d1, double d2, double d3, double d4, double d5, double d6, int i2, int i3, int i4);
   int dllCloseCond1(int i1, double d1, double d2);
   int dllOpenCond2(int i1, double d1, double d2, double d3, double d4);
   int dllCloseCond2(int i1, double d1, double d2, double d3, double d4);
   int dllOpenCond3(int i1, double d1, double d2, double d3, double d4, double d5, double d6);
   int dllCloseCond3(int i1, double d1, double d2, double d3, double d4, double d5, double d6);
#import

int      LastYear = 2011;
int      LastMonth = 1;
int      LastDay = 1;
string   URL = "http://forex-combo.com/verify.php";
bool     Grabbed = false;
extern   string   A = "====================";
extern   bool     Use_FXCOMBO_Scalping = true;
extern   bool     Use_FXCOMBO_Breakout = true;
extern   bool     Use_FXCOMBO_Reversal = true;
extern   string   B = "====================";
extern   bool     Use_ECN_Execution = true;
extern   bool     Hiden_StopAndTarget = false;
extern   bool     No_Hedge_Trades = false;
extern   bool     NFA_Compatibility = false;
extern   string   C = "====================";
extern   string   CommentSys1 = "*** 1 ***";
extern   string   CommentSys2 = "*** 2 ***";
extern   string   CommentSys3 = "*** 3 ***";
extern   string   D = "====================";
extern   int      Magic1 = 111;
extern   int      Magic2 = 222;
extern   int      Magic3 = 333;
extern   string   E = "====================";
extern   double   MaxSPREAD = 4;
extern   int      Slippage = 2;
extern   bool     AutoGMT_Offset = true;
extern   int      GMT_Offset_TestMode = 2;
extern   bool     UseAgresiveMM = false;

extern   string   MMSys1 = "==== FXCOMBO Scalping MM Parameters ====";
extern   double   LotsSys1 = 0.1;
extern   double   TradeMMSys1 = 0;
extern   double   LossFactorSys1 = 2;
int      MaxLossCnt1 = 0;
int      Module1 = 2;
int      LastMinProfit1 = 0;

extern   string   MMSys2 = "==== FXCOMBO Breakout MM Parameters ====";
extern   double   LotsSys2 = 0.1;
extern   double   TradeMMSys2 = 0;
extern   double   LossFactorSys2 = 2;
int      MaxLossCnt2 = 0;
int      Module2 = 2;
int      LastMinProfit2 = 0;

extern   string   MMSys3 = "==== FXCOMBO Reversal MM Parameters ====";
extern   double   LotsSys3 = 0.1;
extern   double   TradeMMSys3 = 0;
extern   double   LossFactorSys3 = 2;
int      MaxLossCnt3 = 0;
int      Module3 = 2;
int      LastMinProfit3 = 0;

extern   string   CommonMM = "==== Main MM Parameters ====";
extern   double   MMMax = 20;
extern   double   MaximalLots = 50;

extern   string   Scalping = "==== FXCOMBO Scalping System Parameters ====";
extern   int      StopLoss = 110;
extern   int      TakeProfit = 21;
int      MA1prd = 60;
extern   int      TREND_STR = 20;
int      WPR1prd = 18;
extern   int      OSC_open = 10;
extern   int      OSC_close = 13;
int      GapForClose1 = -5;
int      BegHourSys_I = 21;
int      EndHourSys_I = 21;
int      WPR1level = 6;

extern   string   Breakout = "==== FXCOMBO Breakout System Parameters ====";
extern   int      TakeProfit_II = 300;
extern   int      StopLoss_II = 30;
extern   int      MaxPipsTrailing2 = 180;
extern   int      MinPipsTrailing2 = 10;
extern   int      Break = 13;
int      MA2prd = 1;
int      ATR2prd = 19;
double   ATR2factor = 1.4;
extern   double   ATRTrailingFactor2 = 4.7;
int      ModifyPause2 = 300;
int      ProfitTrailStart2 = 270;
int      ProfitTrail2 = 20;
int      Hour2_1 = 0;
int      Hour2_2 = 8;
int      Hour2_3 = 7;
int      Hour2_4 = 18;
int      Hour2_5 = 17;
int      Hour2_6 = 13;
int      Hour2_7 = 14;
int      Hour2_8 = 6;
int      Hour2_9 = 9;
int      Hour2_10 = 2;
int      Hour2_11 = 3;

extern   string   Reversal = "==== FXCOMBO Reversal System Parameters ====";
extern   int      BegHourSys_III = 22;
extern   int      EndHourSys_III = 0;
extern   double   TakeProfit_III = 160;
extern   int      StopLoss_III = 70;
int      ModifyPause3 = 300;
extern   int      MaxPipsTrailing3 = 60;
extern   int      MinPipsTrailing3 = 20;
int      ATR3prd = 60;
double   ATRTrailingFactor3 = 13;
int      Bands3prd = 26;
int      GapForClose3 = -3;
int      Bands3Range = 30;

bool     FirstTime = true;
string   MsgTime = "";
string   MsgLots = "";
double   MinLot = 0;
double   MaxLot = 0;
int      Leverage = 0;
int      LotSize = 0;
int      StopLevel = 0;
int      ModifyTime2 = 0;
int      ModifyTime3 = 0;
int      InetHandle0;
int      InetHandle1;
int      InetAccessType0 = 0;
int      InetAccessType1 = 1;
int      var_680 = 3;
int      InetNumOfBytesToRead = 13;


//+------------------------------------------------------------------+

int init()
{
FirstTime = true;
Grabbed = false;
Comment("");
return(0);
}

//+------------------------------------------------------------------+

int deinit()
{
Comment("");
return(0);
}

//+------------------------------------------------------------------+

int start()
{
int    handle = -1;
double price;
double sl;
double tp;
double tempsl;
int    clr;
int    ordtype;
double kf = 1;
string grabweb_result;
int    pos1;
string acctype;
bool   ret2;
bool   ret3;
int    needsltp;
double point;
double spread;
string msgspread;
int    gmtoffset;
string msg1;
string msg2;
string msg3;
string msg4;
string msg5;
double close1;
double ma1;
double wpr1;
double atr2;
double ma2;
double highlevel2;
double lowlevel2;
double close2;
double atr3;
double high3;
double low3;
double bandsU3;
double bandsL3;
int    beghour1;
int    endhour1;
int    beghour3;
int    endhour3;
int    hr2_1;
int    hr2_2;
int    hr2_3;
int    hr2_4;
int    hr2_5;
int    hr2_6;
int    hr2_7;
int    hr2_8;
int    hr2_9;
int    hr2_10;
int    hr2_11;
int    bcnt1;
int    scnt1;
int    bcnt2;
int    scnt2;
int    bcnt3;
int    scnt3;
int    modifytime2;
int    nextmodifytime2;
int    modifytime3;
int    nextmodifytime3;
int    ticket1;
int    ticket2;
int    ticket3;
int    i;
double sl1;
double tp1;
double sl2;
double tp2;
double trailing2;
double trail2;
double sl3;
double tp3;
double trailing3;
double trail3;
bool   allowbuy;
bool   allowsell;
double lots1;
double lots2;
double lots3;
string descr;

if (FirstTime)
   {
   FirstTime = false;
   MinLot = MarketInfo(Symbol(),MODE_MINLOT);
   MaxLot = MarketInfo(Symbol(),MODE_MAXLOT);
   Leverage = AccountLeverage();
   LotSize = MarketInfo(Symbol(),MODE_LOTSIZE);
   StopLevel = MarketInfo(Symbol(),MODE_STOPLEVEL);
   }

if (!IsTesting() && (IsDllsAllowed() == false))
   {
   Comment("Warning: Set Parameter **AllowDLL Imports** ON in menu Tools -> Options -> ExpertAdvisors.");
   Print("Warning: Set Parameter **AllowDLL Imports** ON in menu Tools -> Options -> ExpertAdvisors.");
   Alert("Warning: Set Parameter **AllowDLL Imports** ON in menu Tools -> Options -> ExpertAdvisors.");
   Sleep(30000);
   return(0);
   }

bool IsTes=true;
bool IsDem=true;
if (!Grabbed && !IsTes)
   {
   if (IsDem == false) acctype = "AccountType=2"; else acctype = "AccountType=1";
   if (GrabWeb(URL + "?AccountId=" + DoubleToStr(AccountNumber(),0) + "&" + acctype,grabweb_result))
      {
      if (StringTrimRight(StringTrimLeft(GetData(grabweb_result,0,"<result>","</result>",pos1))) == "OK")
         {
         Grabbed = true;
         }
            else
         {
         Comment("Online validation is not passed. For more information, contact us at support@forex-combo.com!");
         Alert("Online validation is not passed. For more information, contact us at support@forex-combo.com!");
         Sleep(30000);
         return(0);
         }
      }
         else
      {
      Comment("\n Online validation failed (error number " + DoubleToStr(GetLastError(),0) + "). Visit www.fxautomater.com for more information!");
      Alert("Online validation failed (error number " + DoubleToStr(GetLastError(),0) + "). Visit www.fxautomater.com for more information!");
      Sleep(30000);
      return(0);
      }
   }


handle =wInit(AccountNumber(),1,1);
if ((handle <= 0) && Grabbed && !IsTesting())
   {
   Comment("DLL initialization is failed (" + DoubleToStr(handle,0) + "). For more information, contact us at support@forex-combo.com!");
   Alert("DLL initialization is failed (" + DoubleToStr(handle,0) + "). For more information, contact us at support@forex-combo.com!");
   Sleep(10000);
   return(0);
   }

if ((handle <= 0) && IsTes)
   {
   Print("DLL initialization is failed (" + DoubleToStr(handle,0) + "). For more information, contact us at support@forex-combo.com!");
   }

needsltp = 1;
if ((StopLevel == 0) || (Use_ECN_Execution == true) || (Hiden_StopAndTarget == true)) needsltp = 0;

if (Digits <= 3) point = 0.01; else point = 0.0001;

spread = NormalizeDouble((Ask - Bid) / point,1);
msgspread = "*** SPREAD OK ***";

if (spread > MaxSPREAD)
   {
   Print("SPREAD IS TOO HIGH - " + DoubleToStr(spread,1) + " pips");
   msgspread = "*** SPREAD IS TOO HIGH ***";
   }

if (!IsTesting() && (AutoGMT_Offset == true)) gmtoffset = GMTOffset(); else gmtoffset = GMT_Offset_TestMode;

msg1 = "FX COMBO is running on your account - Validation OK";
msg2 = "FX COMBO is set up for time zone GMT " + gmtoffset;
msg3 = "Spread= " + DoubleToStr(spread,1) + " pips";
msg4 = "Account Balance= " + DoubleToStr(AccountBalance(),2);
msg5 = msgspread;

Comment("\n\n\n\n\n   " + msg1 + " \n   " + msg2 + " \n   " + msg3 + " \n   " + msg4 + " \n\n   " + msg5 + " " + MsgTime + " " + MsgLots);

ObjectCreate("klc",OBJ_LABEL,0,0,0);
ObjectSetText("klc","   FOREX COMBO SYSTEM ",9,"System",Red);
ObjectSet("klc",OBJPROP_CORNER,0);
ObjectSet("klc",OBJPROP_XDISTANCE,0);
ObjectSet("klc",OBJPROP_YDISTANCE,29);
ObjectCreate("klc2",OBJ_LABEL,0,0,0);
ObjectSetText("klc2","   by FXautomater ",9,"System",Gray);
ObjectSet("klc2",OBJPROP_CORNER,0);
ObjectSet("klc2",OBJPROP_XDISTANCE,165);
ObjectSet("klc2",OBJPROP_YDISTANCE,29);
ObjectCreate("klc3",OBJ_LABEL,0,0,0);
ObjectSetText("klc3","   Copyright © www.fxautomater.com ",9,"System",Gray);
ObjectSet("klc3",OBJPROP_CORNER,0);
ObjectSet("klc3",OBJPROP_XDISTANCE,0);
ObjectSet("klc3",OBJPROP_YDISTANCE,45);

if (FirstTime)
   {
   FirstTime = false;
   MinLot = MarketInfo(Symbol(),MODE_MINLOT);
   MaxLot = MarketInfo(Symbol(),MODE_MAXLOT);
   Leverage = AccountLeverage();
   LotSize = MarketInfo(Symbol(),MODE_LOTSIZE);
   StopLevel = MarketInfo(Symbol(),MODE_STOPLEVEL);
   }

if (UseAgresiveMM != true)
   {
   LossFactorSys1 = 1;
   LossFactorSys2 = 1;
   LossFactorSys3 = 1;
   }

close1 = iClose(NULL,PERIOD_M15,1);
ma1 = iMA(NULL,PERIOD_M15,MA1prd,0,MODE_SMMA,PRICE_CLOSE,1);
wpr1 = iWPR(NULL,PERIOD_M15,WPR1prd,1);

atr2 = iATR(NULL,PERIOD_H1,ATR2prd,1);
ma2 = iMA(NULL,PERIOD_H1,MA2prd,0,MODE_EMA,PRICE_CLOSE,1);
highlevel2 = ma2 + atr2 * ATR2factor;
lowlevel2 = ma2 - atr2 * ATR2factor;
close2 = iClose(NULL,PERIOD_M5,1);

atr3 = iATR(NULL,PERIOD_M5,ATR3prd,1);
high3 = iHigh(NULL,PERIOD_H1,1);
low3 = iLow(NULL,PERIOD_H1,1);
bandsU3 = iBands(NULL,PERIOD_H1,Bands3prd,2,0,PRICE_CLOSE,MODE_UPPER,1);
bandsL3 = iBands(NULL,PERIOD_H1,Bands3prd,2,0,PRICE_CLOSE,MODE_LOWER,1);

if (TakeProfit < StopLevel * point) TakeProfit = StopLevel * point;
if (TakeProfit_II < StopLevel * point) TakeProfit_II = StopLevel * point;
if (StopLoss < StopLevel * point) StopLoss = StopLevel * point;
if (StopLoss_II < StopLevel * point) StopLoss_II = StopLevel * point;
if (TakeProfit_III < StopLevel * point) TakeProfit_III = StopLevel * point;
if (StopLoss_III < StopLevel * point) StopLoss_III = StopLevel * point;

beghour1 = BegHourSys_I + gmtoffset;
endhour1 = BegHourSys_I + gmtoffset;
beghour3 = BegHourSys_III + gmtoffset;
endhour3 = EndHourSys_III + gmtoffset;

if (beghour1 > 23) beghour1 = beghour1 - 24;
if (beghour1 < 0) beghour1 = beghour1 + 24;
if (beghour3 > 23) beghour3 = beghour3 - 24;
if (beghour3 < 0) beghour3 = beghour3 + 24;
if (endhour1 > 23) endhour1 = endhour1 - 24;
if (endhour1 < 0) endhour1 = endhour1 + 24;
if (endhour3 > 23) endhour3 = endhour3 - 24;
if (endhour3 < 0) endhour3 = endhour3 + 24;

hr2_1 = Hour2_1 + gmtoffset;
hr2_2 = Hour2_2 + gmtoffset;
hr2_3 = Hour2_3 + gmtoffset;
hr2_4 = Hour2_4 + gmtoffset;
hr2_5 = Hour2_5 + gmtoffset;
hr2_6 = Hour2_6 + gmtoffset;
hr2_7 = Hour2_7 + gmtoffset;
hr2_8 = Hour2_8 + gmtoffset;
hr2_9 = Hour2_9 + gmtoffset;
hr2_10 = Hour2_10 + gmtoffset;
hr2_11 = Hour2_11 + gmtoffset;

if (hr2_1 > 23) hr2_1 = hr2_1 - 24;
if (hr2_1 < 0) hr2_1 = hr2_1 + 24;
if (hr2_2 > 23) hr2_2 = hr2_2 - 24;
if (hr2_2 < 0) hr2_2 = hr2_2 + 24;
if (hr2_3 > 23) hr2_3 = hr2_3 - 24;
if (hr2_3 < 0) hr2_3 = hr2_3 + 24;
if (hr2_4 > 23) hr2_4 = hr2_4 - 24;
if (hr2_4 < 0) hr2_4 = hr2_4 + 24;
if (hr2_5 > 23) hr2_5 = hr2_5 - 24;
if (hr2_5 < 0) hr2_5 = hr2_5 + 24;
if (hr2_6 > 23) hr2_6 = hr2_6 - 24;
if (hr2_6 < 0) hr2_6 = hr2_6 + 24;
if (hr2_7 > 23) hr2_7 = hr2_7 - 24;
if (hr2_7 < 0) hr2_7 = hr2_7 + 24;
if (hr2_8 > 23) hr2_8 = hr2_8 - 24;
if (hr2_8 < 0) hr2_8 = hr2_8 + 24;
if (hr2_9 > 23) hr2_9 = hr2_9 - 24;
if (hr2_9 < 0) hr2_9 = hr2_9 + 24;
if (hr2_10 > 23) hr2_10 = hr2_10 - 24;
if (hr2_10 < 0) hr2_10 = hr2_10 + 24;
if (hr2_11 > 23) hr2_11 = hr2_11 - 24;
if (hr2_11 < 0) hr2_11 = hr2_11 + 24;

Slippage = Slippage * point;

bcnt1 = 0;
scnt1 = 0;
bcnt2 = 0;
scnt2 = 0;
bcnt3 = 0;
scnt3 = 0;

modifytime2 = ModifyTime2;
nextmodifytime2 = ModifyTime2 + ModifyPause2;

modifytime3 = ModifyTime3;
nextmodifytime3 = ModifyTime3 + ModifyPause3;

for (i = OrdersTotal() - 1; i >= 0; i--)
   {
   if (!OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
      {
      Print("Error in OrderSelect! Position:",i);
      continue;
      }
   if ((OrderType() <= OP_SELL) && (OrderSymbol() == Symbol()))
      {
      if (OrderMagicNumber() == Magic1)
         {
         if (OrderType() == OP_BUY)
            {
            if ((OrderStopLoss() == 0) && (Hiden_StopAndTarget == false))
               {
               sl1 = NormalizeDouble(OrderOpenPrice() - StopLoss * point,Digits);
               tp1 = NormalizeDouble(OrderOpenPrice() + TakeProfit * point,Digits);
               if (CheckStop(OrderType(),sl1) && CheckTarget(OrderType(),tp1))
                  {
                  OrderModify(OrderTicket(),OrderOpenPrice(),sl1,tp1,0,Green);
                  }
               }
            if (((wCloseCond1(handle,wpr1,OSC_close) == 0) && (Bid > close1 + GapForClose1 * point)) || (Bid >= OrderOpenPrice() + TakeProfit * point) || (Bid <= OrderOpenPrice() - StopLoss * point))
               {
               RefreshRates();
               OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(Bid,Digits),Slippage,Violet);
               }
                  else
               {
               bcnt1++;
               }
            }
               else
            {
            if ((OrderStopLoss() == 0) && (Hiden_StopAndTarget == false))
               {
               sl1 = NormalizeDouble(OrderOpenPrice() + StopLoss * point,Digits);
               tp1 = NormalizeDouble(OrderOpenPrice() - TakeProfit * point,Digits);
               if (CheckStop(OrderType(),sl1) && CheckTarget(OrderType(),tp1))
                  {
                  OrderModify(OrderTicket(),OrderOpenPrice(),sl1,tp1,0,Green);
                  }
               }
            if (((wCloseCond1(handle,wpr1,OSC_close) == 1) && (Bid < close1 - GapForClose1 * point)) || (Ask <= OrderOpenPrice() - TakeProfit * point) || (Ask >= OrderOpenPrice() + StopLoss * point))
               {
               RefreshRates();
               OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(Ask,Digits),Slippage,Violet);
               }
                  else
               {
               scnt1++;
               }
            }
         }
      if (OrderMagicNumber() == Magic2)
         {
         if (OrderType() == OP_BUY)
            {
            if ((OrderStopLoss() == 0) && (Hiden_StopAndTarget == false))
               {
               sl2 = NormalizeDouble(OrderOpenPrice() - StopLoss_II * point,Digits);
               tp2 = NormalizeDouble(OrderOpenPrice() + TakeProfit_II * point,Digits);
               if (CheckStop(OrderType(),sl2) && CheckTarget(OrderType(),tp2))
                  {
                  OrderModify(OrderTicket(),OrderOpenPrice(),sl2,tp2,0,Green);
                  }
               }
            if ((wCloseCond2(handle,close2,lowlevel2,highlevel2,Break * point) == 0) || (Bid >= OrderOpenPrice() + TakeProfit_II * point) || (Bid <= OrderOpenPrice() - StopLoss_II * point))
               {
               RefreshRates();
               OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(Bid,Digits),Slippage,Violet);
               }
                  else
               {
               bcnt2++;
               }
            if (TimeCurrent() >= nextmodifytime2)
               {
               trailing2 = atr2 * ATRTrailingFactor2;
               if (trailing2 > MaxPipsTrailing2 * point) trailing2 = MaxPipsTrailing2 * point;
               if (trailing2 < MinPipsTrailing2 * point) trailing2 = MinPipsTrailing2 * point;
               if (Bid - OrderOpenPrice() > ProfitTrailStart2 * point) trailing2 = ProfitTrail2 * point;
               trail2 = NormalizeDouble(Bid - trailing2,Digits);
               if (Bid - OrderOpenPrice() > trailing2)
                  {
                  if (!Hiden_StopAndTarget) tempsl = OrderStopLoss(); else tempsl = OrderOpenPrice() - StopLoss_II * point;
                  if ((tempsl <= trail2 - Point) && CheckStop(OrderType(),trail2))
                     {
                     ret2 = OrderModify(OrderTicket(),OrderOpenPrice(),trail2,OrderTakeProfit(),0,Blue);
                     if (ret2)
                        {
                        modifytime2 = TimeCurrent();
                        ModifyTime2 = modifytime2;
                        }
                     }
                  }
               }
            }
               else
            {
            if ((OrderStopLoss() == 0) && (Hiden_StopAndTarget == false))
               {
               sl2 = NormalizeDouble(OrderOpenPrice() + StopLoss_II * point,Digits);
               tp2 = NormalizeDouble(OrderOpenPrice() - TakeProfit_II * point,Digits);
               if (CheckStop(OrderType(),sl2) && CheckTarget(OrderType(),tp2))
                  {
                  OrderModify(OrderTicket(),OrderOpenPrice(),sl2,tp2,0,Green);
                  }
               }
            if ((wCloseCond2(handle,close2,lowlevel2,highlevel2,Break * point) == 1) || (Ask <= OrderOpenPrice() - TakeProfit_II * point) || (Ask >= OrderOpenPrice() + StopLoss_II * point))
               {
               RefreshRates();
               OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(Ask,Digits),Slippage,Violet);
               }
                  else
               {
               scnt2++;
               }
            if (TimeCurrent() >= nextmodifytime2)
               {
               trailing2 = atr2 * ATRTrailingFactor2;
               if (trailing2 > MaxPipsTrailing2 * point) trailing2 = MaxPipsTrailing2 * point;
               if (trailing2 < MinPipsTrailing2 * point) trailing2 = MinPipsTrailing2 * point;
               if (OrderOpenPrice() - Ask > ProfitTrailStart2 * point) trailing2 = ProfitTrail2 * point;
               trail2 = NormalizeDouble(Ask + trailing2,Digits);
               if (OrderOpenPrice() - Ask > trailing2)
                  {
                  if (!Hiden_StopAndTarget) tempsl = OrderStopLoss(); else tempsl = OrderOpenPrice() + StopLoss_II * point;
                  if ((tempsl >= trail2 + Point) && CheckStop(OrderType(),trail2))
                     {
                     ret2 = OrderModify(OrderTicket(),OrderOpenPrice(),trail2,OrderTakeProfit(),0,Red);
                     if (ret2)
                        {
                        modifytime2 = TimeCurrent();
                        ModifyTime2 = modifytime2;
                        }
                     }
                  }
               }
            }
         }
      if (OrderMagicNumber() == Magic3)
         {
         if (OrderType() == OP_BUY)
            {
            if ((OrderStopLoss() == 0) && (Hiden_StopAndTarget == false))
               {
               sl3 = NormalizeDouble(OrderOpenPrice() - StopLoss_III * point,Digits);
               tp3 = NormalizeDouble(OrderOpenPrice() + TakeProfit_III * point,Digits);
               if (CheckStop(OrderType(),sl3) && CheckTarget(OrderType(),tp3))
                  {
                  OrderModify(OrderTicket(),OrderOpenPrice(),sl3,tp3,0,Green);
                  }
               }
            if (((((beghour3 <= endhour3) && (TimeHour(TimeCurrent()) >= beghour3) && (TimeHour(TimeCurrent()) <= endhour3)) || ((beghour3 > endhour3) && ((TimeHour(TimeCurrent()) >= beghour3) || (TimeHour(TimeCurrent()) <= endhour3))) && (wCloseCond3(handle,bandsU3,bandsL3,Bands3Range * point,high3,low3,GapForClose3 * point) == 0)) || (Bid >= OrderOpenPrice() + TakeProfit_III * point)) || (Bid <= OrderOpenPrice() - StopLoss_III * point))
               {
               RefreshRates();
               OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(Bid,Digits),Slippage,Violet);
               }
                  else
               {
               bcnt3++;
               }
            if (TimeCurrent() >= nextmodifytime3)
               {
               trailing3 = atr3 * ATRTrailingFactor3;
               if (trailing3 > MaxPipsTrailing3 * point) trailing3 = MaxPipsTrailing3 * point;
               if (trailing3 < MinPipsTrailing3 * point) trailing3 = MinPipsTrailing3 * point;
               trail3 = NormalizeDouble(Bid - trailing3,Digits);
               if (Bid - OrderOpenPrice() > trailing3)
                  {
                  if (!Hiden_StopAndTarget) tempsl = OrderStopLoss(); else tempsl = OrderOpenPrice() - StopLoss_III * point;
                  if ((tempsl <= trail3 - Point) && CheckStop(OrderType(),trail3))
                     {
                     ret3 = OrderModify(OrderTicket(),OrderOpenPrice(),trail3,OrderTakeProfit(),0,Blue);
                     if (ret3)
                        {
                        modifytime3 = TimeCurrent();
                        ModifyTime3 = modifytime3;
                        }
                     }
                  }
               }
            }
               else
            {
            if ((OrderStopLoss() == 0) && (Hiden_StopAndTarget == false))
               {
               sl3 = NormalizeDouble(OrderOpenPrice() + StopLoss_III * point,Digits);
               tp3 = NormalizeDouble(OrderOpenPrice() - TakeProfit_III * point,Digits);
               if (CheckStop(OrderType(),sl3) && CheckTarget(OrderType(),tp3))
                  {
                  OrderModify(OrderTicket(),OrderOpenPrice(),sl3,tp3,0,Green);
                  }
               }
            if (((((beghour3 <= endhour3) && (TimeHour(TimeCurrent()) >= beghour3) && (TimeHour(TimeCurrent()) <= endhour3)) || ((beghour3 > endhour3) && ((TimeHour(TimeCurrent()) >= beghour3) || (TimeHour(TimeCurrent()) <= endhour3))) && (wCloseCond3(handle,bandsU3,bandsL3,Bands3Range * point,high3,low3,GapForClose3 * point) == 1)) || (Ask <= OrderOpenPrice() - TakeProfit_III * point)) || (Ask >= OrderOpenPrice() + StopLoss_III * point))
               {
               RefreshRates();
               OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(Ask,Digits),Slippage,Violet);
               }
                  else
               {
               scnt3++;
               }
            if (TimeCurrent() >= nextmodifytime3)
               {
               trailing3 = atr3 * ATRTrailingFactor3;
               if (trailing3 > MaxPipsTrailing3 * point) trailing3 = MaxPipsTrailing3 * point;
               if (trailing3 < MinPipsTrailing3 * point) trailing3 = MinPipsTrailing3 * point;
               trail3 = NormalizeDouble(Ask + trailing3,Digits);
               if (OrderOpenPrice() - Ask > trailing3)
                  {
                  if (!Hiden_StopAndTarget) tempsl = OrderStopLoss(); else tempsl = OrderOpenPrice() + StopLoss_III * point;
                  if ((tempsl >= trail3 + Point) && CheckStop(OrderType(),trail3))
                     {
                     ret3 = OrderModify(OrderTicket(),OrderOpenPrice(),trail3,OrderTakeProfit(),0,Red);
                     if (ret3)
                        {
                        modifytime3 = TimeCurrent();
                        ModifyTime3 = modifytime3;
                        }
                     }
                  }
               }
            }
         }
      }
   }

if (AccountCurrency() == "JPY") kf = 80;
if (AccountCurrency() == "GBP") kf = 0.625;
if (AccountCurrency() == "EUR") kf = 0.714285714285714;

allowbuy = true;
allowsell = true;

if ((No_Hedge_Trades == true) && ((scnt1 > 0) || (scnt2 > 0) || (scnt3 > 0))) allowbuy = false;
if ((No_Hedge_Trades == true) && ((bcnt1 > 0) || (bcnt2 > 0) || (bcnt3 > 0))) allowsell = false;

if ((NFA_Compatibility == true) && ((scnt1 > 0) || (scnt2 > 0) || (scnt3 > 0) || (bcnt1 > 0) || (bcnt2 > 0) || (bcnt3 > 0)))
   {
   allowbuy = false;
   allowsell = false;
   }


lots1 = MathMin(MaxLot,MathMax(MinLot,LotsSys1));

if (TradeMMSys1 > 0.0)
   {
   lots1 = MathMax(MinLot,MathMin(MaxLot,NormalizeDouble(CalcTradeMMSys1() / kf / 100.0 * AccountFreeMargin() / MinLot / (LotSize / 100),0) * MinLot));
   }

if (lots1 > MaximalLots) lots1 = MaximalLots;

if (AccountFreeMargin() / kf < Ask * lots1 * LotSize / Leverage)
   {
   Print("We have no money. Lots = ",lots1," , Free Margin = ",AccountFreeMargin());
   Comment("We have no money. Lots = ",lots1," , Free Margin = ",AccountFreeMargin());
   return(0);
   }


lots2 = MathMin(MaxLot,MathMax(MinLot,LotsSys2));

if (TradeMMSys2 > 0.0)
   {
   lots2 = MathMax(MinLot,MathMin(MaxLot,NormalizeDouble(CalcTradeMMSys2() / kf / 100.0 * AccountFreeMargin() / MinLot / (LotSize / 100),0) * MinLot));
   }

if (lots2 > MaximalLots) lots2 = MaximalLots;

if (AccountFreeMargin() / kf < Ask * lots2 * LotSize / Leverage)
   {
   Print("We have no money. Lots = ",lots2," , Free Margin = ",AccountFreeMargin());
   Comment("We have no money. Lots = ",lots2," , Free Margin = ",AccountFreeMargin());
   return(0);
   }


lots3 = MathMin(MaxLot,MathMax(MinLot,LotsSys3));

if (TradeMMSys3 > 0.0)
   {
   lots3 = MathMax(MinLot,MathMin(MaxLot,NormalizeDouble(CalcTradeMMSys3() / kf / 100.0 * AccountFreeMargin() / MinLot / (LotSize / 100),0) * MinLot));
   }

if (lots3 > MaximalLots) lots3 = MaximalLots;

if (AccountFreeMargin() / kf < Ask * lots3 * LotSize / Leverage)
   {
   Print("We have no money. Lots = ",lots3," , Free Margin = ",AccountFreeMargin());
   Comment("We have no money. Lots = ",lots3," , Free Margin = ",AccountFreeMargin());
   return(0);
   }

MsgLots = "\n\n   LOTS Sys1 : " + DoubleToStr(lots1,2) + "\n   LOTS Sys2 : " + DoubleToStr(lots2,2) + "\n   LOTS Sys3 : " + DoubleToStr(lots3,2);

if (spread > MaxSPREAD) return(0);

ordtype = -1;

if (Use_FXCOMBO_Scalping != false)
   {
   if ((bcnt1 < 1) && allowbuy && (wOpenCond1(handle,close1,ma1,TREND_STR * point,wpr1,OSC_open,WPR1level,Hour(),beghour1,endhour1) == 0) && (Bid < close1 - GapForClose1 * point))
      {
      descr = "BUY";
      ordtype = OP_BUY;
      clr = Aqua;
      RefreshRates();
      price = NormalizeDouble(Ask,Digits);
      sl = price - StopLoss * point;
      tp = price + TakeProfit * point;
      }
   if ((scnt1 < 1) && allowsell && (wOpenCond1(handle,close1,ma1,TREND_STR * point,wpr1,OSC_open,WPR1level,Hour(),beghour1,endhour1) == 1) && (Bid > close1 + GapForClose1 * point))
      {
      descr = "SELL";
      ordtype = OP_SELL;
      clr = Red;
      RefreshRates();
      price = NormalizeDouble(Bid,Digits);
      sl = price + StopLoss * point;
      tp = price - TakeProfit * point;
      }
   }

if ((ordtype >= 0) && ((StopLevel == 0) || (CheckStop(ordtype,sl) && CheckTarget(ordtype,tp))))
   {
   if (needsltp == 0)
      ticket1 = OrderSend(Symbol(),ordtype,lots1,price,Slippage,0,0,CommentSys1,Magic1,0,clr);
         else
      ticket1 = OrderSend(Symbol(),ordtype,lots1,price,Slippage,sl,tp,CommentSys1,Magic1,0,clr);
   Sleep(5000);
   if (ticket1 > 0)
      {
      if (OrderSelect(ticket1,SELECT_BY_TICKET,MODE_TRADES))
         {
         Print("Order " + descr + " opened!: ",OrderOpenPrice());
         }
      }
         else
      {
      Print("Error opening " + descr + " order!: ",GetLastError());
      }
   }

ordtype = -1;

if ((TimeHour(TimeCurrent()) != hr2_1) && (TimeHour(TimeCurrent()) != hr2_2) && (TimeHour(TimeCurrent()) != hr2_3) && (TimeHour(TimeCurrent()) != hr2_4) && (TimeHour(TimeCurrent()) != hr2_5) && (TimeHour(TimeCurrent()) != hr2_6) && (TimeHour(TimeCurrent()) != hr2_7) && (TimeHour(TimeCurrent()) != hr2_8) && (TimeHour(TimeCurrent()) != hr2_9) && (TimeHour(TimeCurrent()) != hr2_10) && (TimeHour(TimeCurrent()) != hr2_11))
   {
   }
      else
   {
   if (Use_FXCOMBO_Breakout != false)
      {
      if ((scnt2 < 1) && allowsell && (wOpenCond2(handle,close2,lowlevel2,highlevel2,Break * point) == 1))
         {
         descr = "SELL";
         ordtype = OP_SELL;
         clr = Yellow;
         price = NormalizeDouble(Bid,Digits);
         sl = price + StopLoss_II * point;
         tp = price - TakeProfit_II * point;
         }
      if ((bcnt2 < 1) && allowbuy && (wOpenCond2(handle,close2,lowlevel2,highlevel2,Break * point) == 0))
         {
         descr = "BUY";
         ordtype = OP_BUY;
         clr = DodgerBlue;
         price = NormalizeDouble(Ask,Digits);
         sl = price - StopLoss_II * point;
         tp = price + TakeProfit_II * point;
         }
      }
   }

if ((ordtype >= 0) && ((StopLevel == 0) || (CheckStop(ordtype,sl) && CheckTarget(ordtype,tp))))
   {
   if (needsltp == 0)
      ticket2 = OrderSend(Symbol(),ordtype,lots2,price,Slippage,0,0,CommentSys2,Magic2,0,clr);
         else
      ticket2 = OrderSend(Symbol(),ordtype,lots2,price,Slippage,sl,tp,CommentSys2,Magic2,0,clr);
   Sleep(5000);
   if (ticket2 > 0)
      {
      if (OrderSelect(ticket2,SELECT_BY_TICKET,MODE_TRADES))
         {
         Print("Order " + descr + " opened!: ",OrderOpenPrice());
         }
      }
         else
      {
      Print("Error opening " + descr + " order!: ",GetLastError());
      }
   }

ordtype = -1;

if (Use_FXCOMBO_Reversal != false)
   {
   if ((bcnt3 < 1) && allowbuy && (((beghour3 <= endhour3) && (TimeHour(TimeCurrent()) >= beghour3) && (TimeHour(TimeCurrent()) <= endhour3)) || ((beghour3 > endhour3) && ((TimeHour(TimeCurrent()) >= beghour3) || (TimeHour(TimeCurrent()) <= endhour3)))) && (wOpenCond3(handle,bandsU3,bandsL3,Bands3Range * point,high3,low3,GapForClose3 * point) == 0))
      {
      descr = "BUY";
      ordtype = OP_BUY;
      clr = Aqua;
      RefreshRates();
      price = NormalizeDouble(Ask,Digits);
      sl = price - StopLoss_III * point;
      tp = price + TakeProfit_III * point;
      }
   if ((scnt3 < 1) && allowsell && (((beghour3 <= endhour3) && (TimeHour(TimeCurrent()) >= beghour3) && (TimeHour(TimeCurrent()) <= endhour3)) || ((beghour3 > endhour3) && ((TimeHour(TimeCurrent()) >= beghour3) || (TimeHour(TimeCurrent()) <= endhour3)))) && (wOpenCond3(handle,bandsU3,bandsL3,Bands3Range * point,high3,low3,GapForClose3 * point) == 1))
      {
      descr = "SELL";
      ordtype = OP_SELL;
      clr = DeepPink;
      RefreshRates();
      price = NormalizeDouble(Bid,Digits);
      sl = price + StopLoss_III * point;
      tp = price - TakeProfit_III * point;
      }
   }

if ((ordtype >= 0) && ((StopLevel == 0) || (CheckStop(ordtype,sl) && CheckTarget(ordtype,tp))))
   {
   if (needsltp == 0)
      ticket3 = OrderSend(Symbol(),ordtype,lots3,price,Slippage,0,0,CommentSys3,Magic3,0,clr);
         else
      ticket3 = OrderSend(Symbol(),ordtype,lots3,price,Slippage,sl,tp,CommentSys3,Magic3,0,clr);
   Sleep(5000);
   if (ticket3 > 0)
      {
      if (OrderSelect(ticket3,SELECT_BY_TICKET,MODE_TRADES))
         {
         Print("Order " + descr + " opened!: ",OrderOpenPrice());
         }
      }
         else
      {
      Print("Error opening " + descr + " order!: ",GetLastError());
      }
   }
}

//+------------------------------------------------------------------+

double CalcTradeMMSys1()
{
double risk = TradeMMSys1;
int    mod;
int    losscnt = 0;
double point;

if (Digits <= 3) point = 0.01; else point = 0.0001;

for (int i = OrdersHistoryTotal(); i >= 0; i--)
   {
   if (OrderSelect(i,SELECT_BY_POS,MODE_HISTORY))
      {
      if ((OrderType() <= OP_SELL) && (OrderSymbol() == Symbol()) && (OrderMagicNumber() == Magic1))
         {
         if (OrderProfit() > 0.0)
            {
            if (LastMinProfit1 == 0) break;
            if (MathAbs(OrderClosePrice() - OrderOpenPrice()) / point > LastMinProfit1) break;
            continue;
            }
         losscnt++;
         }
      }
   }

if ((losscnt > MaxLossCnt1) && (Module1 > 1))
   {
   mod = MathMod(losscnt,Module1);
   risk = risk * MathPow(LossFactorSys1,mod);
   }

if ((MMMax > 0) && (risk > MMMax)) risk = MMMax;
return(risk);
}

//+------------------------------------------------------------------+

double CalcTradeMMSys2()
{
double risk = TradeMMSys2;
int    mod;
int    losscnt = 0;
double point;

if (Digits <= 3) point = 0.01; else point = 0.0001;

for (int i = OrdersHistoryTotal(); i >= 0; i--)
   {
   if (OrderSelect(i,SELECT_BY_POS,MODE_HISTORY))
      {
      if ((OrderType() <= OP_SELL) && (OrderSymbol() == Symbol()) && (OrderMagicNumber() == Magic2))
         {
         if (OrderProfit() > 0.0)
            {
            if (LastMinProfit2 == 0) break;
            if (MathAbs(OrderClosePrice() - OrderOpenPrice()) / point > LastMinProfit2) break;
            continue;
            }
         losscnt++;
         }
      }
   }

if ((losscnt > MaxLossCnt2) && (Module2 > 1))
   {
   mod = MathMod(losscnt,Module2);
   risk = risk * MathPow(LossFactorSys2,mod);
   }

if ((MMMax > 0) && (risk > MMMax)) risk = MMMax;
return(risk);
}

//+------------------------------------------------------------------+

double CalcTradeMMSys3()
{
double risk = TradeMMSys3;
int    mod;
int    losscnt = 0;
double point;

if (Digits <= 3) point = 0.01; else point = 0.0001;

for (int i = OrdersHistoryTotal(); i >= 0; i--)
   {
   if (OrderSelect(i,SELECT_BY_POS,MODE_HISTORY))
      {
      if ((OrderType() <= OP_SELL) && (OrderSymbol() == Symbol()) && (OrderMagicNumber() == Magic3))
         {
         if (OrderProfit() > 0.0)
            {
            if (LastMinProfit3 == 0) break;
            if (MathAbs(OrderClosePrice() - OrderOpenPrice()) / point > LastMinProfit3) break;
            continue;
            }
         losscnt++;
         }
      }
   }

if ((losscnt > MaxLossCnt3) && (Module3 > 1))
   {
   mod = MathMod(losscnt,Module3);
   risk = risk * MathPow(LossFactorSys3,mod);
   }

if ((MMMax > 0) && (risk > MMMax)) risk = MMMax;
return(risk);
}

//+------------------------------------------------------------------+

int GMTOffset()
{
int    array[4];
int    a[43];
string time;
string s;
int    i;
double offs;

GetSystemTime(array);

int    year = array[0] & 65535;
int    month = array[0] >> 16;
int    day = array[1] >> 16;
int    hour = array[2] & 65535;
int    minute = array[2] >> 16;
int    second = array[3] & 65535;

time = FormatDateTime(year,month,day,hour,minute,second);
offs = TimeCurrent() - StrToTime(time);

MsgTime = "\n\n   Greenwich Mean Time : " + TimeToStr(StrToTime(time),TIME_DATE|TIME_MINUTES|TIME_SECONDS) + "\n   Broker Time : " + TimeToStr(TimeCurrent(),TIME_DATE|TIME_MINUTES|TIME_SECONDS) + "\n   Local Time : " + TimeToStr(TimeLocal(),TIME_DATE|TIME_MINUTES|TIME_SECONDS);

return(MathRound(offs / 3600.0));
}

//+------------------------------------------------------------------+

string FormatDateTime(int year, int mo, int d, int h, int mi, int s)
{
string month = mo + 100;  month = StringSubstr(month,1);
string day = d + 100;     day = StringSubstr(day,1);
string hour = h + 100;    hour = StringSubstr(hour,1);
string minute = mi + 100; minute = StringSubstr(minute,1);
string second = s + 100;  second = StringSubstr(second,1);

return(StringConcatenate(year,".",month,".",day," ",hour,":",minute,":",second));
}

//+------------------------------------------------------------------+

bool CheckStop(int ordtype, double sl)
{
if (Hiden_StopAndTarget) return(true);

bool result = true;
int  stoplevel = MarketInfo(Symbol(),MODE_STOPLEVEL);

if ((stoplevel > 0) && (sl > 0) && (ordtype == OP_BUY) && (sl > Bid - stoplevel * Point))
   {
   result = false;
   }
      else
   {
   if ((stoplevel > 0) && (sl > 0) && (ordtype == OP_SELL) && (sl < Ask + stoplevel * Point))
      {
      result = false;
      }
   }

return(result);
}

//+------------------------------------------------------------------+

bool CheckTarget(int ordtype, double tp)
{
if (Hiden_StopAndTarget) return(true);

bool result = true;
int  stoplevel = MarketInfo(Symbol(),MODE_STOPLEVEL);

if ((stoplevel > 0) && (tp > 0) && (ordtype == OP_BUY) && (tp < Bid + stoplevel * Point))
   {
   result = false;
   }
      else
   {
   if ((stoplevel > 0) && (tp > 0) && (ordtype == OP_SELL) && (tp > Ask - stoplevel * Point))
      {
      result = false;
      }
   }

return(result);
}

//+------------------------------------------------------------------+

int hSession(bool b)
{
string agent;

if (InetHandle0 == 0)
   {
   agent = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Q312461)";
   InetHandle0 = InternetOpenA(agent,InetAccessType0,"0","0",0);
   InetHandle1 = InternetOpenA(agent,InetAccessType1,"0","0",0);
   }

if (b) return(InetHandle1); else return(InetHandle0);
}

//+------------------------------------------------------------------+

string GetData(string str, int start, string delimiter1, string delimiter2, int& pos1)
{
string result = "";
int    pos2;

pos1 = StringFind(str,delimiter1,start);
if (pos1 != -1)
   {
   pos1 = pos1 + StringLen(delimiter1);
   pos2 = StringFind(str,delimiter2,pos1 + 1);
   result = StringTrimLeft(StringTrimRight(StringSubstr(str,pos1,pos2 - pos1)));
   }

return(result);
}

//+------------------------------------------------------------------+

int wInit(int accnumber, bool istesting, bool isdemo)
{
return(dllInit(accnumber,istesting,isdemo));
}

//+------------------------------------------------------------------+

int wOpenCond1(int handle, double close1, double ma1, double trend_str, double wpr1, double osc_open, double wpr1level, int hour, int beghour1, int endhour1)
{
return(dllOpenCond1(handle,close1,ma1,trend_str,wpr1,osc_open,wpr1level,hour,beghour1,endhour1));
}

//+------------------------------------------------------------------+

int wCloseCond1(int handle, double wpr1, double osc_close)
{
return(dllCloseCond1(handle,wpr1,osc_close));
}

//+------------------------------------------------------------------+

int wOpenCond2(int handle, double close2, double lowlevel2, double highlevel2, double break_)
{
return(dllOpenCond2(handle,close2,lowlevel2,highlevel2,break_));
}

//+------------------------------------------------------------------+

int wCloseCond2(int handle, double close2, double lowlevel2, double highlevel2, double break_)
{
return(dllCloseCond2(handle,close2,lowlevel2,highlevel2,break_));
}

//+------------------------------------------------------------------+

int wOpenCond3(int handle, double bandsU3, double bandsL3, double bands3range, double high3, double low3, double gapforclose3)
{
return(dllOpenCond3(handle,bandsU3,bandsL3,bands3range,high3,low3,gapforclose3));
}

//+------------------------------------------------------------------+

int wCloseCond3(int handle, double bandsU3, double bandsL3, double bands3range, double high3, double low3, double gapforclose3)
{
return(dllCloseCond3(handle,bandsU3,bandsL3,bands3range,high3,low3,gapforclose3));
}
//+------------------------------------------------------------------+
bool GrabWeb(string url, string& result)
{
int    iou;
int    irf;
int    bytesread[] = {1};
string buffer = "x";
int    size;

iou = InternetOpenUrlA(hSession(false),url,"0",0,0x84000100,0);
if (iou == 0) return(false);

irf = InternetReadFile(iou,buffer,InetNumOfBytesToRead,bytesread);
if (irf == 0) return(false);

size = bytesread[0];
result = StringSubstr(buffer,0,bytesread[0]);

while (bytesread[0] != 0)
   {
   irf = InternetReadFile(iou,buffer,InetNumOfBytesToRead,bytesread);
   if (bytesread[0] == 0) break;
   size = size + bytesread[0];
   result = result + StringSubstr(buffer,0,bytesread[0]);
   }

irf = InternetCloseHandle(iou);
if (irf == 0) return(false);

return(true);
}

//+------------------------------------------------------------------+

/* Decompiled by exptomql@hotmail.com */