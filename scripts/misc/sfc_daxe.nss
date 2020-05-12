void main()
{
    object oItem = CreateItemOnObject("sfcraft_daxe");

    SetLocalString(OBJECT_SELF, "BASE", "1d10 Slashing [20-20 x3]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
