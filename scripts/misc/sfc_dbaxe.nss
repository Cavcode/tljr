void main()
{
    object oItem = CreateItemOnObject("sfcraft_dbaxe");

    SetLocalString(OBJECT_SELF, "BASE", "1d8 Slashing [20-20 x3]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
