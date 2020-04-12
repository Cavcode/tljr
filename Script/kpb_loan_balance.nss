#include "kpb_dateinc"
int StartingConditional()
{
  object oPC = GetPCSpeaker();
  int nLoan = GetCampaignInt("kpb_bank", "KPB_LOAN_AMT", oPC);

  int nYear = GetCampaignInt("kpb_bank", "KPB_LOAN_YEAR", oPC);
  int nMonth = GetCampaignInt("kpb_bank", "KPB_LOAN_MONTH", oPC);
  int nDay = GetCampaignInt("kpb_bank", "KPB_LOAN_DAY", oPC);

  int iMonth = GetCalendarMonth();
  int iDay = GetCalendarDay();
  int iYear = GetCalendarYear();

  string sCurrentDate = GetCurrentDate();
  string sLoanDate = GetDateString(nDay, nMonth, nYear);

  int nTotalDays = GetDateDifference(sLoanDate, sCurrentDate, "days");
  int nInterest = GetCampaignInt("kpb_bank", "KPB_CREDIT_RATE", oPC);
  int nNewInterest = ((nInterest * nLoan)/100);
  if (nTotalDays == 0)
  {
  string sLoan = IntToString(nLoan);
  SetCustomToken(23, sLoan);
  }
  if (nTotalDays >= 1 && nTotalDays <= 7)
  {
  int nLoanFigure = (nLoan + nNewInterest);
  string sLoan = IntToString(nLoanFigure);
  SetCustomToken(23, sLoan);
  }
  if (nTotalDays >= 8 && nTotalDays <= 14)
  {
  int nLoanFigure = (nLoan + (nNewInterest * 2));
  string sLoan = IntToString(nLoanFigure);
  SetCustomToken(23, sLoan);
  }
  if (nTotalDays >= 15 && nTotalDays <= 21)
  {
  int nLoanFigure = (nLoan + (nNewInterest * 3));
  string sLoan = IntToString(nLoanFigure);
  SetCustomToken(23, sLoan);
  }
  if (nTotalDays >= 22 && nTotalDays <= 28)
  {
  int nLoanFigure = (nLoan + (nNewInterest * 4));
  string sLoan = IntToString(nLoanFigure);
  SetCustomToken(23, sLoan);
  }
  if (nTotalDays >= 29 && nTotalDays <= 36)
  {
  int nLoanFigure = (nLoan + (nNewInterest * 5));
  string sLoan = IntToString(nLoanFigure);
  SetCustomToken(23, sLoan);
  }
  if (nTotalDays > 37)
  {
  int nLoanFigure = (nLoan + (nNewInterest * 8));
  string sLoan = IntToString(nLoanFigure);
  SetCustomToken(23, sLoan);
  }
  string sOneHundred = "100";
  SetCustomToken(26, sOneHundred);
  string sOneThousand = "1000";
  SetCustomToken(27, sOneThousand);
  string sFiveThousand = "5000";
  SetCustomToken(28, sFiveThousand);
  string sTenThousand = "10000";
  SetCustomToken(29, sTenThousand);
  return TRUE;
}

