void main()
{
    object oItem = CreateItemOnObject("sfcraft_sickle");

    SetLocalString(OBJECT_SELF, "BASE", "1d6 Slashing [20-20 x2]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
