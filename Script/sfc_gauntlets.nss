void main()
{
    object oItem = CreateItemOnObject("sfcraft_gauntlet");

    SetLocalString(OBJECT_SELF, "BASE", "Bludgeonings");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
