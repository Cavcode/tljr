////////////////////////////////////////////
//  Kittrell's Persistent Banking System  //
//  Designed by: Brian J. Kittrell        //
//                                        //
//  This script does the following:       //
//                                        //
//  kpb_deposit10000 - This script allows //
//  players to deposit 10000 of their     //
//  gold that they are carrying.          //
////////////////////////////////////////////

void main()
{
object oPC = GetPCSpeaker();
int nDeposit = 10000;
int nBalance = GetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", oPC);
int nAmount = (nDeposit + nBalance);
int nGold = GetGold(oPC);
int iMonth = GetCalendarMonth();
int iDay = GetCalendarDay();
int iYear = GetCalendarYear();
if (nGold >= 10000)
    {
    TakeGoldFromCreature(nDeposit, oPC, TRUE);
    SetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", nAmount, oPC);
    SetCampaignInt("kpb_bank", "KPB_DEPO_YEAR", iYear, oPC);
    SetCampaignInt("kpb_bank", "KPB_DEPO_DAY", iDay, oPC);
    SetCampaignInt("kpb_bank", "KPB_DEPO_MONTH", iMonth, oPC);
    }
else
    {
    SpeakString("Sorry, you do not have enough gold to deposit.", TALKVOLUME_TALK);
    }
}
