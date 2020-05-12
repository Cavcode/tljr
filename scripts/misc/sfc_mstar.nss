void main()
{
    object oItem = CreateItemOnObject("sfcraft_mstar");

    SetLocalString(OBJECT_SELF, "BASE", "1d8 Bludgeoning & Piercing [20-20 x2]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
