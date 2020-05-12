#include "lcs_shld_include"

void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
    int nNewLine = lcs_GetNextValidShieldModel(oItem);

    lcs_ModifyandEquipNewShield(oItem, nNewLine);
}
