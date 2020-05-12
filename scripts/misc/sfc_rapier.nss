void main()
{
    object oItem = CreateItemOnObject("sfcraft_rapier");

    SetLocalString(OBJECT_SELF, "BASE", "1d6 Piercing [18-20 x2]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
