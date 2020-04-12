#include "pug_inc"
int StartingConditional()
{
    object oPlanet = GetLocalObject(GetPCSpeaker(), "COM_PLANET");

    if (GetStringLeft(GetTag(oPlanet), 5) == "PL_S_" && GetIsObjectValid(GetWaypointByTag("PL_L_"+GetStringRight(GetTag(oPlanet), GetStringLength(GetTag(oPlanet))-5)))== TRUE && GetFaction(GetPCSpeaker(), TRUE) == GetNPCFaction(oPlanet))
        {return TRUE;}
    else if (GetStringLeft(GetTag(oPlanet), 5) == "PL_S_" && GetIsObjectValid(GetWaypointByTag("PL_L_"+GetStringRight(GetTag(oPlanet), GetStringLength(GetTag(oPlanet))-5)))== TRUE && GetLocalInt(oPlanet, "BOARDABLE") == TRUE)
        {return TRUE;}
    else{return FALSE;}
}
