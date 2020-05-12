void main()
{
    object oItem = CreateItemOnObject("sfcraft_dmace");

    SetLocalString(OBJECT_SELF, "BASE", "1d8 Bludgeoning [20-20 x2]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
