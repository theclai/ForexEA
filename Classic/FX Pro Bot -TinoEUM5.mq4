//+------------------------------------------------------------------+
//|                                         FX Pro Bot -TinoEUM5.mq4 |
//|                                                                  |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Pro_Bot © HotFx 2012.08.06, http://hotfx.0pk.ru"
#property link "http://hot-fx.blogspot.com"
extern double Lot        = 0.1;
extern double LotFor1000 = 0; 
extern double TP         = 0.43;
extern double SL         = 0.28;
extern double AccL       = 2.4;
extern int    Favg       = 5;
extern int    Offs       = 1;
extern int    Savg       = 250;
extern int    SLTP       = 109;
extern string Comm       = "Pro_Bot  http://hot-fx.blogspot.com  http://hotfx.0pk.ru";
extern int    Magic      = 20120806;
extern int    Slippage   = 3;

double MinLot, MaxLot, LotDigits, cA = 0; datetime bt = 0; string symb, txt = "\n Pro_Bot © HotFx, http://hot-fx.blogspot.com, http://hotfx.0pk.ru \n Lot: ";

int init()
 {
  symb = Symbol(); if (Digits == 5 || Digits == 3) Slippage *= 10;
  LotDigits = MathLog(MarketInfo(symb, MODE_LOTSTEP)) / MathLog(0.1);
  MinLot = MarketInfo(symb, MODE_MINLOT); MaxLot = MarketInfo(symb, MODE_MAXLOT);
 }

double Lot()
 {
  if (LotFor1000 != 0) Lot = AccountFreeMargin() / 1000.0 * LotFor1000;
  return(NormalizeDouble(MathMin(MathMax(MinLot, Lot), MaxLot), LotDigits));
 }

double ND(double val) { return (NormalizeDouble(val, Digits)); }

double Acc(int Fa, int Sa)
 {
  double sumF = 0; for (int i = 1; i <= Fa; i++) sumF += Close[i] - Open[i];
  double sumS = 0; for (i = 1; i <= Sa; i++) sumS += MathAbs(Close[i + Offs] - Open[i + Offs]);
  return((sumF / Fa) / (sumS / Sa));
 }

int start()
 { 
  if (Time[1] != bt) { bt = Time[1]; Comment(txt, Lot()); cA = Acc(Favg, Savg); if (MathAbs(cA) <= AccL) cA = 0; }
  if (cA > 0) if (OrderSend(symb, OP_BUY, Lot(), ND(Ask), Slippage, 0, 0, Comm, Magic, 0, Blue) != -1) cA = 0;
  if (cA < 0) if (OrderSend(symb, OP_SELL, Lot(), ND(Bid), Slippage, 0, 0, Comm, Magic, 0, Red) != -1) cA = 0;
  for (int i = OrdersTotal() - 1; i >= 0; i --) if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
   if (OrderSymbol() == symb && OrderMagicNumber() == Magic && OrderStopLoss() == 0)
    {
     double Rg = High[iHighest(symb, 0, MODE_HIGH, SLTP, 1)] - Low[iLowest(symb, 0, MODE_LOW, SLTP, 1)];
     if (OrderType() == OP_BUY) OrderModify(OrderTicket(), OrderOpenPrice(), ND(Ask - Rg * SL), ND(Ask + Rg * TP), 0, Blue);
     else OrderModify(OrderTicket(), OrderOpenPrice(), ND(Bid + Rg * SL), ND(Bid - Rg * TP), 0, Red);
    } 
 }

