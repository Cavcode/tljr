#include "lcs_armr_include"

void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
    int nNewLine = lcs_GetNextValidArmor2DALine(oItem, ITEM_APPR_ARMOR_MODEL_LBICEP);

    lcs_ModifyTwiceandEquipNewArmor(oItem, ITEM_APPR_ARMOR_MODEL_LBICEP, ITEM_APPR_ARMOR_MODEL_RBICEP, nNewLine);
}
