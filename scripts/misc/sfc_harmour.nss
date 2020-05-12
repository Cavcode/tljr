void main()
{
    object oItem = CreateItemOnObject("sfcraft_harmour");

    SetLocalString(OBJECT_SELF, "BASE", "Base AC: 8");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
