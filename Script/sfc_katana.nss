void main()
{
    object oItem = CreateItemOnObject("sfcraft_katana");

    SetLocalString(OBJECT_SELF, "BASE", "1d10 Slashing [19-20 x2]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
