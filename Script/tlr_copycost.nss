//::///////////////////////////////////////////////
//:: Tailoring - Copy Cost
//:: tlr_copycost.nss
//:: Copyright (c) 2003 Jake E. Fitch
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Jake E. Fitch (Milambus Mandragon)
//:: Created On: March 9, 2004
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oPC = GetPCSpeaker();

    object oNPCItem = GetItemInSlot(INVENTORY_SLOT_CHEST, OBJECT_SELF);
    object oPCItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);

    int iCost = 0;
    int iAC = GetItemACValue(oNPCItem);

    string sOut = "Cost: " + IntToString(iCost) + " gold.\n";
    sOut += "AC: " + IntToString(iAC) + "\n";
    sOut += "(Note: You may only copy appearances that have the same AC value as your current clothing.)\n";
    sOut += "\nDo you wish to continue with the purchase?";

    SetCustomToken(9876, sOut);

    return TRUE;
}
