#include "pug_inc"
#include "pug_msn_inc"
void main()
{
object oPC = GetPCSpeaker();
int nPlanetRoll = Random(12);
int nTargetRoll = Random(7);
int nPlanet = GetLocalInt(OBJECT_SELF, "MISSION_PLANET");
object oTarget = GetLocalObject(OBJECT_SELF, "MISSION_TARGET");
string sPlace, sMessage, sEnemy, sSoldier, sSpacePlace;
int nNum=0;
sMessage = GetLocalString(OBJECT_SELF, "MISSION_MESSAGE");
int nTime = GetLocalInt(OBJECT_SELF, "MISSION_TIME");
int nPass = FALSE;

//Not enough time has passed before the next mission
if (nTime == 1)
    {
    sMessage = "Not right now, but come back later and I might have something for you.";
    }

//This is if the mission is on a planet
else if (GetIsObjectValid(oTarget) == FALSE && nTime == 0)
    {
    if (GetFaction(oPC, TRUE) == "Rebels"){sEnemy = "Empire";sSoldier = "stormtrooper";}
    else if (GetFaction(oPC, TRUE) == "Empire"){sEnemy = "Rebels";sSoldier = "rebelsoldier";}

    while (nPass == FALSE)
        {
        if (nPlanetRoll >= 11){nPlanet = 27;sPlace = "RhenVar";nNum=7;}
        else if (nPlanetRoll <= 0){nPlanet = 11;sPlace = "Corellia";nNum=12;}
        else if (nPlanetRoll == 1){nPlanet = 25;sPlace = "Dagobah";nNum=11;}
        else if (nPlanetRoll == 2){nPlanet = 3;sPlace = "NarShaddaa";nNum=12;}
        else if (nPlanetRoll == 3){nPlanet = 2;sPlace = "Tatooine";nNum=13;}
        else if (nPlanetRoll == 4){nPlanet = 30;sPlace = "Corulag";nNum=12;}
        else if (nPlanetRoll == 5){nPlanet = 15;sPlace = "Iridonia";nNum=12;}
        else if (nPlanetRoll == 6){nPlanet = 6;sPlace = "Kashyyyk";nNum=13;}
        else if (nPlanetRoll == 7){nPlanet = 8;sPlace = "Korriban";nNum=12;}
        else if (nPlanetRoll == 8){nPlanet = 12;sPlace = "Naboo";nNum=12;}
        else if (nPlanetRoll == 9){nPlanet = 20;sPlace = "Cerea";nNum=12;}
        else if (nPlanetRoll == 10){nPlanet = 28;sPlace = "Felucia";nNum=12;}
        if(GetLocalInt(GetModule(), "MISSION_AREA_"+IntToString(nPlanet)) == FALSE)
            {
            nPass = TRUE;
            }
        else
            {
            nPlanetRoll = Random(12);
            }
        }
    SetLocalInt(GetModule(), "MISSION_AREA_"+IntToString(nPlanet), TRUE);
    ClearMissionArea(GetArea(GetWaypointByTag("MISSION_TARGET_"+sPlace)));
    if (nTargetRoll <= 1)
        {
        StartMissionDefendedObject(OBJECT_SELF, nPlanet, sPlace, "pug_target_com", sSoldier, nNum);
        sMessage = "A communications array has been built by the "+sEnemy+" on "+sPlace+". Assemble a team and destroy this array. For this mission, a keen knowledge of explosives will be an asset. Now if you're up to this mission, you'd better get going.";
        }
    else if (nTargetRoll == 2 )
        {
        StartMissionDefendedObject(OBJECT_SELF, nPlanet, sPlace, "pug_target_data", sSoldier, nNum);
        sMessage = "An intelligence report has identified an enemy computer terminal containing potentially vital information is located on the planet "+sPlace+". Assemble a team and recover the data on this computer. For this mission, an expertise in security will be a necessity. Now if you're up to this mission, you'd better get going.";
        }
    else if (nTargetRoll >= 3 && nTargetRoll <= 4)
        {
        StartMissionDefendedObject(OBJECT_SELF, nPlanet, sPlace, "pug_target_"+GetStringLeft(sSoldier, 4), sSoldier, nNum);
        sMessage = "Sources have allerted us that an officer of the "+sEnemy+" has taken a small force to "+sPlace+". Assemble a team and take out this officer. He himself will not be a tough target to take down, however it is highly recommended that the target is taken down from a distance in order to avoid attracting unwanted attention. Now if you're up to this mission, you'd better get going.";
        }
    //This is if it is a space mission
    else if (nTargetRoll >= 5)
        {
        StartMissionInSpace(OBJECT_SELF, nPlanet, sPlace, "pug_target_pirat");
        sMessage = "We have received reports of a pirate vessel attacking civilian ships in the region of space near "+sPlace+". Take a small attack force to find this vessel and destroy it. Proceed with caution however, as we do not know the weapons capability of this target.";
        }

    SetLocalString(OBJECT_SELF, "MISSION_MESSAGE", sMessage);
    }
SetCustomToken(6577900,sMessage);
}
