// Equips/Unequips cloak

void main()
{
    object oCloak = (GetItemPossessedBy(OBJECT_SELF, "TLR_CLOAK"));

    if (oCloak == OBJECT_INVALID)
        oCloak = CreateItemOnObject("tlr_cloak");
    if (oCloak != GetItemInSlot(INVENTORY_SLOT_CLOAK))
        DelayCommand(0.5, ActionEquipItem(oCloak, INVENTORY_SLOT_CLOAK));
    else
        DelayCommand(0.5, ActionUnequipItem(oCloak));
}
