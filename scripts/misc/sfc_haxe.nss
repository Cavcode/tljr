void main()
{
    object oItem = CreateItemOnObject("sfcraft_haxe");

    SetLocalString(OBJECT_SELF, "BASE", "1d6 Slashing [20-20 x3]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
