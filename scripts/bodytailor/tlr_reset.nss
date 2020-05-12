/*
   read the blueprint of our clothes
   destroy clothes
   create the standard blueprint and put it on

*/
void main()
{
    object oNext = GetFirstItemInInventory(OBJECT_SELF);
    while(GetIsObjectValid(oNext))
    {
        DestroyObject(oNext);
        oNext = GetNextItemInInventory(OBJECT_SELF);
    }

    object oClothing = GetItemInSlot(INVENTORY_SLOT_CHEST);
    object oHelm = GetItemInSlot(INVENTORY_SLOT_HEAD);
    object oCloak = GetItemInSlot(INVENTORY_SLOT_CLOAK);
    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);

    DestroyObject(oClothing);
    DestroyObject(oHelm);
    DestroyObject(oCloak);
    DestroyObject(oWeapon);

    oClothing = CreateItemOnObject("mil_clothing668");
    oHelm = CreateItemOnObject("mil_clothing669");
    oCloak = CreateItemOnObject("tlr_cloak");

    DelayCommand(0.5, ActionEquipItem(oClothing, INVENTORY_SLOT_CHEST));
    DelayCommand(0.5, ActionEquipItem(oHelm, INVENTORY_SLOT_HEAD));
    DelayCommand(0.5, ActionEquipItem(oCloak, INVENTORY_SLOT_CLOAK));
}
