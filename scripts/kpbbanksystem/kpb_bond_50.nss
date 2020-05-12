////////////////////////////////////////////
//  Kittrell's Persistent Banking System  //
//  Designed by: Brian J. Kittrell        //
//                                        //
//  This script does the following:       //
//                                        //
//  kpb_bond_50 - This script allows      //
//  players to receive a bullion bank     //
//  bond for 50,000 gold coins.           //
////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    string sItem = "bullionbond50";
    int nCost = 50000;
    int nGold = GetGold(oPC);

    if (nGold < nCost)
    {
    SpeakString("You must have 50,000 gold on you to get a 50,000 gold bond!");
    return;
    }
    if (nGold >= nCost)
    {
        CreateItemOnObject(sItem, oPC);
        TakeGoldFromCreature(50000, oPC, TRUE);
        SpeakString("Very well.  I have exchanged your gold for a bond.");
    }
}
