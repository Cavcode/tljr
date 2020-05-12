// unequips the model's items
void main()
{
    object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST, OBJECT_SELF);
    DelayCommand(0.5, AssignCommand(OBJECT_SELF, ActionUnequipItem(oArmor)));

    object oHelm = GetItemInSlot(INVENTORY_SLOT_HEAD, OBJECT_SELF);
    DelayCommand(0.5, AssignCommand(OBJECT_SELF, ActionUnequipItem(oHelm)));

    object oCloak = GetItemInSlot(INVENTORY_SLOT_CLOAK, OBJECT_SELF);
    DelayCommand(0.5, AssignCommand(OBJECT_SELF, ActionUnequipItem(oCloak)));

    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF);
    DelayCommand(0.5, AssignCommand(OBJECT_SELF, ActionUnequipItem(oWeapon)));
}
