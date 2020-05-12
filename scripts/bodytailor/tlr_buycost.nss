//::///////////////////////////////////////////////
//:: Tailoring - Buy Cost
//:: tlr_buycost.nss
//:: Copyright (c) 2003 Jake E. Fitch
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Jake E. Fitch (Milambus Mandragon)
//:: Created On: March 8, 2004
//:://////////////////////////////////////////////
int StartingConditional()
{

    object oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, OBJECT_SELF);
    int iCost = GetGoldPieceValue(oItem) * 0;
    int iAC = GetItemACValue(oItem);

    string sOut = "Cost: " + IntToString(iCost) + " gold.\n";
    sOut += "AC: " + IntToString(iAC) + "\n";
    sOut += "(Note: Armor feats my be required to wear this.)\n";
    sOut += "\nDo you wish to continue with the purchase?";

    SetCustomToken(9876, sOut);

    return TRUE;
}
