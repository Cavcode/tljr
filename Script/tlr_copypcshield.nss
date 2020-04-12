// Copy PC Shield to the NPC

void main() {

    object oNPC = OBJECT_SELF;
    object oPC = GetPCSpeaker();
    object oPCShield = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
    object oNPCShield = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oNPC);

    if (GetIsObjectValid(oNPCShield)) DestroyObject(oNPCShield);

    // Copy the shield to the NPC
    oNPCShield = CopyItem(oPCShield, oNPC, TRUE);

    // Equip the shield
    DelayCommand(0.5f, ActionEquipItem(oNPCShield, INVENTORY_SLOT_LEFTHAND));

}
