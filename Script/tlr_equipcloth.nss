// This script equips the model's clothing

void main()
{
    object oArmor = GetItemPossessedBy(OBJECT_SELF, "Clothing");
    ActionEquipItem(oArmor, INVENTORY_SLOT_CHEST);
}
