void main()
{
    object oItem = CreateItemOnObject("sfcraft_tbsword");

    SetLocalString(OBJECT_SELF, "BASE", "1d8 Slashing [19-20 x2]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
