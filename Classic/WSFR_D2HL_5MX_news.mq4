


extern string _TP = "Основные входные параметры";
//---
extern int TICK =0;               //--- запрет при тике превышающем значение .если =0 то откл.
extern int TakeProfit = 36;       //--- (10 2 60)
extern int StopLoss = 35;        //--- (100 10 200)
extern bool UseStopLevels = TRUE; //--- Включение стоповых ордеров. Если выключена, то работают только виртуальные тейки и лоссы.
extern bool CloseOnlyProfit = TRUE;
//---
extern int SecureProfit = 2;      //--- (0 1 5) Вывод в безубыток
extern int SecureProfitTriger = 8; //--- (10 2 30)
extern int MaxLossPoints = -65;   //--- (-200 5 -20) Максимальная просадка для закрытия ордеров Buy и Sell при изменении сигнала (При просадке равной от - MaxLossPoints или меньше (например прибыль 0), ордер закроется)
extern double Commis =0;
extern string _PO = "Параметры Ордеров";
extern bool MarketOrder =TRUE;
extern double OrderDOP =5;       //флаг - дистанция доливочного рыночного ордера . если = 0 - откл.
extern double K_OrderDOP = 0.5;   //множитель дистанц. доливочного рыночного ордера  
extern double MinOrderDOP =1;     //minim. дистанция доливочного рыночного ордера
extern double KDOP =2;           //множитель лота доливочного рыночного ордера
extern double KDOP_MAX =2;       //Максимальный множитель лота доливочного рыночного ордера
extern double ModifDOP    = 0;     //флаг - дистанция просадки модификации основного ордера в тейк профит = безубытку
extern bool ModifTake   =FALSE;
extern double LimitOrder = 0;   //флаг - дистанция лимитного ордера . если = 0 - откл.
extern double TimeL =11;         //время экспирации лимитного ордера
extern double KLimit =1.5;       //множитель лота лимитного ордера
extern bool DeleteLimit =  TRUE;//флаг удаления лимитного ордера при стоплосе главного в безубытке
extern bool DeleteLimitU = TRUE; //флаг удаления лимитного ордера при отсутствии условий открытия 
extern double StopOrder = 0;     //флаг - дистанция стопового  ордера
extern double TimeS =20;         //время экспирации стопового  ордера
extern int DOPS = 2;            //условие просадки главного рыночного ордера для открытия стопового в пип
extern double  KStop =1;         //множитель лота стопового ордера
extern bool ModifStop = TRUE;    //флаг модификации стопового ордера при увеличении дистанции от цены ( сохранение дистанции при её увеличении)
extern bool Stop = TRUE;
extern string FE = "==== Friday Exit Rules ====";
extern bool FridayExit = TRUE;
extern int LastTradeHour = 19;
extern int ExitHour = 20;
extern string ME = "==== Monday Start Rules ===="; // задержка начала торгов в понедельник
extern bool MondayStart = TRUE;
extern int StartTradeHour = 04;

//+--------------------------------------------------------------------------------------------------------------+
//| Настройка фильтра новостей
//+--------------------------------------------------------------------------------------------------------------+

extern string _NF = "Новостной фильтр";
extern bool AvoidNews = TRUE; //--- Включение фильтра новостей (В тестере не работает, так как новостной индикатор FFCal генерирует текстовый файл каждую неделю, в котором записаны даты и время новостей на текущую неделю).
//--- То есть во время тестирования будут использоваться только даты за текущую неделю. В тестере AvoidNews отключается автоматически.

//--- Параметры фильтра новостей

extern bool High_Impact = TRUE; //--- Важные новости (При True советник не торгует, если были важные новости). Если вы решили не торговать при важных новостях и поставили High_Impact = TRUE, то далее настраиваем временные фильтры.
//---
extern int MinsUntilNextHighNews = 120; //--- Задержка времени (в минутах) до выхода важной новости. То есть за 2 часа до выхода важной новости (в течении этих 2-х часов) советнику будет дан запрет на торговлю.
extern int MinsSincePrevHighNews = 420; //--- Задержка времени (в минутах) после выхода важной новости. То есть в течении 7-ми часов после выхода важной новости, советнику будет дан запрет на торговлю.
//---
extern bool Medium_Impact = FALSE; //--- Обычные новости
//---
extern int MinsUntilNextMediumNews = 90; //--- Задержка времени (в минутах) до выхода обычной новости.
extern int MinsSincePrevMediumNews = 240; //--- Задержка времени (в минутах) после выхода обычной новости.
//---
extern bool Low_Impact = FALSE; //--- Маловажные новости
//---
extern int MinsUntilNextLowNews = 60; //--- Задержка времени (в минутах) до выхода маловажной новости.
extern int MinsSincePrevLowNews = 60; //--- Задержка времени (в минутах) после выхода маловажной новости.
//---
bool AllowTrading = true; // Обнуление разрешения на торговлю (Необходим для фильтра новостей)

//+--------------------------------------------------------------------------------------------------------------+
//| Трал
//+--------------------------------------------------------------------------------------------------------------+
extern string _tral = "Настройки трала";
extern double TrailingStop = 0;  // 0 -выключен  если менее1 то в долях от профита напр. 0.25... если более1 то обычный
extern double TrailingStep = 0;  // шаг трала
extern double Utral        = 10; // величина профита при которой включается трал

extern string _MM = "Настройка MM";
//---
extern double StartLot = 0;       // лот первого орднра . если = 0 то =мм если больше 0 то =StartLot
extern bool   RecoveryMode = TRUE; //--- Включение режима восстановления депозита (увеличение лота если случился стоп-лосс)
extern double FixedLot = 0.01;     //--- Фиксированный объём лота
extern double AutoMM = 10;       //--- ММ включается если AutoMM > 0. Процент риска. При RecoveryMode = FALSE, менять нужно только это значение.
extern int    TipMM  = 0;        //--- метод расчёта лота (0,1,2)
//extern int    TipTimeMM =0;      //--- метод расчёта лота от времени ( 0- откл. 1 - лот с начала недели. 2 лот с начала месяца )
extern double MaximalLot = 1000;
extern double AutoMM_Max = 20.0;  //--- Максимальный риск
extern int    MaxAnalizCount = 50;   //--- Число закрытых ранее ордеров для анализа(Используется при RecoveryMode = True)
extern double Risk = 25.0;        //--- Риск от депозита (Используется при RecoveryMode = True)
extern double RiskFreeMargin = 0.5;//максимальное соотношение маржи к свободным средствам при расчёте лота доп. ордеров
extern double RiskMargin = 0; //ФЛАГ И СООТНОШЕНИЕ МАРЖИ К СВОБОДНЫМ СРЕДСТВАМ ПРИ КОТОРОМ ЗАПРЕТ ОТКРЫТИЯ
extern double MultiLotPercent = 2; //--- Коэффициент умножение лота (Используется при RecoveryMode = True)

//+--------------------------------------------------------------------------------------------------------------+
//| Периоды индикаторов. Кол-во баров для каждого индикатора.
//+--------------------------------------------------------------------------------------------------------------+

extern string _indl = "Настройки индикаторов LONG";

//--- Периоды индикаторов (Тоже можно будет заоптить, так как для каждой пары свои)
extern int iMA_PeriodLONG = 55; //--- (60 5 100)
extern int iCCI_PeriodLONG  = 18; //--- (10 2 30)
extern int iATR_PeriodLONG  = 14; //--- (10 2 30) 
extern int iWPR_PeriodLONG  = 11; //--- (10 1 20)
extern int iMA_LONG_Open_a = 18; //--- (4 2 20) Фильтр МА для открытия Buy и Sell (Пунты)
extern int iMA_LONG_Open_b = 39; //--- (14 2 50) Фильтр МА для открытия Buy и Sell (Пунты)
extern int iWPR_LONG_Open_a = 1; //--- (-100 1 0) Фильтр WPR для открытия Buy и Sell
extern int iWPR_LONG_Open_b = 5; //--- (-100 1 0) Фильтр WPR для открытия Buy и Sell
extern int iWPR_LONG_Open_a2 = 5; //--- (-100 1 0) 2е усл. Фильтр WPR для открытия Buy и Sell 
extern int iWPR_LONG_Open_a3 = 1; //--- (-100 1 0) 3е усл. Фильтр WPR для открытия Buy и Sell 
extern int iATR_PeriodLONG2  = 3; //--- (10 2 30) 
extern int UMFI_LONG         =50; // Уровень на бай по инд. мфи
extern int UMFI_LONG1        =30; // Уровень на бай по инд. мфи
extern int FilterWL          = 5;
extern int FilterCL          = 250;
extern string _indsh = "Настройки индикаторов SHORT";
extern int iMA_PeriodShort = 55; //--- (60 5 100)
extern int iCCI_PeriodShort = 18; //--- (10 2 30)
extern int iATR_PeriodShort = 14; //--- (10 2 30) 
extern int iWPR_PeriodShort = 11; //--- (10 1 20)
extern int iMA_Short_Open_a = 15; //--- (4 2 20) Фильтр МА для открытия Buy и Sell (Пунты)
extern int iMA_Short_Open_b = 39; //--- (14 2 50) Фильтр МА для открытия Buy и Sell (Пунты)
extern int iWPR_Short_Open_a = 1; //--- (-100 1 0) Фильтр WPR для открытия Buy и Sell
extern int iWPR_Short_Open_b = 5; //--- (-100 1 0) Фильтр WPR для открытия Buy и Sell
extern int iWPR_Short_Open_a2 = 5; //--- (-100 1 0) 2е усл. Фильтр WPR для открытия Buy и Sell 
extern int iWPR_Short_Open_a3 = 1; //--- (-100 1 0) 3е усл. Фильтр WPR для открытия Buy и Sell 
extern int iATR_PeriodShort2 = 3; //--- (10 2 30)
extern int UMFI_Short        =50; // Уровень  на селл по инд. мфи
extern int UMFI_Short1       =70; // Уровень  на селл по инд. мфи 
extern int FilterWS          = 95;
extern int FilterCS          = 250;
//+--------------------------------------------------------------------------------------------------------------+
//| Параметры оптимизации для правил открытия и закрытия позиции.
//+--------------------------------------------------------------------------------------------------------------+
extern string _Add_Op = "Расширенные параметры оптимизации";
//---
extern string _AddOpenFilters = "---";
extern int FilterATR = 6; //--- (0 1 10) Проверка на вход по ATR для Buy и Sell (if (iATR_Signal <= FilterATR * pp) return (0);) (!) Можно не оптить
extern int iCCI_OpenFilter = 170; //---  Фильтр по iCCI для Buy и Sell. 
extern int iCCI_OpenFilter1 = 200; //---  Фильтр по iCCI для Buy и Sell. 
extern int iCCI_OpenFilter2 = 250; //---  Фильтр по iCCI для Buy и Sell. 
extern string _CloseOrderFilters = "---";
//---
extern int Price_Filter_Close = 14; //--- (10 2 20) Фильтр цены открытия для закрытия Buy и Sell (Пунты)
extern int iWPR_Filter_Close =  90; //--- (0 1 -100) Фильтр WPR для закрытия Buy и Sell
extern int PWPR_Close =  15;
extern int TF_Close =  15;

//+--------------------------------------------------------------------------------------------------------------+
//| Расширенные настройки
//+--------------------------------------------------------------------------------------------------------------+

extern string _Add = "Расширенные настройки";
//extern int NormalizeLot = 2; //--- нормализация лота если мин.лот =0.1 то =1 если же =0.01 то =2
extern double Slippage = 2;
extern double Korrect =10;
extern bool AccountOrder =FALSE;//--- учёт ордеров при откр. дополнительных. если =true то учитывает только основной если =false то все

