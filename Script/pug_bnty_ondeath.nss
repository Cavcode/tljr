#include "pug_inc"
void main()
{
object oPC = GetLastKiller();
string sLevel = GetStringRight(GetTag(OBJECT_SELF), 2);
int nBounty = GetLocalInt(GetObjectByTag("bnty_master"), "TARGET_BOUNTY_"+sLevel);

if (GetLocalString(oPC, "TARGET_"+sLevel) == GetName(OBJECT_SELF))
    {
    GiveXPToCreature(oPC, GetHitDice(OBJECT_SELF)*10);
    SetLocalInt(oPC, "BOUNTY_"+sLevel, nBounty);
    SetLocalString(oPC, "BOUNTY_STATUS_"+sLevel, "dead");

    if (GetStandardFactionReputation(STANDARD_FACTION_DEFENDER, oPC) != 50)
        {
        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 50, oPC);
        }
    FloatingTextStringOnCreature("Return to Jabba's Palace to receive your reward", oPC, FALSE);
    }
DelayCommand(6.5,CreateBountyTarget(GetObjectByTag("bnty_master"), StringToInt(sLevel)));
}
