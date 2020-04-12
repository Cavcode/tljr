void main()
{
    object oItem = CreateItemOnObject("sfcraft_scythe");

    SetLocalString(OBJECT_SELF, "BASE", "2d4 Slashing & Piercing [20-20 x4]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
