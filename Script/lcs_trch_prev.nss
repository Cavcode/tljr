#include "lcs_trch_include"

void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
    int nNewLine = lcs_GetPreviousValidTorchModel(oItem);

    lcs_ModifyandEquipNewTorch(oItem, nNewLine);
}
