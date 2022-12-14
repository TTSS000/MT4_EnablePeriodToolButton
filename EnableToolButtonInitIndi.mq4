//+------------------------------------------------------------------+
//|                                     EnableToolButtonInitIndi.mq4 |
//|                      Copyright 2022, https://twitter.com/ttss000 |
//|                                      https://twitter.com/ttss000 |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, https://twitter.com/ttss000"
#property link      "https://twitter.com/ttss000"
#property version   "1.00"
#property strict
#property indicator_chart_window

#import "EnablePeriodToolButton.dll"
int EnablePeriodToolButton(int hWndParent);
#import "user32.dll"
int GetParent(int hWnd);
int GetAncestor(int hWnd, int gaFlags);
int SendMessageW(int hWnd,int Msg,int wParam,int lParam);
#import

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
//--- indicator buffers mapping
  /*-- 変数の宣言 ----------------------------------------------------*/
  int ClientHandle = 0; //クライアントウィンドウハンドル保持用
  int ThisWinHandle = 0; //Thisウィンドウハンドル保持用
  int ParentWinHandle = 0; //Parentウィンドウハンドル保持用
  int AncestorWinHandle = 0; //Parentウィンドウハンドル保持用

  ClientHandle = (int)ChartGetInteger(0,CHART_WINDOW_HANDLE);
  //          Print ("SyncMain OnTimer ClientHandle0: "+ClientHandle);
  if (ClientHandle != 0) ThisWinHandle = GetParent(ClientHandle);
  //          Print ("SyncMain OnTimer ClientHandle1: "+ClientHandle);
  if (ThisWinHandle != 0) ParentWinHandle = GetParent(ThisWinHandle);
  if (ClientHandle != 0) AncestorWinHandle = GetAncestor(ClientHandle,2);
  Print("ParentWinHandle="+IntegerToString(ParentWinHandle));
  Print("ThisWinHandle="+IntegerToString(ThisWinHandle));
  Print("ClientHandle="+IntegerToString(ClientHandle));
  Print("AncestorWinHandle="+IntegerToString(AncestorWinHandle));
  EnablePeriodToolButton(AncestorWinHandle);

//---
  return(INIT_SUCCEEDED);
}
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
{
//---

//--- return value of prev_calculated for next call
  return(rates_total);
}
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
{
//---

}
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
{
//---

}
//+------------------------------------------------------------------+
