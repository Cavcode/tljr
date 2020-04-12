void main()
{
    object oItem = CreateItemOnObject("sfcraft_bsword");

    SetLocalString(OBJECT_SELF, "BASE", "1d10 slashing [19-20 x2]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
