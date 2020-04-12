// Equips/Unequips clothing

void main()
{
    object oArmor = (GetItemPossessedBy(OBJECT_SELF, "Clothing"));

    if (oArmor == OBJECT_INVALID)
        oArmor = CreateItemOnObject("mil_clothing668");
    if (oArmor != GetItemInSlot(INVENTORY_SLOT_CHEST))
        DelayCommand(0.5, ActionEquipItem(oArmor, INVENTORY_SLOT_CHEST));
    else
        DelayCommand(0.5, ActionUnequipItem(oArmor));
}