extern string _zap = "Настройки - флаги и ограничения";
extern bool Long = TRUE; //--- Выключатель длинных позиций
extern bool Short = TRUE; //--- Выключатель коротких позиций
//--- Выключатели Доп. учловий на бай и селл
extern bool UDB1=true ;
extern bool UDB2=true;
extern bool UDB3=true;
extern bool UDS1=true ;
extern bool UDS2=true;
extern bool UDS3=true;
extern double MaxSpread = 2;
extern int AccountBar =1;//--- запрет открытия в баре =тф
extern double BalansMargin =0;//флаг включения и соотношения маржа / свободные средства
extern double BalansEquity =1.2;
extern int MaxDop = 0;//флаг включения и ограничения количества доп. ордеров
extern bool   VirtuaiModif = TRUE;
extern bool   PAUSE_NEWS = FALSE;   //флаг включения паузы

//+--------------------------------------------------------------------------------------------------------------+
//| Часы работы эксперта
//+--------------------------------------------------------------------------------------------------------------+
extern string News = "Время торговой паузы";
extern double HOUR_START_PAUSE =14;//час начала паузы
extern double HOUR_END_PAUSE = 1; //час окончания паузы
extern double DEI_START_PAUSE = 5; //день начала паузы
extern double DEI_END_PAUSE = 1;   //день окончания паузы
extern double START_PAUSE =0;      //время и флаг начала ежедневного перерыва 
extern double END_PAUSE = 6;       //время окончания ежедневного перерыва 

extern int MagicNumber = 777;
extern int MagicNumber1 = 888;

extern color LC1=Gold;
extern color LC=Lime;
//+--------------------------------------------------------------------------------------------------------------+
//| Блок дополнительных переменных
//+--------------------------------------------------------------------------------------------------------------+

double pp;
int pd,z=0,K;
double cf;
string EASymbol; //--- Текущий символ
double CloseSlippage = 3; //--- Проскальзывание для закрытия ордера
int SP;
int CloseSP;
int MaximumTrades = 1;
double NDMaxSpread; //--- Максимальный спред ввиде пунктов
bool CheckSpreadRule; //--- Правило для проверки спреда перед открытием (Останавливает зацикливание сообщений о превышенном спреде)
string OpenOrderComment = "WSFR";
int RandomOpenTimePercent = 0; //--- Используется при занятом потоке комманд терминала, своебразная рендомная пауза. Выражается в секундах.
//---

//--- Параметры для автолота
double MinLot = 0.01;
double MaxLot = 0.01;
double LotStep = 0.01;
int LotValue = 100000;
double FreeMargin = 1000.0;
double LotPrice = 1;
double LotSize;
double LotSiz;
//--- Параметры на открытие

int iWPR_Filter_OpenLong_a;
int iWPR_Filter_OpenLong_b;
int iWPR_Filter_OpenShort_a;
int iWPR_Filter_OpenShort_b;

int iWPR_Filter_OpenLong_a2;
int iWPR_Filter_OpenLong_b2;
int iWPR_Filter_OpenShort_a2;
int iWPR_Filter_OpenShort_b2;

int iWPR_Filter_OpenLong_a3;
int iWPR_Filter_OpenShort_a3;
//--- Параметры на закрытие

int iWPR_Filter_CloseLong;
int iWPR_Filter_CloseShort;

//---
color OpenBuyColor = Green;
color OpenSellColor = Red;
color CloseBuyColor = DodgerBlue;
color CloseSellColor = DeepPink;
//---
bool SoundAlert = TRUE; //--- Звуковое оповещение об открытии/закрытии сделки
string SoundFileAtOpen = "alert.wav";
string SoundFileAtClose = "alert.wav";
int Dist = 1; //--- Дополнительный фильтр проверки цены после открытия ордера.
bool OpenAddOrderRule = FALSE; //--- При включении данной торговли новые ордера не будут не будут открываться. Необходима если вы решили остановить торговлю, но не хотите чтобы советник терял открытые им ордера.
///////////////////////////////////////////

//+--------------------------------------------------------------------------------------------------------------+
//| INIT. Инициализация некоторых переменных, удаление объектов на графике.
//+--------------------------------------------------------------------------------------------------------------+
void init() {
//+--------------------------------------------------------------------------------------------------------------+
 
   EASymbol = Symbol(); //--- Инициализация текущено символа
   //---
   if (Digits < 4) {
      pp = 0.01;
      pd = 2;
      cf = 0.009;
      
   } else {
      pp = 0.0001;
      pd = 4;
      cf = 0.00009;
   }
   if (Digits == 4)K=1;
   if (Digits == 5)K=10;
   if (Digits == 3)K=Korrect;
   if (Digits == 2)K=Korrect/10;
   //---
   SP = Slippage * MathPow(10, Digits - pd); //--- Расчет проскальзывания цены для пятизнака
   CloseSP = CloseSlippage * MathPow(10, Digits - pd);
   NDMaxSpread = NormalizeDouble(MaxSpread * pp, pd + 1); //--- Преобразование значения MaxSpread в пункты
   
   //--- Инициализация параметров для MM
   
   MinLot = MarketInfo(Symbol(), MODE_MINLOT);
   MaxLot = MarketInfo(Symbol(), MODE_MAXLOT);
   if(MaxLot > MaximalLot)MaxLot = MaximalLot;
   LotValue = MarketInfo(Symbol(), MODE_LOTSIZE);
   LotStep = MarketInfo(Symbol(), MODE_LOTSTEP);
   FreeMargin = MarketInfo(Symbol(), MODE_MARGINREQUIRED);
   
   //--- Получение значения стоимости лота конкретного символа исходя из парамтеров вашего брокера.
   double SymbolBid = 0;
   if (StringSubstr(AccountCurrency(), 0, 3) == "JPY") {
      SymbolBid = MarketInfo("USDJPY" + StringSubstr(Symbol(), 6), MODE_BID);
      if (SymbolBid > 0.1) LotPrice = SymbolBid;
      else LotPrice = 84;
   }
   //---
   if (StringSubstr(AccountCurrency(), 0, 3) == "GBP") {
      SymbolBid = MarketInfo("GBPUSD" + StringSubstr(Symbol(), 6), MODE_BID);
      if (SymbolBid > 0.1) LotPrice = 1 / SymbolBid;
      else LotPrice = 0.6211180124;
   }
   //---
   if (StringSubstr(AccountCurrency(), 0, 3) == "EUR") {
      SymbolBid = MarketInfo("EURUSD" + StringSubstr(Symbol(), 6), MODE_BID);
      if (SymbolBid > 0.1) LotPrice = 1 / SymbolBid;
      else LotPrice = 0.7042253521;
   }
   

       //--- Параметры на открытие
   
   iWPR_Filter_OpenLong_a = iWPR_LONG_Open_a;
   iWPR_Filter_OpenLong_b = iWPR_LONG_Open_b;
   iWPR_Filter_OpenShort_a = 100 - iWPR_Short_Open_a;
   iWPR_Filter_OpenShort_b = 100 - iWPR_Short_Open_b;
   
   iWPR_Filter_OpenLong_a2 = iWPR_LONG_Open_a2;
   iWPR_Filter_OpenShort_a2 = 100 - iWPR_Short_Open_a2;
   
   iWPR_Filter_OpenLong_a3 = iWPR_LONG_Open_a3;
   iWPR_Filter_OpenShort_a3 = 100 - iWPR_Short_Open_a3;   
   //--- Параметры на закрытие
   
   iWPR_Filter_CloseLong = iWPR_Filter_Close;
   iWPR_Filter_CloseShort = 100 - iWPR_Filter_Close;
   //---
   return (0);
   
}

//+--------------------------------------------------------------------------------------------------------------+
//| DEINIT. Удаление объектов на графике.
//+--------------------------------------------------------------------------------------------------------------+
int deinit() {
//+--------------------------------------------------------------------------------------------------------------+
   ObjectDelete("P");
   ObjectDelete("Spread");
   ObjectDelete("lot");
   ObjectDelete("lot1");
   ObjectDelete("lot2");
   ObjectDelete("lot3");
   ObjectDelete("NP");
   ObjectDelete("NP1");
   //---
   return (0);
   
}

