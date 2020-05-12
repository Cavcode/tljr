////////////////////////////////////////////
//  Kittrell's Persistent Banking System  //
//  Designed by: Brian J. Kittrell        //
//                                        //
//  This script does the following:       //
//                                        //
//  kpb_bond_25 - This script allows      //
//  players to receive a bullion bank     //
//  bond for 25,000 gold coins.           //
////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    string sItem = "bullionbond25";
    int nCost = 25000;
    int nGold = GetGold(oPC);

    if (nGold < nCost)
    {
    SpeakString("You must have 25,000 gold on you to get a 25,000 gold bond!");
    return;
    }
    if (nGold >= nCost)
    {
        CreateItemOnObject(sItem, oPC);
        TakeGoldFromCreature(25000, oPC, TRUE);
        SpeakString("Very well.  I have exchanged your gold for a bond.");
    }
}
