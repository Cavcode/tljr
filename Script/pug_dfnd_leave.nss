#include "pug_inc"
void main()
{
    string sControl = GetCampaignString("starwars", GetTag(OBJECT_SELF)+"_CONTROL");
    object oPC = GetExitingObject();
    string sFaction;
    int nAttack = GetLocalInt(OBJECT_SELF, "UNDER_ATTACK");

    if (GetIsObjectValid(GetItemPossessedBy(oPC, "RebelAllianceID"))==TRUE)
        {sFaction="Rebels";}
    else if (GetIsObjectValid(GetItemPossessedBy(oPC, "GalaticEmpireID"))==TRUE)
        {sFaction="Empire";}
    else {sFaction="INVALID";}

    if (sFaction != "INVALID" && sControl != sFaction && GetIsPC(oPC)==TRUE && nAttack == TRUE)
        {
        FloatingTextStringOnCreature("You have left the enemy base", oPC, FALSE);
        SetLocalInt(OBJECT_SELF, "UNDER_ATTACK", FALSE);
        BaseControl(GetTag(GetArea(oPC)));
        }
}
