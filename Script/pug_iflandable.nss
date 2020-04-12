int StartingConditional()
{
    object oPlanet = GetLocalObject(GetPCSpeaker(), "COM_PLANET");
    object oWP = GetNearestObject(OBJECT_TYPE_WAYPOINT, oPlanet, 1);
    if (GetDistanceBetween(oPlanet, oWP) > 10.0)
        {
        oWP = OBJECT_INVALID;
        }
    string sLanding = GetTag(oWP);
    string sNum;
    if (GetStringLength(sLanding)== 7){sNum = GetStringRight(sLanding, 2);}
    else if (GetStringLength(sLanding)== 6){sNum = GetStringRight(sLanding, 1);}
    if (GetStringLeft(sLanding, 3) == "PL_" && GetIsObjectValid(oWP) && GetIsObjectValid(GetWaypointByTag("PL_L_"+sNum))== TRUE && GetObjectType(oPlanet) == OBJECT_TYPE_PLACEABLE)
        {return TRUE;}
    else{return FALSE;}
}
