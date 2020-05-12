void main()
{
    object oItem = CreateItemOnObject("sfcraft_ssword");

    SetLocalString(OBJECT_SELF, "BASE", "1d6 Piercing [19-20 x2]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
