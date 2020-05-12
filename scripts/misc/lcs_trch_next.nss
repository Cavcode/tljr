#include "lcs_trch_include"

void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
    int nNewLine = lcs_GetNextValidTorchModel(oItem);

    lcs_ModifyandEquipNewTorch(oItem, nNewLine);
}
