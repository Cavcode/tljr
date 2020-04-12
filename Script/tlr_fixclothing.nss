// Requip clothing, helmet, and cloak
void main()
{
    object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST);
    object oHelmet = GetItemInSlot(INVENTORY_SLOT_HEAD);
    object oCloak = GetItemInSlot(INVENTORY_SLOT_CLOAK);
    ActionUnequipItem(oArmor);
    ActionUnequipItem(oHelmet);
    ActionUnequipItem(oCloak);
    DelayCommand(2.0f, ActionEquipItem(oArmor, INVENTORY_SLOT_CHEST));
    DelayCommand(2.0f, ActionEquipItem(oHelmet, INVENTORY_SLOT_HEAD));
    DelayCommand(2.0f, ActionEquipItem(oCloak, INVENTORY_SLOT_CLOAK));
}
