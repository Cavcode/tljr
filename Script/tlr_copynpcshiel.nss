// Copy NPC Shield to the PC

void main() {

    object oPC = GetPCSpeaker();
    object oNPCShield = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, OBJECT_SELF);
    object oPCShield = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);

    if (!GetIsObjectValid(oNPCShield)) return;

    if (GetIsObjectValid(oPCShield)) {
        int nModel = GetItemAppearance(oNPCShield, ITEM_APPR_TYPE_SIMPLE_MODEL, 0);
        object oNewShield = CopyItemAndModify(oPCShield, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nModel, TRUE);
        DestroyObject(oPCShield);

        DelayCommand(0.5, AssignCommand(oPC, ActionEquipItem(oNewShield, INVENTORY_SLOT_LEFTHAND)));
    }
}