//+--------------------------------------------------------------------------------------------------------------+
//| START. Проверка на ошибки, а также старт функции Scalper.
//+--------------------------------------------------------------------------------------------------------------+
int start() {

   string ls_0 = "";
   static bool AllowTrading=true; // Разрешение на торговлю
   //--- Инициализация фильтра новостей
   if(AvoidNews && !IsTesting()) {
      static int PrevMinute=-1;  
   
      int MinSinceHighNews=iCustom(NULL,0,"FFCal",true,false,false,true,true,1,0);
      int MinUntilHighNews=iCustom(NULL,0,"FFCal",true,false,false,true,true,1,1);
      
      int MinSinceMediumNews=iCustom(NULL,0,"FFCal",false,true,false,true,true,1,0);
      int MinUntilMediumNews=iCustom(NULL,0,"FFCal",false,true,false,true,true,1,1);
      
      int MinSinceLowNews=iCustom(NULL,0,"FFCal",false,false,true,true,true,1,0);
      int MinUntilLowNews=iCustom(NULL,0,"FFCal",false,false,true,true,true,1,1);


      //--- Фильтр новостей
      if(Minute()!=PrevMinute) {
      
          AllowTrading=true;
          PrevMinute=Minute();
          
          if (High_Impact)
             if (MinUntilHighNews <= MinsUntilNextHighNews || MinSinceHighNews <= MinsSincePrevHighNews) AllowTrading=false;
             
          if (Medium_Impact)
             if (MinUntilMediumNews <= MinsUntilNextMediumNews || MinSinceMediumNews <= MinsSincePrevMediumNews) AllowTrading=false;
             
          if (Low_Impact)
             if (MinUntilLowNews <= MinsUntilNextLowNews || MinSinceLowNews <= MinsSincePrevLowNews) AllowTrading=false;    
      }
   } //--- закрытие AvoidNews

//+--------------------------------------------------------------------------------------------------------------+

  if (FridayExit && DayOfWeek() == 5 && Hour() > LastTradeHour) return (0);
  if (MondayStart && DayOfWeek() == 1 && Hour() < StartTradeHour) return (0);

 // ВРЕМЯ......................................................
  int pa =0;
  if(Hour()>= START_PAUSE&&Hour()<END_PAUSE&& START_PAUSE>0)
    {pa=1;}
  if(DayOfWeek()>=DEI_START_PAUSE&&Hour()>=HOUR_START_PAUSE && PAUSE_NEWS == true)
    {pa=1;}
  if(DayOfWeek()<=DEI_END_PAUSE&&Hour()<=HOUR_END_PAUSE && PAUSE_NEWS == true )
    {pa=1;}
   if( pa==1)
    {
    ObjectCreate("P", OBJ_LABEL, 0, 0, 0, 0, 0);
    ObjectSet("P", OBJPROP_CORNER, 2);
    ObjectSet("P", OBJPROP_YDISTANCE, 75);
    ObjectSet("P", OBJPROP_XDISTANCE, 10);
    ObjectSetText("P", "ПЕРЕРЫВ! " , 20, "Tahoma", Red);  
    }  
    if( pa==0) ObjectDelete("P"); 
   CloseOrders(); //--- Сопровождение ордеров
   ModifyOrders(); //--- Вывод в безубыток
   if(OrderDOP > 0)Dmarket(pa);
   if(LimitOrder > 0)Dlimit(pa);
   if(StopOrder > 0)Dstop(pa);
   if(ModifDOP >0)Grafik();
   if((Ask-Bid)>MaxSpread*Point*K)
   {
    ObjectCreate("Spread", OBJ_LABEL, 0, 0, 0, 0, 0);
    ObjectSet("Spread", OBJPROP_CORNER, 2);
    ObjectSet("Spread", OBJPROP_YDISTANCE, 45);
    ObjectSet("Spread", OBJPROP_XDISTANCE, 10);
    ObjectSetText("Spread", "Spread ! " + DoubleToStr((Ask - Bid) / Point, 0), 20, "Tahoma", Red);  
   }
   if((Ask-Bid)<MaxSpread*Point*K)ObjectDelete("Spread");
   if (TICK>0&&iVolume(Symbol(),1,0)>TICK)return(0);
   //--- Инициализация объёма сдеки
   if (AutoMM > 0.0 && (!RecoveryMode)) LotSize = MathMax(MinLot, MathMin(MaxLot, MathCeil(MathMin(AutoMM_Max, AutoMM) / LotPrice / 100.0 * AccountFreeMargin() / LotStep / (LotValue / 100)) * LotStep));
   if (AutoMM > 0.0 && RecoveryMode) LotSize = CalcLots(); //--- Если включен RecoveryMode используем CalcLots
   if (AutoMM == 0.0) LotSize = FixedLot;
   if (DayOfWeek() == 1 && iVolume(NULL, PERIOD_D1, 0) < 5.0) return (0);
   if (StringLen(EASymbol) < 6) return (0);   
   if ((!IsTesting()) && IsStopped()) return (0);
   if ((!IsTesting()) && !IsTradeAllowed()) return (0);
   if ((!IsTesting()) && IsTradeContextBusy()) return (0);
   HideTestIndicators(FALSE);
   
         ls_0 = ls_0 
      + "\n  " 
      + "\n " 
      + "\n  Authorization - OK!" 
      + "\n -----------------------------------------------" 
      + "\n  SL = " + StopLoss + " pips / TP = " + TakeProfit + " pips" 
   + "\n  Spread = " + DoubleToStr((Ask - Bid) / pp, 1) + " pips";
   if (Ask - Bid > MaxSpread * pp) ls_0 = ls_0 + " - TOO HIGH";
   else ls_0 = ls_0 + " - NORMAL";
   ls_0 = ls_0 
   + "\n -----------------------------------------------";
   if (AutoMM > 0.0) {
      ls_0 = ls_0 
         + "\n  AutoMM - ENABLED" 
      + "\n  Risk = " + DoubleToStr(AutoMM, 1) + "%";
   }
   ls_0 = ls_0 
   + "\n  Trading Lots = " + DoubleToStr(LotSize, 2);
   ls_0 = ls_0 
   + "\n -----------------------------------------------";
   if (RecoveryMode) {
      ls_0 = ls_0 
      + "\n  Recovery Mode - ENABLED";
   } else {
      ls_0 = ls_0 
      + "\n  Recovery Mode - DISABLED";
   }
   ls_0 = ls_0 
   + "\n -----------------------------------------------";
   if (AvoidNews) {
      ls_0 = ls_0 
      + "\n  Новости - вкл.";
      if(High_Impact) ls_0 = ls_0 + "\n  High";
      if(High_Impact&&Medium_Impact) ls_0 = ls_0 + "\n  High, Medium";
      if(High_Impact&&Medium_Impact&&Low_Impact) ls_0 = ls_0 + "\n  High, Medium, Low";      
   } else {
      ls_0 = ls_0 
      + "\n  Новости - выкл.";
   }
   ls_0 = ls_0 
   + "\n -----------------------------------------------";
   ls_0 = ls_0 
   + "\n  mod by ugrael@gmail.com";

    Comment(ls_0);
   if (ObjectFind("BKGR") < 0) {
      ObjectCreate("BKGR", OBJ_LABEL, 0, 0, 0);
      ObjectSetText("BKGR", "g", 110, "Webdings", LightSlateGray);
      ObjectSet("BKGR", OBJPROP_CORNER, 0);
      ObjectSet("BKGR", OBJPROP_BACK, TRUE);
      ObjectSet("BKGR", OBJPROP_XDISTANCE, 5);
      ObjectSet("BKGR", OBJPROP_YDISTANCE, 15);
   }
   if (ObjectFind("BKGR2") < 0) {
      ObjectCreate("BKGR2", OBJ_LABEL, 0, 0, 0);
      ObjectSetText("BKGR2", "g", 110, "Webdings", DimGray);
      ObjectSet("BKGR2", OBJPROP_BACK, TRUE);
      ObjectSet("BKGR2", OBJPROP_XDISTANCE, 5);
      ObjectSet("BKGR2", OBJPROP_YDISTANCE, 60);
   }
   if (ObjectFind("BKGR3") < 0) {
      ObjectCreate("BKGR3", OBJ_LABEL, 0, 0, 0);
      ObjectSetText("BKGR3", "g", 110, "Webdings", DimGray);
      ObjectSet("BKGR3", OBJPROP_CORNER, 0);
      ObjectSet("BKGR3", OBJPROP_BACK, TRUE);
      ObjectSet("BKGR3", OBJPROP_XDISTANCE, 5);
      ObjectSet("BKGR3", OBJPROP_YDISTANCE, 45);
   }
   if (ObjectFind("LV") < 0) {
      ObjectCreate("LV", OBJ_LABEL, 0, 0, 0);
      ObjectSetText("LV", "WALL STREET ROBOT", 9, "Tahoma Bold", White);
      ObjectSet("LV", OBJPROP_CORNER, 0);
      ObjectSet("LV", OBJPROP_BACK, FALSE);
      ObjectSet("LV", OBJPROP_XDISTANCE, 13);
      ObjectSet("LV", OBJPROP_YDISTANCE, 23);
   }
   if (ObjectFind("BKGR4") < 0) {
      ObjectCreate("BKGR4", OBJ_LABEL, 0, 0, 0);
      ObjectSetText("BKGR4", "g", 110, "Webdings", DimGray);
      ObjectSet("BKGR4", OBJPROP_CORNER, 0);
      ObjectSet("BKGR4", OBJPROP_BACK, TRUE);
      ObjectSet("BKGR4", OBJPROP_XDISTANCE, 5);
      ObjectSet("BKGR4", OBJPROP_YDISTANCE, 84);
   }

   //---Стратегия_Скальпинг_1==TRUE&&0.03
   //if(iATR(Symbol(),15,3,0)>iATR(Symbol(),15,3,3)&&iATR(Symbol(),1440,1,0)>0.001)//||(iATR(Symbol(),15,2,0)<0.001&&iATR(Symbol(),1440,1,0)>iATR(Symbol(),1440,1,1)))
  // {
   if(pa==0)Scalper();
  // }
    ObjectCreate("lot", OBJ_LABEL, 0, 0, 0, 0, 0);
    ObjectSet("lot", OBJPROP_CORNER, 2);
    ObjectSet("lot", OBJPROP_YDISTANCE, 95);
    ObjectSet("lot", OBJPROP_XDISTANCE, 10);
    ObjectSetText("lot", "Lot = " + DoubleToStr(LotSize,2), 10, "Tahoma", Lime);  
    if( OrderDOP>0 )
    {
    ObjectCreate("lot1", OBJ_LABEL, 0, 0, 0, 0, 0);
    ObjectSet("lot1", OBJPROP_CORNER, 2);
    ObjectSet("lot1", OBJPROP_YDISTANCE, 115);
    ObjectSet("lot1", OBJPROP_XDISTANCE, 10);
    ObjectSetText("lot1", "LotDop = " + DoubleToStr(KDOP*LotSize,2), 10, "Tahoma", DodgerBlue);
    }
    if( LimitOrder>0 )
    {
    ObjectCreate("lot2", OBJ_LABEL, 0, 0, 0, 0, 0);
    ObjectSet("lot2", OBJPROP_CORNER, 2);
    ObjectSet("lot2", OBJPROP_YDISTANCE, 135);
    ObjectSet("lot2", OBJPROP_XDISTANCE, 10);
    ObjectSetText("lot2", "LimiLot = " + DoubleToStr(KLimit*LotSize,2), 10, "Tahoma", DodgerBlue);
    }
    if( StopOrder>0 )
    {
    ObjectCreate("lot3", OBJ_LABEL, 0, 0, 0, 0, 0);
    ObjectSet("lot3", OBJPROP_CORNER, 2);
    ObjectSet("lot3", OBJPROP_YDISTANCE, 155);
    ObjectSet("lot3", OBJPROP_XDISTANCE, 10);
    ObjectSetText("lot3", "StopLot = " + DoubleToStr(KStop*LotSize,2), 10, "Tahoma", DodgerBlue);
    }

   return (0);
}

//+--------------------------------------------------------------------------------------------------------------+
//| Scalper. Основная функция. Сначало производится проверка спреда, далее проверка сигналов на вход.
//+--------------------------------------------------------------------------------------------------------------+
void Scalper() {
//+--------------------------------------------------------------------------------------------------------------+
    
   //--- Сообщение о превышенном спреде
   if (MaxSpreadFilter()) {
      
         CheckSpreadRule = TRUE;
      } else {
      CheckSpreadRule = FALSE;
      if (OpenLongSignal() && OpenTradeCount() && Long && AllowTrading) OpenPosition(OP_BUY);
      if (OpenShortSignal() && OpenTradeCount() && Short && AllowTrading) OpenPosition(OP_SELL);
    } 
  return (0);
}

