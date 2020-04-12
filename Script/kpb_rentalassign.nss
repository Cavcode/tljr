////////////////////////////////////////////
//  Kittrell's Persistent Banking System  //
//  Designed by: Brian J. Kittrell        //
//                                        //
//  This script does the following:       //
//                                        //
//  kpb_rental - This script allows       //
//  players to store up to 30 items in    //
//  the Item Bank Vaults.                 //
////////////////////////////////////////////

void main()
{
object oPC = GetPCSpeaker();
int nRentalFee = 100;
int nRentalCheck = GetCampaignInt("kpb_bank", "KPB_BANK_RENTAL", oPC);
int nGold = GetGold(oPC);
if (nRentalCheck == 1)
    {
    SpeakString("You already have bought vault space!  No need to buy it again.");
    }
if (nGold < 100 && nRentalCheck != 1)
    {
    SpeakString("Sorry, you do not have enough gold to purchase the rights.", TALKVOLUME_TALK);
    }
if (nGold >= 100 && nRentalCheck != 1)
    {
    TakeGoldFromCreature(nRentalFee, oPC, TRUE);
    SetCampaignInt("kpb_bank", "KPB_BANK_RENTAL", 1, oPC);
    SpeakString("You may now use the vault.");
    }
}
