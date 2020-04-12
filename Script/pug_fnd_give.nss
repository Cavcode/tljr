void main()
{
string sItem = GetLocalString(OBJECT_SELF, "WANTED");
string sName = GetLocalString(OBJECT_SELF, "NAME");
object oPC = GetPCSpeaker();
object oItem = GetItemPossessedBy(oPC, sItem);

if (GetIsObjectValid(oItem) )
    {
    ActionTakeItem(oItem, oPC);
    GiveGoldToCreature(oPC, 800);
    GiveXPToCreature(oPC, 400);
    SetLocalString(OBJECT_SELF, "WANTED", "");
    }
}
