void main()
{
    object oItem = CreateItemOnObject("sfcraft_light");

    SetLocalString(OBJECT_SELF, "BASE", "Base AC: 3");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
