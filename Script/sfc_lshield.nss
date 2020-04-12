void main()
{
    object oItem = CreateItemOnObject("sfcraft_lshield");

    SetLocalString(OBJECT_SELF, "BASE", "Base AC: 2");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
