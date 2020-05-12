#include "lcs_helm_include"

void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemInSlot(INVENTORY_SLOT_HEAD, oPC);
    int nNewLine = lcs_GetNextValidHelmModel(oItem);

    lcs_ModifyandEquipNewHelm(oItem, nNewLine);
}
