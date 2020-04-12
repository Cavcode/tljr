void main()
{
    object oItem = CreateItemOnObject("sfcraft_hflail");

    SetLocalString(OBJECT_SELF, "BASE", "1d10 Bludgeoning [19-20 x2]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
