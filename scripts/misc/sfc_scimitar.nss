void main()
{
    object oItem = CreateItemOnObject("sfcraft_scimitar");

    SetLocalString(OBJECT_SELF, "BASE", "Base Damage: 1d6 Slashing [18-20 x2]");
    SetLocalObject(OBJECT_SELF, "CRAFT_ITEM", oItem);
}
