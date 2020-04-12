//void main() {}

void StartMissionDefendedObject(object oMaster, int nPlanet, string sPlace, string sResRef, string sSoldier, int nNum)
{
    object oTarget = CreateObject(OBJECT_TYPE_PLACEABLE, sResRef, GetLocation(GetWaypointByTag("MISSION_TARGET_"+sPlace)), FALSE);
    if (GetIsObjectValid(oTarget) == FALSE)
        {
        oTarget = CreateObject(OBJECT_TYPE_CREATURE, sResRef, GetLocation(GetWaypointByTag("MISSION_TARGET_"+sPlace)), FALSE);
        }
    SetLocalInt(oMaster, "MISSION_PLANET", nPlanet);
    SetLocalObject(oMaster, "MISSION_TARGET", oTarget);

    location lSpawn = GetLocation(GetWaypointByTag("MISSION_DEFENSE_"+sPlace));
    int x = 1;
    while (x<nNum)
        {
        CreateObject(OBJECT_TYPE_CREATURE, sSoldier, lSpawn, FALSE, "mission_"+sPlace+"_"+IntToString(x));
        x++;
        }
}

void StartMissionInSpace(object oMaster, int nPlanet, string sPlace, string sResRef)
{
    object oTarget = CreateObject(OBJECT_TYPE_PLACEABLE, sResRef, GetLocation(GetWaypointByTag("MISSION_TARGET_"+sPlace)), FALSE);
    if (GetIsObjectValid(oTarget) == FALSE)
        {
        oTarget = CreateObject(OBJECT_TYPE_CREATURE, sResRef, GetLocation(GetWaypointByTag("PL_S_"+IntToString(nPlanet))), FALSE);
        }
    SetLocalInt(oMaster, "MISSION_PLANET", nPlanet);
    SetLocalObject(oMaster, "MISSION_TARGET", oTarget);
}


void ClearMissionArea(object oArea)
{
object oNPC = GetFirstObjectInArea(oArea);

while (GetIsObjectValid(oNPC) == TRUE)
    {
    if (GetObjectType(oNPC) == OBJECT_TYPE_CREATURE && GetStringLeft(GetTag(oNPC), 8) == "mission_")
        {
        DestroyObject(oNPC);
        }
    oNPC = GetNextObjectInArea(oArea);
    }
}
