////////////////////////////////////////////
//  Kittrell's Persistent Banking System  //
//  Designed by: Brian J. Kittrell        //
//                                        //
//  This script does the following:       //
//                                        //
//  kpb_withdraw10000 - This script       //
//  allows players to withdraw 10000      //
//  of their gold that is in the vault.   //
////////////////////////////////////////////

void main()
{
object oPC = GetPCSpeaker();
int nWithdraw = 10000;
int nBalance = GetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", oPC);
int nAmount = (nBalance - nWithdraw);
int nGold = GetGold(oPC);
if (nBalance >= 10000)
    {
    GiveGoldToCreature(oPC, nWithdraw);
    SetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", nAmount, oPC);
    }
else
    {
    SpeakString("Sorry, you do not have enough gold to withdraw that much.", TALKVOLUME_TALK);
    }
}
