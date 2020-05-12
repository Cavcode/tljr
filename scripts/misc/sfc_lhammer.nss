void main()
{
    object oItem = CreateItemOnObject("sfcraft_lhammer");

    SetLocalString(OBJECT_SELF, "BASE", "1d4 Bludgeoning [20-20 x2]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
