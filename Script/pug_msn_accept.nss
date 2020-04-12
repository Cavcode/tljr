#include "x0_i0_partywide"
void main()
{
object oPC = GetPCSpeaker();
int nPlanet = GetLocalInt(OBJECT_SELF, "MISSION_PLANET");
SetLocalIntOnAll(oPC, "MISSION_PLANET", nPlanet);
FloatingTextStringOnCreature("Mission Accepted", oPC, TRUE);
}
