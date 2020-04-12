void main()
{
object oPC = GetItemActivator();
object oItem = GetItemActivated();

/*if (GetTag(oItem) == "pug_bombset")
    {
    object oBomb = CreateObject(OBJECT_TYPE_PLACEABLE, "pug_demopak", GetLocation(oPC), FALSE);
    object oDetn = CreateItemOnObject("pug_detonator", oPC, 1);
    SetLocalObject(oDetn, "BOMB", oBomb);
    SetLocalInt(oBomb, "BOMB_STR", GetSkillRank(15, oPC, FALSE));
    }*/
}
