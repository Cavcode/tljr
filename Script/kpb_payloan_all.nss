////////////////////////////////////////////
//  Kittrell's Persistent Banking System  //
//  Designed by: Brian J. Kittrell        //
//                                        //
//  This script does the following:       //
//                                        //
//  kpb_payloan_all - This script allows  //
//  players to pay off a loan completely. //
////////////////////////////////////////////
#include "kpb_dateinc"
void main()
{
object oPC = GetPCSpeaker();
int nBalance = GetCampaignInt("kpb_bank", "KPB_LOAN_AMT", oPC);
int nGold = GetGold(oPC);

int nYear = GetCampaignInt("kpb_bank", "KPB_LOAN_YEAR", oPC);
int nMonth = GetCampaignInt("kpb_bank", "KPB_LOAN_MONTH", oPC);
int nDay = GetCampaignInt("kpb_bank", "KPB_LOAN_DAY", oPC);

int iMonth = GetCalendarMonth();
int iDay = GetCalendarDay();
int iYear = GetCalendarYear();

int nOldCredit = GetCampaignInt("kpb_bank", "KPB_CREDIT_AMT", oPC);
int nImprovedCredit = GetCampaignInt("kpb_bank", "KPB_CREDIT_RATE", oPC);

string sCurrentDate = GetCurrentDate();
string sLoanDate = GetDateString(nDay, nMonth, nYear);
int nTotalDays = GetDateDifference(sLoanDate, sCurrentDate, "days");
int nInterest = GetCampaignInt("kpb_bank", "KPB_CREDIT_RATE", oPC);
int nNewInterest = ((nInterest * nBalance)/100);
int nNewBalanceA = (nBalance + nNewInterest);
int nNewBalanceB = (nBalance + (nNewInterest * 2));
int nNewBalanceC = (nBalance + (nNewInterest * 3));
int nNewBalanceD = (nBalance + (nNewInterest * 4));
int nNewBalanceE = (nBalance + (nNewInterest * 5));
int nNewBalanceF = (nBalance + (nNewInterest * 8));

  if (nTotalDays == 0)
  {
    if (nGold >= nBalance)
  {
  SpeakString("Very well.  Your account didn't acquire any interest.", TALKVOLUME_TALK);
  TakeGoldFromCreature(nBalance, oPC, TRUE);
  SetCampaignInt("kpb_bank", "KPB_LOAN_AMT", 0, oPC);
  }
    if (nGold < nBalance)
  {
  SpeakString("Sorry, you do not have enough gold to pay on this loan.", TALKVOLUME_TALK);
  }
  }


  if (nTotalDays >= 1 && nTotalDays <= 7)
  {
    if (nGold >= nNewBalanceA)
  {
  int nNewBalance = (nBalance + nNewInterest);
  TakeGoldFromCreature(nNewBalance, oPC, TRUE);
  SpeakString("You have paid " + IntToString(nNewBalance) + " gold.  You now owe nothing to the bank.", TALKVOLUME_TALK);
    if (nTotalDays >= 5)
    {
    SetCampaignInt("kpb_bank", "KPB_CREDIT_AMT", nImprovedCredit, oPC);
    }
  SetCampaignInt("kpb_bank", "KPB_LOAN_AMT", 0, oPC);
  }
    if (nGold < nNewBalanceA)
  {
  SpeakString("Sorry, you do not have enough gold to pay on this loan.", TALKVOLUME_TALK);
  }
  }


  if (nTotalDays >= 8 && nTotalDays <= 14)
  {
    if (nGold >= nNewBalanceB)
  {
  int nNewBalance = (nBalance + (nNewInterest * 2));
  TakeGoldFromCreature(nNewBalance, oPC, TRUE);
  SpeakString("You have paid " + IntToString(nNewBalance) + " gold.  You now owe nothing to the bank.", TALKVOLUME_TALK);
  int nNewCredit = nOldCredit - nImprovedCredit;
  SetCampaignInt("kpb_bank", "KPB_CREDIT_AMT", nNewCredit, oPC);
  SetCampaignInt("kpb_bank", "KPB_LOAN_AMT", 0, oPC);
  }
      if (nGold < nNewBalanceB)
  {
  SpeakString("Sorry, you do not have enough gold to pay on this loan.", TALKVOLUME_TALK);
  }
  }

  if (nTotalDays >= 15 && nTotalDays <= 21)
  {
      if (nGold >= nNewBalanceC)
  {
  int nNewBalance = (nBalance + (nNewInterest * 3));
  TakeGoldFromCreature(nNewBalance, oPC, TRUE);
  SpeakString("You have paid " + IntToString(nNewBalance) + " gold.  You now owe nothing to the bank.", TALKVOLUME_TALK);
  int nNewCredit = nOldCredit - (nImprovedCredit * 2);
  SetCampaignInt("kpb_bank", "KPB_CREDIT_AMT", nNewCredit, oPC);
  SetCampaignInt("kpb_bank", "KPB_LOAN_AMT", 0, oPC);
  }
      if (nGold < nNewBalanceC)
  {
  SpeakString("Sorry, you do not have enough gold to pay on this loan.", TALKVOLUME_TALK);
  }
  }


  if (nTotalDays >= 22 && nTotalDays <= 28)
  {
    if (nGold >= nNewBalanceD)
  {
  int nNewBalance = (nBalance + (nNewInterest * 4));
  TakeGoldFromCreature(nNewBalance, oPC, TRUE);
  SpeakString("You have paid " + IntToString(nNewBalance) + " gold.  You now owe nothing to the bank.", TALKVOLUME_TALK);
  int nNewCredit = nOldCredit - (nImprovedCredit * 3);
  SetCampaignInt("kpb_bank", "KPB_CREDIT_AMT", nNewCredit, oPC);
  SetCampaignInt("kpb_bank", "KPB_LOAN_AMT", 0, oPC);
  }
    if (nGold < nNewBalanceD)
  {
  SpeakString("Sorry, you do not have enough gold to pay on this loan.", TALKVOLUME_TALK);
  }
  }


  if (nTotalDays >= 29 && nTotalDays <= 36)
  {
  if (nGold >= nNewBalanceE)
  {
  int nNewBalance = (nBalance + (nNewInterest * 5));
  TakeGoldFromCreature(nNewBalance, oPC, TRUE);
  SpeakString("You have paid " + IntToString(nNewBalance) + " gold.  You now owe nothing to the bank.", TALKVOLUME_TALK);
  int nNewCredit = nOldCredit - (nImprovedCredit * 4);
  SetCampaignInt("kpb_bank", "KPB_CREDIT_AMT", nNewCredit, oPC);
  SetCampaignInt("kpb_bank", "KPB_LOAN_AMT", 0, oPC);
  }
        if (nGold < nNewBalanceE)
  {
  SpeakString("Sorry, you do not have enough gold to pay on this loan.", TALKVOLUME_TALK);
  }
  }


  if (nTotalDays > 37)
  {
    if (nGold >= nNewBalanceF)
  {
  int nNewBalance = (nBalance + (nNewInterest * 8));
  TakeGoldFromCreature(nNewBalance, oPC, TRUE);
  SpeakString("You have paid " + IntToString(nNewBalance) + " gold.  You now owe nothing to the bank.", TALKVOLUME_TALK);
  int nNewCredit = nOldCredit - (nImprovedCredit * 6);
  SetCampaignInt("kpb_bank", "KPB_CREDIT_AMT", nNewCredit, oPC);
  SetCampaignInt("kpb_bank", "KPB_LOAN_AMT", 0, oPC);
  }
    if (nGold < nNewBalanceF)
  {
  SpeakString("Sorry, you do not have enough gold to pay on this loan.", TALKVOLUME_TALK);
  }
  }
}
