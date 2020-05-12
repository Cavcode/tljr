void main()
{
    object oItem = CreateItemOnObject("sfcraft_gsword");

    SetLocalString(OBJECT_SELF, "BASE", "2d6 Slashing [19-20 x2]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
