#include "qx_inc_spells"

void main()
{
    object oPC = GetLastDisarmed();
    object oTurret = GetLocalObject(OBJECT_SELF, "TURRET");
    string sTrtRef = "pug_turret";

    SendMessageToPC(oPC, "*hacking " + GetName(oTurret)+"...*");

    //int nBuild = GetSkillRank(28, oPC, FALSE);
    if (GetIsSkillSuccessful(oPC, 28, 20))
        {
            if (GetIsSkillSuccessful(oPC, SKILL_OPEN_LOCK, 20))
            {
                HackTurret(oPC, oTurret, TRUE);
            }
            else
            {
                HackTurret(oPC, oTurret, FALSE);
            }
        }
    else
    {
        FloatingTextStringOnCreature("Fail", oPC, FALSE);
    }
}