//+--------------------------------------------------------------------------------------------------------------+
//| OpenPosition. Функция открытия позиции.
//+--------------------------------------------------------------------------------------------------------------+
int OpenPosition(int OpType) {
//+--------------------------------------------------------------------------------------------------------------+
   int bl=0,sl=0,bs=0,ss=0,rb=0,rs=0,zap=0;

   for (int i = OrdersTotal() - 1; i >= 0; i--)
    {
    if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES) && OrderSymbol() == Symbol()) 
    {    
    if (OrderType()==OP_BUYLIMIT&&OrderMagicNumber()==MagicNumber)bl=1;
    if (OrderType()==OP_SELLLIMIT&&OrderMagicNumber()==MagicNumber)sl=1;
    if (OrderType()==OP_SELLSTOP&&OrderMagicNumber()==MagicNumber)ss=1;
    if (OrderType()==OP_BUYSTOP&&OrderMagicNumber()==MagicNumber)bs=1;
    if (OrderMagicNumber()==MagicNumber||OrderMagicNumber()==MagicNumber1&&
        BalansMargin*AccountMargin()>AccountFreeMargin()&&BalansMargin>0)zap=1;
    }
    }
   int B=0,S=0;
   int RandomOpenTime; //--- Задержка по времени на открытие
   double DistLevel; //--- Цена покупки или продажи. Необходима для проверки дистанции открытия
   color OpenColor; //--- Цвет открытия позиции. Если Buy то голубая, если Sell то красная
   int OpenOrder; //--- Открытие позиции
   int OpenOrderError; //--- Ошибка открытия
   string OpTypeString; //--- Преобразования вида позиции в текстовое значение
   double OpenPrice; //--- Цена открытия
   //---
   double TP, SL;
   double OrderTP = NormalizeDouble (TakeProfit * pp , pd); //--- Преобразуем тейк-профит в вид Points
   double OrderSL = NormalizeDouble (StopLoss * pp , pd); //--- Преобразуем стоп-лосс в вид Points
     
   //--- Задержка в секундах между открытиями
   if (RandomOpenTimePercent > 0) {
      MathSrand(TimeLocal());
      RandomOpenTime = MathRand() % RandomOpenTimePercent;
     
      Sleep(1000 * RandomOpenTime);
   } 
   
   double OpenLotSize = LotSize;
   if (StartLot>0)OpenLotSize=StartLot;
   if (AccountFreeMarginCheck(EASymbol, OpType, OpenLotSize) <= 0.0 || GetLastError() == 134/* NOT_ENOUGH_MONEY */) {
     
      return (-1);
   } 
   
   RefreshRates();
   if (OpType == OP_BUY) {
      B=1;
      OpenPrice = NormalizeDouble(Ask, Digits);
      OpenColor = OpenBuyColor;
      if (UseStopLevels) { //--- Если включены стоп-уровни (стоп-лосс и тейк-профит)
      
      TP = NormalizeDouble(OpenPrice + OrderTP, Digits); //--- То расчитывает тейк-профит
      SL = NormalizeDouble(OpenPrice - OrderSL, Digits); //--- и стоп-лосс
      } else {TP = 0; SL = 0;}
   
    } else {
      S=1;
      OpenPrice = NormalizeDouble(Bid, Digits);
      OpenColor = OpenSellColor;
      if (UseStopLevels) {
       
      TP = NormalizeDouble(OpenPrice - OrderTP, Digits);
      SL = NormalizeDouble(OpenPrice + OrderSL, Digits);
      }
      else {TP = 0; SL = 0;}
   }
   
   int MaximumTradesCount = MaximumTrades; //--- Счетчик открытых позиций
   while (MaximumTradesCount > 0 && OpenTradeCount()) { //--- Если MaximumTrades равно хотябы 1-му, то происходит открытие
      //---OpenOrder =
      if (MarketOrder==TRUE&&B==1&&zap==0)OrderSend(EASymbol, OP_BUY, OpenLotSize, NormalizeDouble(Ask, Digits), SP, 0, 0, OpenOrderComment, MagicNumber, 0, OpenColor);
      if (MarketOrder==TRUE&&S==1&&zap==0)OrderSend(EASymbol, OP_SELL, OpenLotSize, NormalizeDouble(Bid, Digits), SP, 0, 0, OpenOrderComment, MagicNumber, 0, OpenColor);
      if (LimitOrder>0&&B==1&&bl==0&&zap==0)OrderSend(EASymbol, OP_BUYLIMIT, OpenLotSize, NormalizeDouble(Bid-LimitOrder*Point*K, Digits), SP, 0, 0, OpenOrderComment, MagicNumber, 0, OpenColor);
      if (LimitOrder>0&&S==1&&sl==0&&zap==0)OrderSend(EASymbol, OP_SELLLIMIT, OpenLotSize, NormalizeDouble(Ask+LimitOrder*Point*K, Digits), SP, 0, 0, OpenOrderComment, MagicNumber, 0, OpenColor);
      if (Stop == TRUE&&StopOrder>0&&B==1&&bl==0&&zap==0)OrderSend(EASymbol, OP_BUYSTOP, OpenLotSize, NormalizeDouble(Ask+StopOrder*Point*K, Digits), SP, 0, 0, OpenOrderComment, MagicNumber, 0, OpenColor);
      if (Stop == TRUE&&StopOrder>0&&S==1&&sl==0&&zap==0)OrderSend(EASymbol, OP_SELLSTOP, OpenLotSize, NormalizeDouble(Bid-StopOrder*Point*K, Digits), SP, 0, 0, OpenOrderComment, MagicNumber, 0, OpenColor);
      
      Sleep(MathRand() / 1000); 
      if (OpenOrder < 0) { 
         OpenOrderError = GetLastError(); 
        
         if (OpenOrderError != 136/* OFF_QUOTES */) break; //--- Если нет цен, то прекращаем цикл
         if (!(OpenAddOrderRule)) break; //--- Если нет разрешения на открытие позиции, то прекращаем цикл
         Sleep(6000); 
         RefreshRates(); 
         if (OpType == OP_BUY) DistLevel = NormalizeDouble(Ask, Digits); //--- Получаем новые цены покупки и продажи
         else DistLevel = NormalizeDouble(Bid, Digits);
         if (NormalizeDouble(MathAbs((DistLevel - OpenPrice) / pp), 0) > Dist) break; //--- Вначале возвращает абсолютное значение разницы между текущим курсом и ценой открытия, далее сравнивает полученное с значение со значением переменной Dist
         OpenPrice = DistLevel; 
         MaximumTradesCount--;  if (MaximumTradesCount > 0) {
         } 
         } 
         
         else {
         if (OrderSelect(OpenOrder, SELECT_BY_TICKET)) OpenPrice = OrderOpenPrice();
         if (!(SoundAlert)) break; 
         PlaySound(SoundFileAtOpen);
         break;
      } 
   } 
   return (OpenOrder);
}

//+--------------------------------------------------------------------------------------------------------------+
//| ModifyOrders. Модификация ордеров в безубыток.
//+--------------------------------------------------------------------------------------------------------------+
void ModifyOrders() {
//+--------------------------------------------------------------------------------------------------------------+

   bool TicketModify; //--- Закрытие ордера
   int total = OrdersTotal() - 1;
   int ModifyError ;
   int ModifyTicketID ;
   int kbar;
   string ModifyOrderType ;
   //---
   for (int i = total; i >= 0; i--) { //--- Счетчик открытых ордеров
      if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
     
     if (OrderType() == OP_BUY) {
         if (OrderMagicNumber() == MagicNumber||OrderMagicNumber() == MagicNumber1 && OrderSymbol() == EASymbol&&OrderStopLoss()==0&&OrderTakeProfit()==0) {
             TicketModify = OrderModify(OrderTicket(), OrderOpenPrice(),NormalizeDouble(OrderOpenPrice()- StopLoss*Point*K,Digits), NormalizeDouble(OrderOpenPrice()+TakeProfit*Point*K,Digits), 0, Blue);
           }
           }
      if (OrderType() == OP_SELL) {
         if (OrderMagicNumber() == MagicNumber||OrderMagicNumber() == MagicNumber1 && OrderSymbol() == EASymbol&&OrderStopLoss()==0&&OrderTakeProfit()==0) {
             TicketModify = OrderModify(OrderTicket(), OrderOpenPrice(),NormalizeDouble(OrderOpenPrice()+ StopLoss*Point*K,Digits), NormalizeDouble(OrderOpenPrice()-TakeProfit*Point*K,Digits), 0, Blue);
           }
           }
 //----------------------------------------------------------------------------------------------------------------------------------------------------
      if (OrderType() == OP_BUY) {
         if (OrderMagicNumber() == MagicNumber||OrderMagicNumber() == MagicNumber1 && OrderSymbol() == EASymbol&&OrderStopLoss()==0&&OrderTakeProfit()!=0) {
             TicketModify = OrderModify(OrderTicket(), OrderOpenPrice(),NormalizeDouble(OrderOpenPrice()- StopLoss*Point*K,Digits), OrderTakeProfit(), 0, Blue);
           }
           }
      if (OrderType() == OP_SELL) {
         if (OrderMagicNumber() == MagicNumber||OrderMagicNumber() == MagicNumber1 && OrderSymbol() == EASymbol&&OrderStopLoss()==0&&OrderTakeProfit()!=0) {
             TicketModify = OrderModify(OrderTicket(), OrderOpenPrice(),NormalizeDouble(OrderOpenPrice()+ StopLoss*Point*K,Digits), OrderTakeProfit(), 0, Blue);
           }
           }
      if (OrderType() == OP_BUY) {
         if (OrderMagicNumber() == MagicNumber||OrderMagicNumber() == MagicNumber1 && OrderSymbol() == EASymbol&&OrderStopLoss()!=0&&OrderTakeProfit()==0) {
             TicketModify = OrderModify(OrderTicket(), OrderOpenPrice(),OrderStopLoss(), NormalizeDouble(OrderOpenPrice()+TakeProfit*Point*K,Digits), 0, Blue);
           }
           }
      if (OrderType() == OP_SELL) {
         if (OrderMagicNumber() == MagicNumber||OrderMagicNumber() == MagicNumber1 && OrderSymbol() == EASymbol&&OrderStopLoss()!=0&&OrderTakeProfit()==0) {
             TicketModify = OrderModify(OrderTicket(), OrderOpenPrice(),OrderStopLoss(), NormalizeDouble(OrderOpenPrice()-TakeProfit*Point*K,Digits), 0, Blue);
           }
           }
      
 //----------------------------------------------------------------------------------------------------------------------------------------------------
      //--- Модификация ордера на покупку
      if (OrderType() == OP_BUY) {
         if (OrderMagicNumber() == MagicNumber||OrderMagicNumber() == MagicNumber1 && OrderSymbol() == EASymbol)
          {
            if(SecureProfit*K<MarketInfo(Symbol(),MODE_STOPLEVEL)&&OrderStopLoss()<OrderOpenPrice()&&VirtuaiModif==TRUE)
              {
              kbar=iBarShift(NULL,PERIOD_M1,OrderOpenTime(),false)+1;
              double HN =iHigh(NULL,PERIOD_M1,iHighest(NULL,PERIOD_M1,MODE_HIGH,kbar,0));
              if(HN - OrderOpenPrice()-(Ask-Bid)>= K*SecureProfitTriger*Point&&Bid- OrderOpenPrice()<=K*SecureProfit*Point&&Bid>OrderOpenPrice())
              OrderClose(OrderTicket(),OrderLots(),Bid,CloseSP,CLR_NONE);
              } 
            if (Bid - OrderOpenPrice() > SecureProfitTriger * pp && MathAbs(OrderOpenPrice() + SecureProfit * pp - OrderStopLoss()) >= Point
             &&NormalizeDouble(OrderOpenPrice() + SecureProfit * pp, Digits)-Point>=OrderStopLoss())
             {
             if(SecureProfit *K>=MarketInfo(Symbol(),MODE_STOPLEVEL))
              {
              TicketModify = OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(OrderOpenPrice() + SecureProfit * pp, Digits), OrderTakeProfit(), 0, Blue);
              if (!TicketModify){
              ModifyError = GetLastError();
              }
            }
          }
        } 
      }
      //--- Модификация ордера на продажу
      if (OrderType() == OP_SELL) 
        {
         if (OrderMagicNumber() == MagicNumber||OrderMagicNumber() == MagicNumber1 && OrderSymbol() == EASymbol)
          {
           if(SecureProfit*K <MarketInfo(Symbol(),MODE_STOPLEVEL)&&OrderStopLoss()>OrderOpenPrice()&&VirtuaiModif==TRUE) 
              {
              kbar=iBarShift(NULL,PERIOD_M1,OrderOpenTime(),false)+1;
              double HL =iLow(NULL,PERIOD_M1,iLowest(NULL,PERIOD_M1,MODE_LOW,kbar,0));
              if( OrderOpenPrice()- HL-(Ask-Bid) >= K*SecureProfitTriger*Point&& OrderOpenPrice()-Ask <= K*SecureProfit*Point&&Ask<OrderOpenPrice())
              OrderClose(OrderTicket(),OrderLots(),Ask,CloseSP,CLR_NONE);
              }
            if (OrderOpenPrice() - Ask > SecureProfitTriger * pp && MathAbs(OrderOpenPrice() - SecureProfit * pp - OrderStopLoss()) >= Point
            &&NormalizeDouble(OrderOpenPrice() - SecureProfit * pp, Digits)+Point<=OrderStopLoss()) 
            {
            if(SecureProfit * K>=MarketInfo(Symbol(),MODE_STOPLEVEL))
              {
              TicketModify = OrderModify(OrderTicket(), OrderOpenPrice(), NormalizeDouble(OrderOpenPrice() - SecureProfit * pp, Digits), OrderTakeProfit(), 0, Red);
              if (!TicketModify){
              ModifyError = GetLastError();
              }
            }
          }
        }
      }
//................................................................................................
    if(TrailingStop>1&&(OrderMagicNumber()== MagicNumber||OrderMagicNumber()== MagicNumber1))
    {
      if(OrderType() == OP_SELL&&OrderOpenPrice() - Ask > Utral*Point*K)
      {
        if(TrailingStop> 0&&TrailingStop > 1)
        {
          if(OrderOpenPrice() - Ask >  TrailingStop * Point*K)
          {            
            if(OrderStopLoss()-Point* TrailingStep*K > (Ask + Point* TrailingStop*K)&&Ask + Point * TrailingStop*K<=OrderStopLoss()-Point)
            {           
              OrderModify(OrderTicket(), OrderOpenPrice(), Ask + Point * TrailingStop*K,
               OrderTakeProfit(),0, CLR_NONE);
              // return(0);
            }
          }
        }
      }
      else
        if(OrderType() == OP_BUY&&Bid - OrderOpenPrice() > Utral*Point*K)//||OrderMagicNumber()== MAGIC1)
        {
          if(TrailingStop > 0&&TrailingStop > 1)         
          {
            if(Bid - OrderOpenPrice() > TrailingStop * Point*K)
            {
              if(OrderStopLoss()+Point* TrailingStep*K < (Bid - Point * TrailingStop*K)&&Bid - Point * TrailingStop*K>=OrderStopLoss()+Point)
              {
                OrderModify(OrderTicket(), OrderOpenPrice(), Bid - Point * TrailingStop*K,
                  OrderTakeProfit() ,0, CLR_NONE);
                //  return(0);
              }
            }
          }
        }
      }
//-----------------------------------------------------------------------------       
     if(TrailingStop<1&&(OrderMagicNumber()== MagicNumber||OrderMagicNumber()== MagicNumber1))
     {
      if(OrderType() == OP_SELL&&TrailingStop < 1)
      {
        if(TrailingStop> 0)
        {
          if(OrderOpenPrice() - Ask > Utral*Point*K)
          {            
            if(OrderStopLoss()-Point* TrailingStep*K > Ask + (OrderOpenPrice()-Ask)*TrailingStop&& Ask + (OrderOpenPrice()-Ask)*TrailingStop<=OrderStopLoss()-Point)
            {           
              OrderModify(OrderTicket(), OrderOpenPrice(), Ask + (OrderOpenPrice()-Ask)*TrailingStop,
               OrderTakeProfit(),0, CLR_NONE);
              // return(0);
            }
          }
        }
      }
      else
        if(OrderType() == OP_BUY)
        {
          if(TrailingStop > 0&&TrailingStop < 1)         
          {
            if(Bid - OrderOpenPrice() > Utral*Point*K)
            {
              if(OrderStopLoss()+Point* TrailingStep*K  < Bid - (Bid - OrderOpenPrice())*TrailingStop&&Bid - (Bid - OrderOpenPrice())*TrailingStop>=OrderStopLoss()+Point)
              {
                OrderModify(OrderTicket(), OrderOpenPrice(), Bid - (Bid - OrderOpenPrice())*TrailingStop ,
                  OrderTakeProfit() ,0, CLR_NONE);
                  
              }
            }
          }
        }
      }
//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    }
  } //--- Закрытие for (int i = total - 1; i >= 0; i--)
  return ;
}

