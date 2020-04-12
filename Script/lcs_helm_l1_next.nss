#include "lcs_helm_include"

void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemInSlot(INVENTORY_SLOT_HEAD, oPC);
    int nNewLine = lcs_GetNextValidHelmColor(oItem, ITEM_APPR_ARMOR_COLOR_LEATHER1);

    lcs_ModifyColorandEquipNewHelm(oItem, ITEM_APPR_ARMOR_COLOR_LEATHER1, nNewLine);
}
