#include "pug_inc"
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oPlanet = OBJECT_SELF;
    int nPilot = GetSkillRank( 27, oPC, FALSE);

    if(oPC == OBJECT_SELF && GetIsPC(OBJECT_SELF) == TRUE)
        {
        oPlanet = GetLocalObject(GetPCSpeaker(), "COM_PLANET");
        }
    int nUse = GetLocalInt(oPlanet, "BUSY");
    if (GetFaction(oPC, FALSE) == GetNPCFaction(oPlanet) && nPilot >= 10)
        {
        return TRUE;
        }
    else
        {
        return FALSE;
        }
}