//+--------------------------------------------------------------------------------------------------------------+
//| CloseTrades. Виртуальный тейк-профит и стоп-лосс.
//| Если включена функция UseStopLevels, то используется как функция резервного закрытия.
//+--------------------------------------------------------------------------------------------------------------+
void CloseOrders() {
//+--------------------------------------------------------------------------------------------------------------+
   int c =0,c1=0;
   bool TicketClose; //--- Закрытие ордера
   int total = OrdersTotal() - 1;
   int OpenLongOrdersCount = 0;
   int OpenShortOrdersCount = 0;
   int MaxCount = 3;
   int CloseError ;
   int CloseTicketID ;
   string CloseOrderType ;
   int MinCount;
   //---
   for (int i = total; i >= 0; i--) { //--- Счетчик открытых ордеров
      if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
      CloseTicketID = OrderTicket();
      CloseOrderType = OrderType();
      //--- Закрытие по профиту или лоссу ордеров на покупку
      if (OrderMagicNumber() == MagicNumber||OrderMagicNumber() == MagicNumber1)
      {
      if (OrderType() == OP_BUY&&OrderSymbol() == EASymbol) {
      OpenLongOrdersCount++;
               if ( CloseOnlyProfit==FALSE)
               {
               if (Bid >= OrderOpenPrice() + TakeProfit * pp || Bid <= OrderOpenPrice() - StopLoss * pp || CloseLongSignal(OrderOpenPrice(), ExistPosition())) 
               {
               for ( MinCount = 1; MinCount <= MathMax(1, MaxCount); MinCount++) 
               {
               RefreshRates();
               if (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, Digits), CloseSP, CloseBuyColor)) 
               {
               OpenLongOrdersCount--; //--- Обнуляем счетчик
               break;       
               } 
               else 
               {
               CloseError = GetLastError();
               }
               }
            }
         }
         if ( CloseOnlyProfit==TRUE)
               {
               if (Bid>=OrderOpenPrice()+K*Point&&(Bid >= OrderOpenPrice() + TakeProfit * pp || Bid <= OrderOpenPrice() - StopLoss * pp || CloseLongSignal(OrderOpenPrice(), ExistPosition()))) 
               {
               for ( MinCount = 1; MinCount <= MathMax(1, MaxCount); MinCount++) 
               {
               RefreshRates();
               if (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Bid, Digits), CloseSP, CloseBuyColor)) 
               {
               OpenLongOrdersCount--; //--- Обнуляем счетчик
               break;       
               } 
               else 
               {
               CloseError = GetLastError();
               }
               }
            }
         }
      } //--- Закрытие if (OrderType() == OP_BUY)
      
      //--- Закрытие по профиту или лоссу ордеров на продажу
      if (OrderType() == OP_SELL&&OrderSymbol() == EASymbol) {
      OpenShortOrdersCount++;
            if (CloseOnlyProfit==FALSE ) 
               {
            if (Ask <= OrderOpenPrice() - TakeProfit * pp || Ask >= OrderOpenPrice() + StopLoss * pp || CloseShortSignal(OrderOpenPrice(), ExistPosition())) 
               {
               for (MinCount = 1; MinCount <= MathMax(1, MaxCount); MinCount++)
               {
               RefreshRates();
               if (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, Digits), CloseSP, CloseSellColor)) 
               {
               OpenShortOrdersCount--; //--- Обнуляем счетчик
               break;
               } 
               else {
               CloseError = GetLastError();
               }
              }
            }
          }
          if (CloseOnlyProfit==TRUE ) 
               {
            if (Ask<=OrderOpenPrice()-K*Point&&(Ask <= OrderOpenPrice() - TakeProfit * pp || Ask >= OrderOpenPrice() + StopLoss * pp || CloseShortSignal(OrderOpenPrice(), ExistPosition()))) 
               {
               for (MinCount = 1; MinCount <= MathMax(1, MaxCount); MinCount++)
               {
               RefreshRates();
               if (OrderClose(OrderTicket(), OrderLots(), NormalizeDouble(Ask, Digits), CloseSP, CloseSellColor)) 
               {
               OpenShortOrdersCount--; //--- Обнуляем счетчик
               break;
               } 
               else {
               CloseError = GetLastError();
               }
              }
            }
          }
        } //--- Закрытие if (OrderType() == OP_SELL)
      } 
   } //--- Закрытие for (int i = total - 1; i >= 0; i--) {
}
return ;
}

//+--------------------------------------------------------------------------------------------------------------+
//| OpenLongSignal. Сигнал на открытие длинной позиции.
//+--------------------------------------------------------------------------------------------------------------+
bool OpenLongSignal() {
//+--------------------------------------------------------------------------------------------------------------+
int zp = 0;
bool result = false;
bool result1 = false;
bool result2 = false;
bool result3 = false;
bool result4 = false;
double fu = 0;
double fd = 0;
//--- Расчет основных сигналов на вход B
   
double iClose_Signal = iClose(NULL,15, 1);
double iMA_Signal = iMA(NULL, PERIOD_M15, iMA_PeriodLONG, 0, MODE_SMMA, PRICE_HIGH, 1);
double iWPR_Signal = iStochastic(NULL, PERIOD_M15,iWPR_PeriodLONG,1,1, MODE_SMA, 0, MODE_MAIN,1);//iWPR(NULL, PERIOD_M15, iWPR_Period, 1);
double iATR_Signal = iATR(NULL, PERIOD_M15, iATR_PeriodLONG, 1);
double iCCI_Signal = iCCI(NULL,PERIOD_M15 , iCCI_PeriodLONG, PRICE_TYPICAL, 1);
//---
double iMA_Filter_a = NormalizeDouble(iMA_LONG_Open_a*pp,pd);
double iMA_Filter_b = NormalizeDouble(iMA_LONG_Open_b*pp,pd);
//double BidPrice = Bid; //--- (iClose_Signal >= BidPrice) Сравнение идёт именно с Bid (а не с Ask, как должно быть), так как цена закрытия свечи iClose_Signal формируется на основании значения Bid
//---

double F =iMFI(NULL,15,3,1);
double F1 =iMFI(NULL,15,3,2);
double M1 =iMFI(NULL,15,2,0);
double M3 =iMFI(NULL,15,3,1);
double M4 =iMFI(NULL,15,1,1);

double A =iATR(NULL,15,iATR_PeriodLONG2,1);
double A1 =iATR(NULL,15,iATR_PeriodLONG2,2);
double A2 =iATR(NULL,15,iATR_PeriodLONG2,3);
//--- Сверяем сигнал по АТР с его фильтром
if (iATR_Signal <= FilterATR * pp||(M1>UMFI_LONG&&UMFI_LONG!=0))
 return (0);
if (iClose_Signal - iMA_Signal > iMA_Filter_a  && iWPR_Filter_OpenLong_a > iWPR_Signal) result1 = true;//&& iClose_Signal - BidPrice >= - cf
else result1 = false;
if (iClose_Signal - iMA_Signal > iMA_Filter_b  && - iCCI_OpenFilter > iCCI_Signal) result2 = true;//&& iClose_Signal - BidPrice >= - cf
else result2 = false;
if (iClose_Signal - iMA_Signal > iMA_Filter_b  && iWPR_Filter_OpenLong_b > iWPR_Signal) result3 = true;//&& iClose_Signal - BidPrice >= - cf
else result3 = false;

if (( (A>A1&&A1<A2)||(A<A1&&A1>A2)&&F>F1&&(iWPR_Filter_OpenLong_a3 > iWPR_Signal&&F1<=UMFI_LONG1&& UDB1==true)||(iCCI_Signal < -iCCI_OpenFilter1) )||//(iWPR_Filter_OpenLong_a3 > iWPR_Signal)||//iClose_Signal - BidPrice >= - cf &&
 ( F>F1&&F1==0 && (iWPR_Filter_OpenLong_a2 > iWPR_Signal)||(iCCI_Signal < -iCCI_OpenFilter2)&&UDB2==true)||//&&iClose_Signal - BidPrice >= - cf
 ( FilterWL>0&&M4>M3&& FilterWL > iWPR_Signal||( - FilterCL > iCCI_Signal&&UDB3==true))) 
 result4 = true;
else result4 = false;
if (result1 == true || result2 == true || result3 == true || result4 == true) 
result = true;

else result = false;
//---
return (result);

}

