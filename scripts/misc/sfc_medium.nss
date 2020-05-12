void main()
{
    object oItem = CreateItemOnObject("sfcraft_medium");

    SetLocalString(OBJECT_SELF, "BASE", "Base AC: 5");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
