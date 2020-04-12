#include "lcs_armr_include"

void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
    int nNewLine = lcs_GetNextValidColor(oItem, ITEM_APPR_ARMOR_COLOR_CLOTH1);

    lcs_ModifyColorandEquipNewArmor(oItem, ITEM_APPR_ARMOR_COLOR_CLOTH1, nNewLine);
}