//+--------------------------------------------------------------------------------------------------------------+
//| OpenShortSignal. Сигнал на открытие короткой позиции.
//+--------------------------------------------------------------------------------------------------------------+
bool OpenShortSignal() {
//+--------------------------------------------------------------------------------------------------------------+
int zp = 0;
bool result = false;
bool result1 = false;
bool result2 = false;
bool result3 = false;
bool result4 = false;
double fu = 0;
double fd = 0;
//--- Расчет основных сигналов на вход S

double iClose_Signal = iClose(NULL,15 , 1);
double iMA_Signal = iMA(NULL, PERIOD_M15, iMA_PeriodShort, 0, MODE_SMMA, PRICE_LOW, 1);
double iWPR_Signal = iStochastic(NULL, PERIOD_M15,iWPR_PeriodShort,1,1, MODE_SMA, 0, MODE_MAIN,1);//iWPR(NULL, PERIOD_M15, iWPR_Period, 1);
double iATR_Signal = iATR(NULL, PERIOD_M15, iATR_PeriodShort, 1);
double iCCI_Signal = iCCI(NULL, PERIOD_M15, iCCI_PeriodShort, PRICE_TYPICAL, 1);
//---
double iMA_Filter_a = NormalizeDouble(iMA_Short_Open_a*pp,pd);
double iMA_Filter_b = NormalizeDouble(iMA_Short_Open_b*pp,pd);
//double BidPrice = Bid;

//---
double M1 =iMFI(NULL,15,2,0);
double M3 =iMFI(NULL,15,3,1);
double M4 =iMFI(NULL,15,1,1);
double F =iMFI(NULL,15,3,1);
double F1 =iMFI(NULL,15,3,2);

double A =iATR(NULL,15,iATR_PeriodShort2,1);
double A1 =iATR(NULL,15,iATR_PeriodShort2,2);
double A2 =iATR(NULL,15,iATR_PeriodShort2,3);
//--- Сверяем сигнал по АТР с его фильтром
if (iATR_Signal <= FilterATR * pp||(M1<UMFI_Short&&UMFI_Short!=0))//||w<-20||w1<-20)//||M==0)//||M2==0)
 return (0);
if (iMA_Signal - iClose_Signal > iMA_Filter_a && iWPR_Signal > iWPR_Filter_OpenShort_a) result1 = true;//&& iClose_Signal - BidPrice <= cf 
else result1 = false;
if (iMA_Signal - iClose_Signal > iMA_Filter_b && iCCI_Signal > iCCI_OpenFilter) result2 = true;//&& iClose_Signal - BidPrice <= cf 
else result2 = false;
if (iMA_Signal - iClose_Signal > iMA_Filter_b  && iWPR_Signal > iWPR_Filter_OpenShort_b) result3 = true;//&& iClose_Signal - BidPrice <= cf
else result3 = false;

if (((A>A1&&A1<A2)||(A<A1&&A1>A2)&&F<F1 && (iWPR_Signal > iWPR_Filter_OpenShort_a3&&F1>=UMFI_Short1 && UDS1==true)||(iCCI_Signal > iCCI_OpenFilter1))||//(iWPR_Signal > iWPR_Filter_OpenShort_a3 )||//&& iClose_Signal - BidPrice <= cf
(F<F1&&F1==100&& (iWPR_Signal > iWPR_Filter_OpenShort_a2)||(iCCI_Signal > iCCI_OpenFilter2)&&UDS2==true)||//&& iClose_Signal - BidPrice <= cf 
( FilterWS>0&&M4<M3&&iWPR_Signal > FilterWS||(iCCI_Signal > FilterCS&&UDS3==true))) result4 = true;
else result4 = false;
if (result1 == true || result2 == true || result3 == true || result4 == true) result = true;
else result = false;
//---
return (result);

}

//+--------------------------------------------------------------------------------------------------------------+
//| CloseLongSignal. Сигнал на закрытие длинной позиции.
//+--------------------------------------------------------------------------------------------------------------+
bool CloseLongSignal(double OrderPrice, int CheckOrders) {
//+--------------------------------------------------------------------------------------------------------------+

bool result = false;
bool result1 = false;
bool result2 = false;
//---
double iWPR_Signal = iStochastic(NULL, TF_Close,PWPR_Close,1,1, MODE_SMA, 0, MODE_SIGNAL,1);//iWPR(NULL, PERIOD_M15, iWPR_Period, 1);
double iClose_Signal = iClose(NULL, TF_Close, 1);
double iOpen_CloseSignal = iOpen(NULL, PERIOD_M1, 1);
double iClose_CloseSignal = iClose(NULL, PERIOD_M1, 1);
//---
double MaxLoss = NormalizeDouble(-MaxLossPoints * pp,pd);
//---
double Price_Filter = NormalizeDouble(Price_Filter_Close*pp,pd);
double BidPrice = Bid;
//---

//---
if (OrderPrice - BidPrice <= MaxLoss && iClose_Signal - BidPrice <= cf && iWPR_Signal > iWPR_Filter_CloseLong && CheckOrders == 1) result1 = true;//
else result1 = false;
//---
if (iOpen_CloseSignal > iClose_CloseSignal && BidPrice - OrderPrice >= Price_Filter && CheckOrders == 1) result2 = true;
else result2 = false;
//---
if (result1 == true || result2 == true) result = true;
else result = false;
//---
return (result);

}

//+--------------------------------------------------------------------------------------------------------------+
//| CloseShortSignal. Сигнал на закрытие короткой позиции.
//+--------------------------------------------------------------------------------------------------------------+
bool CloseShortSignal(double OrderPrice, int CheckOrders) {
//+--------------------------------------------------------------------------------------------------------------+

bool result = false;
bool result1 = false;
bool result2 = false;
//---
double iWPR_Signal = iStochastic(NULL, TF_Close,PWPR_Close,1,1, MODE_SMA, 0, MODE_SIGNAL,1);//iWPR(NULL, PERIOD_M15, iWPR_Period, 1);
double iClose_Signal = iClose(NULL,TF_Close , 1);
double iOpen_CloseSignal = iOpen(NULL, PERIOD_M1, 1);
double iClose_CloseSignal = iClose(NULL, PERIOD_M1, 1);
//---
double MaxLoss = NormalizeDouble(-MaxLossPoints*pp,pd);
//---
double Price_Filter = NormalizeDouble(Price_Filter_Close*pp,pd);
double BidPrice = Bid;
double AskPrice = Ask;
//---

//---
if (AskPrice - OrderPrice <= MaxLoss && iClose_Signal - BidPrice >= - cf && iWPR_Signal < iWPR_Filter_CloseShort && CheckOrders == 1) result1 = true;
else result1 = false;
//---
if (iOpen_CloseSignal < iClose_CloseSignal && OrderPrice - AskPrice >= Price_Filter && CheckOrders == 1) result2 = true;
else result2 = false;
//---
if (result1 == true || result2 == true) result = true;
else result = false;
//---
return (result);

}

//+--------------------------------------------------------------------------------------------------------------+
//| CalcLots. Функция расчета обьема лота.
//| При AutoMM > 0.0 && RecoveryMode функция CalcLots расчитывает объём лота относительно свободных средств.
//| 
//| Также расчет лота производиться исходя из числа открытых в прошлом ордеров. То есть увеличение лота теперь
//| зависит не только от свободных средств, но и от числа открытых в прошлом советником ордеров.
//| 
//| Помимо простого ММ, функция рассчитывает лот исходя из произошедших ранее стоп-лоссов при включенном
//| параметре RecoveryMode, то есть, при желании можно включить режим восстановления депозита.
//+--------------------------------------------------------------------------------------------------------------+
double CalcLots() {
//+--------------------------------------------------------------------------------------------------------------+

   double SumProfit; //--- Суммарный профит
   int OldOrdersCount; //--- Текущее кол-во закрытых советником ордеров
   double loss; //--- Просадка
   int LossOrdersCount; //--- Число лосей в прошлом
   double pr; //--- Профит
   int ProfitOrdersCount; //--- Кол-во прибыльных ордеров ы прошлом
   double LastPr; //--- Предыдущее значение профит
   int LastCount; //--- Предыдущее значение счетчика ордеров
   double MultiLot = 1; //---  Обнуление значения умножения лота
   //---
   
   //--- Если ММ включен, то
   if (MultiLotPercent > 0.0 && AutoMM > 0.0) {
      
      //--- Обнуляем значения
      SumProfit = 0;
      OldOrdersCount = 0;
      loss = 0;
      LossOrdersCount = 0;
      pr = 0;
      ProfitOrdersCount = 0;
      //---
      
      //--- Выбираем закрытие ранее ордера
      for (int i = OrdersHistoryTotal() - 1; i >= 0; i--) {
         if (OrderSelect(i, SELECT_BY_POS, MODE_HISTORY)) {
            if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
               OldOrdersCount++; //--- Считаем ордера
               SumProfit += OrderProfit(); //--- и суммарный профит
               
               //--- Если суммарный профит больше pr (для начала больше 0)
               if (SumProfit > pr) {
                  //--- Инициализируем профит и счетчик прибыльных ордеров
                  pr = SumProfit;
                  ProfitOrdersCount = OldOrdersCount;
               }
               //--- Если суммарный профит меньше loss (для начала больше 0)
               if (SumProfit < loss) {
                  //--- Инициализируем просадку и счетчик убыточных ордеров
                  loss = SumProfit;
                  LossOrdersCount = OldOrdersCount;
               }
               //--- Если текущее кол-во подсчитанных ордеров больше или равно MaxAnalizCount (50), то в будущем считаем только свеженькие ордера а старые вычитаем.
               if (OldOrdersCount >= MaxAnalizCount) break;
            }
         }
      } //--- Закрытие for (int i = OrdersHistoryTotal() - 1; i >= 0; i--) {
      
      
      //--- Если число прибыльных ордеров меньше или равно числу лосей, то расчитываем значение умножения лота MultiLot
      if (ProfitOrdersCount <= LossOrdersCount) MultiLot = MathPow(MultiLotPercent, LossOrdersCount);
      
      //--- Если нет, то
      else {
         
         //--- Инициализируем параметры по профиту
         SumProfit = pr;
         OldOrdersCount = ProfitOrdersCount;
         LastPr = pr;
         LastCount = ProfitOrdersCount;
         
         //--- Выбираем закрытие ранее ордера (минус число прибыльных ордеров)
         for (i = OrdersHistoryTotal() - ProfitOrdersCount - 1; i >= 0; i--) {
            if (OrderSelect(i, SELECT_BY_POS, MODE_HISTORY)) {
               if (OrderSymbol() == Symbol() && OrderMagicNumber() == MagicNumber) {
                  //--- Если выбрано более 50 ордеров прекразщаем выбирать
                  if (OldOrdersCount >= MaxAnalizCount) break;
                  //---
                  OldOrdersCount++; //--- Считаем кол-во ордеров
                  SumProfit += OrderProfit(); //--- и профит
                  
                  //--- Если новый профит меньше предыдущего (LastPr), то
                  if (SumProfit < LastPr) {
                     //--- Переинициализируем значения профита и кол-во ордеров
                     LastPr = SumProfit;
                     LastCount = OldOrdersCount;
                  }
               }
            }
         } //--- Закрытие for (i = OrdersHistoryTotal() - ProfitOrdersCount - 1; i >= 0; i--) {
         
         //--- Если значение счетчика LastCount равно счетчику прибыльных ордеров или прошлый профит равен текщему, то
         if (LastCount == ProfitOrdersCount || LastPr == pr) MultiLot = MathPow(MultiLotPercent, LossOrdersCount); //--- расчитываем значение умножения лота MultiLot
         
         //--- Если нет, то
         else {
            //--- Делим положительный (loss - pr) на положительный (LastPr - pr) и сравниваем с риском, после расчитываем умножение лота MultiLot
            if (MathAbs(loss - pr) / MathAbs(LastPr - pr) >= (Risk + 100.0) / 100.0) MultiLot = MathPow(MultiLotPercent, LossOrdersCount);
            else MultiLot = MathPow(MultiLotPercent, LastCount);
         }
      }
   } //--- Закрытие if (MultiLotPercent > 0.0 && AutoMM > 0.0) {
   
   //--- Получаем финальный объём лота, исходя из выполненных выше действий
   for (double OpLot = MathMax(MinLot, MathMin(MaxLot, MathCeil(MathMin(AutoMM_Max, MultiLot * AutoMM) / 100.0 * AccountFreeMargin() / LotStep / (LotValue / 100)) * LotStep)); OpLot >= 2.0 * MinLot &&
      1.05 * (OpLot * FreeMargin) >= AccountFreeMargin(); OpLot -= MinLot) {
   }
   return (OpLot);
}

//+--------------------------------------------------------------------------------------------------------------+
//| MaxSpreadFilter. Функция для расчета размера спреда и сравнения его со значением MaxSpread.
//| Если текущий спред превышен, то возвращаем TRUE.
//+--------------------------------------------------------------------------------------------------------------+
bool MaxSpreadFilter() {
//+--------------------------------------------------------------------------------------------------------------+

   RefreshRates();
   if (NormalizeDouble(Ask - Bid, Digits) > NDMaxSpread) return (TRUE);
   //---
   else return (FALSE);
}

