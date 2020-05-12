#include "x0_i0_partywide"
#include "pug_inc"
void main()
{
object oPC = GetPCSpeaker();

if (GetIsObjectValid(oPC) == TRUE)
    {
    SetLocalIntOnAll(oPC, "MISSION_COMPLETE", 2);
    FloatingTextStringOnCreature("Mission Failed", oPC, TRUE);
    }
int x=1;
object oDefend = GetNearestObject(OBJECT_TYPE_CREATURE, OBJECT_SELF, x);
while (GetIsObjectValid(oDefend) == TRUE && GetIsPC(oDefend) == TRUE)
    {
    x++;
    oDefend = GetNearestObject(OBJECT_TYPE_CREATURE, OBJECT_SELF, x);
    }
int y=1;
object oWP = GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, y);
while (GetStringLeft(GetTag(oWP), 16) != "MISSION_DEFENSE_" && GetIsObjectValid(oWP) == TRUE)
    {
    y++;
    oWP = GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, y);
    }
string sEnemy, sSoldier;
object oBackup;
int z = 5;
if (GetIsObjectValid(oDefend) == TRUE && GetIsPC(oDefend) == TRUE && GetDistanceBetween(oDefend, OBJECT_SELF) < 50.0)
    {
    oDefend = GetNearestObject(OBJECT_TYPE_CREATURE, OBJECT_SELF, x);
    if (GetFaction(oPC, TRUE) == "Rebels"){sEnemy = "Empire";sSoldier = "stormtrooper";}
    else if (GetFaction(oPC, TRUE) == "Empire"){sEnemy = "Rebels";sSoldier = "rebelsoldier";}
    AssignCommand(oDefend, ActionSpeakString("It's the "+sEnemy+"! Call for reinforcements!"));
    while (z>0)
        {
        oBackup = CreateObject(OBJECT_TYPE_CREATURE, sSoldier, GetLocation(oWP), FALSE, "mission_defense");
        AssignCommand(oBackup, ActionAttack(oPC, FALSE));
        z=z-1;
        }
    }
}
