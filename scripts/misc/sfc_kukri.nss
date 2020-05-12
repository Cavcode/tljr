void main()
{
    object oItem = CreateItemOnObject("sfcraft_kukri");

    SetLocalString(OBJECT_SELF, "BASE", "1d4 Slashing [18-20 x2]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
