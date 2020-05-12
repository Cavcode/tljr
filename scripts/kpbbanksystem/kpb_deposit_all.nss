////////////////////////////////////////////
//  Kittrell's Persistent Banking System  //
//  Designed by: Brian J. Kittrell        //
//                                        //
//  This script does the following:       //
//
//  kpb_deposit_all - This script allows  //
//  players to deposit all of their gold  //
//  that they are carrying in one foul    //
//  swoop.  For the paranoid adventurer   //
//  who feels wary of carrying any gold   //
//  into the dungeon. :)                  //
////////////////////////////////////////////

void main()
{
object oPC = GetPCSpeaker();
int nBalance = GetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", oPC);
int nGold = GetGold(oPC);
int nAmount = (nGold + nBalance);
int iMonth = GetCalendarMonth();
int iDay = GetCalendarDay();
int iYear = GetCalendarYear();
if (nGold >= 1)
    {
    TakeGoldFromCreature(nGold, oPC, TRUE);
    SetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", nAmount, oPC);
    SetCampaignInt("kpb_bank", "KPB_DEPO_YEAR", iYear, oPC);
    SetCampaignInt("kpb_bank", "KPB_DEPO_DAY", iDay, oPC);
    SetCampaignInt("kpb_bank", "KPB_DEPO_MONTH", iMonth, oPC);
    SpeakString("Very well.  You have deposited " + IntToString(nGold) + " gold pieces.", TALKVOLUME_TALK);
    }
else
    {
    SpeakString("Sorry, you do not have enough gold to deposit.", TALKVOLUME_TALK);
    }
}