//+--------------------------------------------------------------------------------------------------------------+
//| ExistPosition. Функция проверки открытых ордеров.
//| Если открыт ордер возвращает True, если нет, дает разрешение (False, 0) на открытие.
//+--------------------------------------------------------------------------------------------------------------+
int ExistPosition() {
//+--------------------------------------------------------------------------------------------------------------+

   int trade = OrdersTotal() - 1;
   for (int i = trade; i >= 0; i--) {
      if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
         if ((OrderType() == OP_BUY||OrderType() == OP_SELL)&&(OrderMagicNumber() == MagicNumber||OrderMagicNumber() == MagicNumber1)) {
            if (OrderSymbol() == EASymbol)
               if (OrderType() <= OP_SELL) return (1);
         }
      }
   }
   //---
   return (0);
}

//+--------------------------------------------------------------------------------------------------------------+
//| OpenTradeCount. Счетчик открытых ордеров. Если число открытых ордеров больше или равно MaximumTrades, то
//| идет запрет на торговлю.
//+--------------------------------------------------------------------------------------------------------------+
bool OpenTradeCount() {
//+--------------------------------------------------------------------------------------------------------------+

   int count = 0;
   int trade = OrdersTotal() - 1;
   for (int i = trade; i >= 0; i--) {
      if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES))
         if (OrderComment()!= "R"&&((OrderType() == OP_BUY||OrderType() == OP_SELL)&&(OrderMagicNumber() == MagicNumber||OrderMagicNumber() == MagicNumber1)&& OrderSymbol() == EASymbol)) count++;
   }
   //---
   if (count >= MaximumTrades) return (False);
   else return (True);
}
/////////////////////////////////////////////////////////
//+--------------------------------------------------------------------------------------------------------------+
//| Dmarket функция открытия дополнительных рыночных ордеров
//+--------------------------------------------------------------------------------------------------------------+

void Dmarket(int PA) {
int bm=0,sm=0,bmd=0,smd=0,bms=0,sms=0,LBD=0,LSD=0,NB=0,NS=0,Z=0,MB=0,MS=0,zb=0,zs=0,ZP=0,ZZ=0,CountDop=0;
double PRB,PRS,drb,drs,L,LOT,LOTD,LS,LL,LD,LOTS,lots,DOP;

 //if (OrdersTotal()==0)ObjectDelete("D");
for (int i = OrdersTotal() - 1; i >= 0; i--)
     {
    if (!(OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) || OrderSymbol() != Symbol()) 
         continue;
    if (OrderMagicNumber()==MagicNumber||OrderMagicNumber()==MagicNumber1&&
        BalansMargin*AccountMargin()>AccountFreeMargin()&&BalansMargin>0){Z=1;ZP=1;}
    if (OrderMagicNumber()==MagicNumber||OrderMagicNumber()==MagicNumber1&&
        BalansEquity*AccountEquity()<AccountBalance()&&BalansEquity>0){Z=1;ZP=1;}    
    if(OrderMagicNumber()==MagicNumber1)//darfs
    CountDop++;
    if(CountDop >= MaxDop&&MaxDop>0) {Z=1;ZP=1;} //darfs
    if (OrderType()==OP_BUY||OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber1||OrderMagicNumber()==MagicNumber
        &&OrderOpenTime()>=iTime(Symbol(),AccountBar,0))Z=1;
         if(CountDop==0)DOP=OrderDOP;
         if(CountDop==1)DOP=K_OrderDOP*OrderDOP;
         if(CountDop==2)DOP=K_OrderDOP*K_OrderDOP*OrderDOP;
         if(CountDop==3)DOP=K_OrderDOP*K_OrderDOP*K_OrderDOP*OrderDOP;
         if(CountDop==4)DOP=K_OrderDOP*K_OrderDOP*K_OrderDOP*K_OrderDOP*OrderDOP;
         if(CountDop>=5)DOP=K_OrderDOP*K_OrderDOP*K_OrderDOP*K_OrderDOP*K_OrderDOP*OrderDOP;
   
    if(DOP<MinOrderDOP)DOP=MinOrderDOP; 

    if (OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber1||OrderMagicNumber()==MagicNumber&&Ask>OrderOpenPrice()-DOP*Point*K)zb=1;
    if (OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber1||OrderMagicNumber()==MagicNumber&&Bid<OrderOpenPrice()+DOP*Point*K)zs=1;
    if (OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber1){MB=1;PRB=OrderOpenPrice();}
    if (OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber1){MS=1;PRS=OrderOpenPrice();} 
    if (OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber){lots=OrderLots();NB=1;drb=OrderOpenPrice();}
    if (OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber){lots=OrderLots();NS=1;drs=OrderOpenPrice();}    
    if (OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber&&OrderStopLoss()>OrderOpenPrice())LBD=1;
    if (OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber&&OrderStopLoss()<OrderOpenPrice())LSD=1;    
    if (OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber||OrderMagicNumber()==MagicNumber1&&Ask<OrderOpenPrice()-DOP*Point*K){bmd=1;LOTD=OrderLots();}
    if (OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber||OrderMagicNumber()==MagicNumber1&&Bid>OrderOpenPrice()+DOP*Point*K){smd=1;LOTD=OrderLots();} 
    if (OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber&&Ask<OrderOpenPrice()-DOPS*Point*K){bms=1;LOTS=OrderLots();}
    if (OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber&&Bid>OrderOpenPrice()+DOPS*Point*K){sms=1;LOTS=OrderLots();} 
    
    if (AccountOrder == FALSE){
    if (OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber1)NB=1;
    if (OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber1)NS=1;    
    if (OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber1&&OrderStopLoss()>OrderOpenPrice())LBD=1;
    if (OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber1&&OrderStopLoss()<OrderOpenPrice())LSD=1;    
   
   
    if (OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber1||OrderMagicNumber()==MagicNumber&&Ask<OrderOpenPrice()-DOP*Point*K){bmd=1;LOTD=OrderLots();}
    if (OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber1||OrderMagicNumber()==MagicNumber&&Bid>OrderOpenPrice()+DOP*Point*K){smd=1;LOTD=OrderLots();} 
    if (OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber1&&Ask<OrderOpenPrice()-DOPS*Point*K){bms=1;LOTS=OrderLots();}
    if (OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber1&&Bid>OrderOpenPrice()+DOPS*Point*K){sms=1;LOTS=OrderLots();} 
    }
    if (ModifDOP >0&&MB==1&&OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber&&OrderTakeProfit()>OrderOpenPrice()+1*Point+Commis*Point*K&&PRB<OrderOpenPrice()&&Bid<=OrderOpenPrice()-K*ModifDOP*Point)
        OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),OrderOpenPrice()+Commis*Point*K,0,CLR_NONE);
    if (ModifDOP >0&&MS==1&&OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber&&OrderTakeProfit()<OrderOpenPrice()-1*Point-Commis*Point*K&&PRS>OrderOpenPrice()&&Ask>=OrderOpenPrice()+K*ModifDOP*Point)
        OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),OrderOpenPrice()-Commis*Point*K,0,CLR_NONE);
    }
    if (StartLot>0){LOT=LotSize;LOTD=LotSize;LOTS=LotSize;}
    for (int y = OrdersTotal() - 1; y >= 0; y--)
     {
    if (OrderSelect(y, SELECT_BY_POS, MODE_TRADES) && OrderSymbol() == Symbol()&&(OrderMagicNumber()==MagicNumber1||OrderMagicNumber()==MagicNumber)) 
         {
         if (RiskMargin>0&&RiskMargin*AccountFreeMargin()<AccountMargin())ZP=1;
         }
      }
 //...........................DOP................................................

        double lt;
        double ML;
        double MKL;
        int m;
        double MG=AccountFreeMargin()*RiskFreeMargin;
        double Min = MarketInfo(Symbol(), MODE_LOTSTEP);
        m=MG/MarketInfo (Symbol(), MODE_MARGINREQUIRED)/Min;
        ML = m*Min; 
        if(ML>MaxLot)ML= MaxLot; 
        if(ML< MarketInfo(Symbol(), MODE_MINLOT))Z=1; 
        if(Z==0&&ZP==0)
        {
        if(PA==0&&bmd==1&&zb==0&&OpenLongSignal()==true
        )          
        {
         if(TipMM==1)lt=LotSize;
         if(TipMM==0)lt=lots;
         if(TipMM==2)lt=LOTD;
         if(CountDop==0)MKL=KDOP;
         if(CountDop==1)MKL=KDOP*KDOP;
         if(CountDop==2)MKL=KDOP*KDOP*KDOP;
         if(CountDop==3)MKL=KDOP*KDOP*KDOP*KDOP;
         if(CountDop==4)MKL=KDOP*KDOP*KDOP*KDOP*KDOP;
         if(CountDop>=5)MKL=KDOP*KDOP*KDOP*KDOP*KDOP*KDOP;
         if(MKL>KDOP_MAX)MKL=KDOP_MAX;
         LD=NormalizeDouble(MKL*lt,2);       
         if(LD>MaxLot)LD=MaxLot;
         if(LD>ML)LD=ML;
         OrderSend(Symbol(),0,LD,Ask,2,0,0,NULL,MagicNumber1,0,Blue);       
        }     
        if(PA==0&&smd==1&&zs==0&&OpenShortSignal()==true
        )           
        { 
         if(TipMM==1)lt=LotSize;
         if(TipMM==0)lt=lots;
         if(TipMM==2)lt=LOTD;
         if(CountDop==0)MKL=KDOP;
         if(CountDop==1)MKL=KDOP*KDOP;
         if(CountDop==2)MKL=KDOP*KDOP*KDOP;
         if(CountDop==3)MKL=KDOP*KDOP*KDOP*KDOP;
         if(CountDop==4)MKL=KDOP*KDOP*KDOP*KDOP*KDOP;
         if(CountDop>=5)MKL=KDOP*KDOP*KDOP*KDOP*KDOP*KDOP;
         if(MKL>KDOP_MAX)MKL=KDOP_MAX;
         LD=NormalizeDouble(MKL*lt,2);        
        if(LD>MaxLot)LD=MaxLot;
        if(LD>ML)LD=ML;
        OrderSend(Symbol(),1,LD,Bid,2,0,0,NULL,MagicNumber1,0,Magenta);
        }  
        }
   return;
}
//+--------------------------------------------------------------------------------------------------------------+
//| Dlimit функция открытия дополнительных лимитных ордеров
//+--------------------------------------------------------------------------------------------------------------+

