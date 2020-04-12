// Equips/Unequips helmet

void main()
{
    object oHelm = (GetItemPossessedBy(OBJECT_SELF, "Tlr_Helmet"));

    if (oHelm == OBJECT_INVALID)
        oHelm = CreateItemOnObject("mil_clothing669");
    if (oHelm != GetItemInSlot(INVENTORY_SLOT_HEAD))
        DelayCommand(0.5, ActionEquipItem(oHelm, INVENTORY_SLOT_HEAD));
    else
        DelayCommand(0.5, ActionUnequipItem(oHelm));
}
