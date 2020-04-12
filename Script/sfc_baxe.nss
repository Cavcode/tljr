void main()
{
    object oItem = CreateItemOnObject("sfcraft_baxe");

    SetLocalString(OBJECT_SELF, "BASE", "1d8 Slashing [20-20 x3]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
