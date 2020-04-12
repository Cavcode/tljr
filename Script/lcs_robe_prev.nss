#include "lcs_armr_include"

void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
    int nNewLine = lcs_GetPreviousValidArmor2DALine(oItem, ITEM_APPR_ARMOR_MODEL_ROBE);

    lcs_ModifyandEquipNewArmor(oItem, ITEM_APPR_ARMOR_MODEL_ROBE, nNewLine);
}
