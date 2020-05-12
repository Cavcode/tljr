#include "kpb_dateinc"
void main()
{
  object oPC = GetPCSpeaker();
  int nBalance = GetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", oPC);
  int nYear = GetCampaignInt("kpb_bank", "KPB_DEPO_YEAR", oPC);
  int nMonth = GetCampaignInt("kpb_bank", "KPB_DEPO_MONTH", oPC);
  int nDay = GetCampaignInt("kpb_bank", "KPB_DEPO_DAY", oPC);

  int iMonth = GetCalendarMonth();
  int iDay = GetCalendarDay();
  int iYear = GetCalendarYear();

  string sCurrentDate = GetCurrentDate();
  string sDepDate = GetDateString(nDay, nMonth, nYear);
  int nTotalDays = GetDateDifference(sDepDate, sCurrentDate, "days");
  int nInterest = GetCampaignInt("kpb_bank", "KPB_GLO_INT");
  int nNewInterest = ((nInterest * nBalance)/100);
  if (nInterest < 1)
  {
  SetCampaignInt("kpb_bank", "KPB_GLO_INT", 1);
  int nInterest = 1;
  }
  if (nTotalDays < 7)
  {
  SpeakString("Your balance cannot be assessed.  Be sure to wait at least seven days (from the exact time you last deposited) before assessing interest.", TALKVOLUME_TALK);
  }
  if (nTotalDays == 7)
  {
  int nBalFigure = (nBalance + nNewInterest);
  SetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", nBalFigure, oPC);
  SetCampaignInt("kpb_bank", "KPB_DEPO_YEAR", iYear, oPC);
  SetCampaignInt("kpb_bank", "KPB_DEPO_DAY", iDay, oPC);
  SetCampaignInt("kpb_bank", "KPB_DEPO_MONTH", iMonth, oPC);
  SpeakString("Your account has been assessed.  You now have " + IntToString(nBalFigure) + " gold pieces in your account.", TALKVOLUME_TALK);
  }
  if (nTotalDays >= 8 && nTotalDays <= 14)
  {
  int nBalFigure = (nBalance + (nNewInterest * 2));
  SetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", nBalFigure, oPC);
  SetCampaignInt("kpb_bank", "KPB_DEPO_YEAR", iYear, oPC);
  SetCampaignInt("kpb_bank", "KPB_DEPO_DAY", iDay, oPC);
  SetCampaignInt("kpb_bank", "KPB_DEPO_MONTH", iMonth, oPC);
  SpeakString("Your account has been assessed.  You now have " + IntToString(nBalFigure) + " gold pieces in your account.", TALKVOLUME_TALK);
  }
  if (nTotalDays >= 15 && nTotalDays <= 21)
  {
  int nBalFigure = (nBalance + (nNewInterest * 3));
  SetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", nBalFigure, oPC);
  SetCampaignInt("kpb_bank", "KPB_DEPO_YEAR", iYear, oPC);
  SetCampaignInt("kpb_bank", "KPB_DEPO_DAY", iDay, oPC);
  SetCampaignInt("kpb_bank", "KPB_DEPO_MONTH", iMonth, oPC);
  SpeakString("Your account has been assessed.  You now have " + IntToString(nBalFigure) + " gold pieces in your account.", TALKVOLUME_TALK);
  }
  if (nTotalDays >= 22 && nTotalDays <= 28)
  {
  int nBalFigure = (nBalance + (nNewInterest * 4));
  SetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", nBalFigure, oPC);
  SetCampaignInt("kpb_bank", "KPB_DEPO_YEAR", iYear, oPC);
  SetCampaignInt("kpb_bank", "KPB_DEPO_DAY", iDay, oPC);
  SetCampaignInt("kpb_bank", "KPB_DEPO_MONTH", iMonth, oPC);
  SpeakString("Your account has been assessed.  You now have " + IntToString(nBalFigure) + " gold pieces in your account.", TALKVOLUME_TALK);
  }
  if (nTotalDays >= 29 && nTotalDays <= 35)
  {
  int nBalFigure = (nBalance + (nNewInterest * 5));
  SetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", nBalFigure, oPC);
  SetCampaignInt("kpb_bank", "KPB_DEPO_YEAR", iYear, oPC);
  SetCampaignInt("kpb_bank", "KPB_DEPO_DAY", iDay, oPC);
  SetCampaignInt("kpb_bank", "KPB_DEPO_MONTH", iMonth, oPC);
  SpeakString("Your account has been assessed.  You now have " + IntToString(nBalFigure) + " gold pieces in your account.", TALKVOLUME_TALK);
  }
  if (nTotalDays > 36)
  {
  int nBalFigure = (nBalance + (nNewInterest * 6));
  SetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", nBalFigure, oPC);
  SetCampaignInt("kpb_bank", "KPB_DEPO_YEAR", iYear, oPC);
  SetCampaignInt("kpb_bank", "KPB_DEPO_DAY", iDay, oPC);
  SetCampaignInt("kpb_bank", "KPB_DEPO_MONTH", iMonth, oPC);
  SpeakString("Your account has been assessed.  You now have " + IntToString(nBalFigure) + " gold pieces in your account.", TALKVOLUME_TALK);
  }
}