void Dlimit(int PA) {
int bm=0,sm=0,bmd=0,smd=0,bms=0,sms=0,LBD=0,LSD=0,NB=0,NS=0,Z=0,MB=0,MS=0,zb=0,zs=0,BL=0,SL=0,ZP=0,CountDop=0;
double PRB,PRS,drb,drs,L,LOT,LOTD,LS,LL,LD,LOTS;

for (int i = OrdersTotal() - 1; i >= 0; i--)
     {
    if (!(OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) || OrderSymbol() != Symbol()) 
         continue;
    if (OrderMagicNumber()==MagicNumber||OrderMagicNumber()==MagicNumber1&&
        BalansMargin*AccountMargin()>AccountFreeMargin()&&BalansMargin>0)Z=1;
    if (OrderMagicNumber()==MagicNumber||OrderMagicNumber()==MagicNumber1&&
        BalansEquity*AccountEquity()<AccountBalance()&&BalansEquity>0)Z=1;
    if(OrderMagicNumber()==MagicNumber1)//darfs
    CountDop++;
    if(CountDop >= MaxDop&&MaxDop>0) ZP=1; //darfs
    if (DeleteLimitU == TRUE&&OrderType()==OP_BUYLIMIT&&OrderMagicNumber()==MagicNumber1&&OpenLongSignal()!=true)OrderDelete(OrderTicket());
    if (DeleteLimitU == TRUE&&OrderType()==OP_SELLLIMIT&&OrderMagicNumber()==MagicNumber1&&OpenShortSignal()!=true)OrderDelete(OrderTicket());
    if (OrderType()==OP_BUYLIMIT&&OrderMagicNumber()==MagicNumber1)BL=1;
    if (OrderType()==OP_SELLLIMIT&&OrderMagicNumber()==MagicNumber1)SL=1; 
    if (OrderType()==OP_BUY||OrderType()==OP_SELL&&OrderOpenTime()>=iTime(Symbol(),AccountBar,0))Z=1;
    if (OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber1||OrderMagicNumber()==MagicNumber&&Ask>OrderOpenPrice()-OrderDOP*Point*K)zb=1;
    if (OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber1||OrderMagicNumber()==MagicNumber&&Bid<OrderOpenPrice()+OrderDOP*Point*K)zs=1;
    if (OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber1){MB=1;PRB=OrderOpenPrice();}
    if (OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber1){MS=1;PRS=OrderOpenPrice();} 
    if (OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber){NB=1;drb=OrderOpenPrice();}
    if (OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber){NS=1;drs=OrderOpenPrice();}    
    if (OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber&&OrderStopLoss()>OrderOpenPrice())LBD=1;
    if (OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber&&OrderStopLoss()<OrderOpenPrice())LSD=1;    
    if (DeleteLimit == TRUE&&OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber&&OrderStopLoss()<OrderOpenPrice()){bm=1;LOT=OrderLots();}
    if (DeleteLimit == TRUE&&OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber&&OrderStopLoss()>OrderOpenPrice()){sm=1;LOT=OrderLots();}
    if (DeleteLimit == FALSE&&OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber){bm=1;LOT=OrderLots();}
    if (DeleteLimit == FALSE&&OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber){sm=1;LOT=OrderLots();}
       
    if (AccountOrder == FALSE){
    if (OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber1)NB=1;
    if (OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber1)NS=1;    
    if (OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber1&&OrderStopLoss()>OrderOpenPrice())LBD=1;
    if (OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber1&&OrderStopLoss()<OrderOpenPrice())LSD=1;    
   
    if (DeleteLimit == TRUE&&OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber1&&OrderStopLoss()<OrderOpenPrice()){bm=1;LOT=OrderLots();}
    if (DeleteLimit == TRUE&&OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber1&&OrderStopLoss()>OrderOpenPrice()){sm=1;LOT=OrderLots();}
    if (DeleteLimit == FALSE&&OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber1){bm=1;LOT=OrderLots();}
    if (DeleteLimit == FALSE&&OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber1){sm=1;LOT=OrderLots();}
    }
    if(DeleteLimit == TRUE&&OrderType()==OP_BUYLIMIT&&LBD==1||NB==0)OrderDelete(OrderTicket());
    if(DeleteLimit == TRUE&&OrderType()==OP_SELLLIMIT&&LSD==1||NS==0)OrderDelete(OrderTicket());
    if(OrderType()==OP_BUYLIMIT&&TimeCurrent()-OrderOpenTime()>TimeL*60)OrderDelete(OrderTicket());
    if(OrderType()==OP_SELLLIMIT&&TimeCurrent()-OrderOpenTime()>TimeL*60)OrderDelete(OrderTicket());     
   
    }
     for (int y = OrdersTotal() - 1; y >= 0; y--)
     {
    if (OrderSelect(y, SELECT_BY_POS, MODE_TRADES) && OrderSymbol() == Symbol()&&(OrderMagicNumber()==MagicNumber1||OrderMagicNumber()==MagicNumber)) 
         {
         if (RiskMargin>0&&RiskMargin*AccountFreeMargin()<AccountMargin())ZP=1;
         }
      }    
        double ML;
        int m;
        double MG=AccountFreeMargin()*RiskFreeMargin;
        double Min = MarketInfo(Symbol(), MODE_LOTSTEP);
        m=MG/MarketInfo (Symbol(), MODE_MARGINREQUIRED)/Min;
        ML = m*Min; 
        if(ML>MaxLot)ML= MaxLot; 
          
 //...........................LIMIT................................................
        
        if(PA==0&&bm==1&&BL==0&&OpenLongSignal()==true&&ZP==0
        )          
        {
         LL=NormalizeDouble(KLimit*LOT,2); 
         if(LL>MaxLot)LL=MaxLot;
         if(LL>ML)LL=ML;
         OrderSend(Symbol(),2,LL,Bid - LimitOrder*Point*K ,2,0,0,NULL,MagicNumber1,TimeCurrent()+TimeL*60,Lime);       
        }     
        if(PA==0&&sm==1&&SL==0&&OpenShortSignal()==true&&ZP==0
        )           
        { 
        LL=NormalizeDouble(KLimit*LOT,2);
        if(LL>MaxLot)LL=MaxLot;
        if(LL>ML)LL=ML;        
        OrderSend(Symbol(),3,LL,Ask + LimitOrder*Point*K ,2,0,0,NULL,MagicNumber1,TimeCurrent()+TimeL*60,Orange);
        }
     return;   
}
//+--------------------------------------------------------------------------------------------------------------+
//| Dstop функция открытия дополнительных стоповых ордеров
//+--------------------------------------------------------------------------------------------------------------+

void Dstop(int PA) {
int bm=0,sm=0,bmd=0,smd=0,bms=0,sms=0,LBD=0,LSD=0,NB=0,NS=0,Z=0,MB=0,MS=0,zb=0,zs=0,BS=0,SS=0,ZP=0,CountDop=0;
double PRB,PRS,drb,drs,L,LOT,LOTD,LS,LL,LD,LOTS;
for (int i = OrdersTotal() - 1; i >= 0; i--)
     {
    if (!(OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) || OrderSymbol() != Symbol()) 
         continue;
    if (OrderMagicNumber()==MagicNumber||OrderMagicNumber()==MagicNumber1&&
        BalansMargin*AccountMargin()>AccountFreeMargin()&&BalansMargin>0)Z=1;
    if(OrderMagicNumber()==MagicNumber1)//darfs
    CountDop++;
    if(CountDop >= MaxDop&&MaxDop>0) ZP=1; //darfs
    if (OrderType()==OP_BUYSTOP)BS=1;
    if (OrderType()==OP_SELLSTOP)SS=1;
   
    if (OrderType()==OP_BUY||OrderType()==OP_SELL&&OrderOpenTime()>=iTime(Symbol(),AccountBar,0))Z=1;
      
    if (OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber&&Ask<OrderOpenPrice()-DOPS*Point*K){bms=1;LOTS=OrderLots();}
    if (OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber&&Bid>OrderOpenPrice()+DOPS*Point*K){sms=1;LOTS=OrderLots();} 
    
    if (AccountOrder == FALSE){
        
    if (OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber1&&Ask<OrderOpenPrice()-DOPS*Point*K){bms=1;LOTS=OrderLots();}
    if (OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber1&&Bid>OrderOpenPrice()+DOPS*Point*K){sms=1;LOTS=OrderLots();} 
    }
    
    if(OrderType()==OP_BUYSTOP&&TimeCurrent()-OrderOpenTime()>TimeS*60)OrderDelete(OrderTicket());
    if(OrderType()==OP_SELLSTOP&&TimeCurrent()-OrderOpenTime()>TimeS*60)OrderDelete(OrderTicket());     
    
    if(ModifStop == TRUE&&OrderType()==OP_BUYSTOP&&OrderOpenPrice()-Ask>StopOrder*Point*K)OrderModify(OrderTicket(),Ask+StopOrder*Point*K,0,0,OrderExpiration(),CLR_NONE);
    if(ModifStop == TRUE&&OrderType()==OP_SELLSTOP&&Bid-OrderOpenPrice()>StopOrder*Point*K)OrderModify(OrderTicket(),Bid-StopOrder*Point*K,0,0,OrderExpiration(),CLR_NONE);
    } 
    if (StartLot>0){LOT=LotSize;LOTD=LotSize;LOTS=LotSize;}   
    for (int y = OrdersTotal() - 1; y >= 0; y--)
     {
    if (OrderSelect(y, SELECT_BY_POS, MODE_TRADES) && OrderSymbol() == Symbol()&&(OrderMagicNumber()==MagicNumber1||OrderMagicNumber()==MagicNumber)) 
         {
         if (RiskMargin>0&&RiskMargin*AccountFreeMargin()<AccountMargin())ZP=1;
         }
      }    
        double ML;
        int m;
        double MG=AccountFreeMargin()*RiskFreeMargin;
        double Min = MarketInfo(Symbol(), MODE_LOTSTEP);
        m=MG/MarketInfo (Symbol(), MODE_MARGINREQUIRED)/Min;
        ML = m*Min; 
        if(ML>MaxLot)ML= MaxLot; 
 //...........................STOP................................................

        if(PA==0&&bms==1&&BS==0&&OpenLongSignal()==true&&ZP==0
        )          
        {
         LS=NormalizeDouble(KStop*LOTS,2); 
         if(LS>MaxLot)LS=MaxLot;
         if(LS>ML)LS=ML;         
         OrderSend(Symbol(),4,LS,Ask + StopOrder*Point*K ,2,0,0,NULL,MagicNumber1,TimeCurrent()+TimeS*60,Aqua);       
        }     
        if(PA==0&&sms==1&&SS==0&&OpenShortSignal()==true&&ZP==0
        )           
        { 
        LS=NormalizeDouble(KStop*LOTS,2);
        if(LS>MaxLot)LS=MaxLot;
        if(LS>ML)LS=ML;         
        OrderSend(Symbol(),5,LS,Bid - StopOrder*Point*K ,2,0,0,NULL,MagicNumber1,TimeCurrent()+TimeS*60,Yellow);
        } 
    return;
}
//+--------------------------------------------------------------------------------------------------------------+
//| Grafik.
//+--------------------------------------------------------------------------------------------------------------+
void Grafik()
{
int b=0,s=0;

for (int i = OrdersTotal() - 1; i >= 0; i--)
     {
    if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)&& OrderSymbol() == Symbol()) 
      {
   
    if (OrderMagicNumber()==MagicNumber)
    {
    if (OrderType()==OP_BUY)b=1;//else b=0;
    if (OrderType()==OP_SELL)s=1;//else s=0;

    if (OrderType()==OP_BUY)
      {
      if(ObjectFind("NP")==-1)
      {
        ObjectCreate("NP",OBJ_HLINE,0,0,OrderOpenPrice());
        ObjectSet("NP",OBJPROP_COLOR,LC);
      }
      }

   
    if (OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber)
      {
      if(ObjectFind("NP1")==-1)
      {
        ObjectCreate("NP1",OBJ_HLINE,0,0,OrderOpenPrice());
        ObjectSet("NP1",OBJPROP_COLOR,LC1);
      }
      }

    }
    double P= ObjectGet( "NP", OBJPROP_PRICE1);
    double p = NormalizeDouble(P,Digits);
    double P1= ObjectGet( "NP1", OBJPROP_PRICE1);
    double p1 = NormalizeDouble(P1,Digits);
    if (ModifTake == FALSE&&ModifDOP >0&&ObjectFind("NP")!=-1&&b==1&&OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber1&&OrderTakeProfit()<p-Point)
        OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),p,0,CLR_NONE);
    if (ModifTake == FALSE&&ModifDOP > 0&&ObjectFind("NP1")!=-1&&s==1&&OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber1&&OrderTakeProfit()>p1+Point)
        OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),p1,0,CLR_NONE);
//.....................................................................................................................
    if (ModifTake == TRUE&&ObjectFind("NP")!=-1&&b==1&&OrderType()==OP_BUY&&OrderMagicNumber()==MagicNumber1&&OrderOpenPrice()<p-(Ask-Bid))
        OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),p,0,CLR_NONE);
    if (ModifTake == TRUE&&ObjectFind("NP1")!=-1&&s==1&&OrderType()==OP_SELL&&OrderMagicNumber()==MagicNumber1&&OrderOpenPrice()>p1+(Ask-Bid))
        OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),p1,0,CLR_NONE);
   
//.....................................................................................................................
  
    }
   }
    if (b==0)ObjectDelete("NP");
    if (s==0)ObjectDelete("NP1");
}


