void main()
{
    object oItem = CreateItemOnObject("sfcraft_cloth");

    SetLocalString(OBJECT_SELF, "BASE", "Base AC: 0");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
