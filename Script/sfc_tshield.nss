void main()
{
    object oItem = CreateItemOnObject("sfcraft_tshield");

    SetLocalString(OBJECT_SELF, "BASE", "Base AC: 3");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
