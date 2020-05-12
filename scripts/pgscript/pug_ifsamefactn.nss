#include "pug_inc"
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oPlanet = OBJECT_SELF;
    if(oPC == OBJECT_SELF && GetIsPC(OBJECT_SELF) == TRUE)
        {
        oPlanet = GetLocalObject(GetPCSpeaker(), "COM_PLANET");
        }

    if (GetFaction(oPC, FALSE) == GetNPCFaction(oPlanet))
        {
        return TRUE;
        }
    else
        {
        return FALSE;
        }
}
