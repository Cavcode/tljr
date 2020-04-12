#include "lcs_shld_include"

void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
    int nNewLine = lcs_GetPreviousValidShieldModel(oItem);

    lcs_ModifyandEquipNewShield(oItem, nNewLine);
}
