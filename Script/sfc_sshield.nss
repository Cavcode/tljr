void main()
{
    object oItem = CreateItemOnObject("sfcraft_sshield");

    SetLocalString(OBJECT_SELF, "BASE", "Base AC: 1");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
