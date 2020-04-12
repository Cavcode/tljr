void main()
{
    object oItem = CreateItemOnObject("sfcraft_club");

    SetLocalString(OBJECT_SELF, "BASE", "1d6 Bludgeoning [20-20 x2]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
