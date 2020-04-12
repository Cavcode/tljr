#include "lcs_wpn_include"

void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    int nNewLine = lcs_GetNextValidWeaponModel(oItem, ITEM_APPR_WEAPON_MODEL_BOTTOM);

    lcs_ModifyandEquipNewWeapon(oItem, ITEM_APPR_WEAPON_MODEL_BOTTOM, nNewLine);
}
