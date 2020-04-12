////////////////////////////////////////////
//  Kittrell's Persistent Banking System  //
//  Designed by: Brian J. Kittrell        //
//                                        //
//  This script does the following:       //
//                                        //
//  kpb_takeloan100 - This script allows  //
//  players to take a loan of 100 gold.   //
////////////////////////////////////////////
void main()
{
object oPC = GetPCSpeaker();

SetCampaignInt("kpb_bank", "KPB_LOAN_YEAR", GetCalendarYear(), oPC);
SetCampaignInt("kpb_bank", "KPB_LOAN_MONTH", GetCalendarMonth(), oPC);
SetCampaignInt("kpb_bank", "KPB_LOAN_DAY", GetCalendarDay(), oPC);

int iMonth = GetCalendarMonth();
int iDay = GetCalendarDay();
int iYear = GetCalendarYear();

int nLoan = 100;
    GiveGoldToCreature(oPC, nLoan);
    SetCampaignInt("kpb_bank", "KPB_LOAN_AMT", nLoan, oPC);
    SpeakString("Very well.  Payment is due within a week from today's date.", TALKVOLUME_TALK);
}
