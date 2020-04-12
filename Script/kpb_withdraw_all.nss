////////////////////////////////////////////
//  Kittrell's Persistent Banking System  //
//  Designed by: Brian J. Kittrell        //
//                                        //
//  This script does the following:       //
//                                        //
//  kpb_withdraw_all - This script allows //
//  withdraw to deposit all of their gold //
//  that they are carrying in one foul    //
//  swoop.  For the big spender looking   //
//  to spend the day shopping around the  //
//  city. :)                              //
////////////////////////////////////////////

void main()
{
object oPC = GetPCSpeaker();
int nBalance = GetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", oPC);
int nAmount = 0;
if (nBalance >= 1)
    {
    GiveGoldToCreature(oPC, nBalance);
    SetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", nAmount, oPC);
    }
else
    {
    SpeakString("Sorry, you do not have enough gold to deposit.", TALKVOLUME_TALK);
    }
}
