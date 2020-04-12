//::///////////////////////////////////////////////
//:: Default: On Spawn In
//:: KPB_BANKER_SPAWN
//:://////////////////////////////////////////////
/*
    Custom OnSpawn Script for KPB Banker
*/
//:://////////////////////////////////////////////
//:: Modified By: Brian J. Kittrell
//:: Modified On: 19-2-2004
//:://////////////////////////////////////////////
#include "NW_O2_CONINCLUDE"
#include "NW_I0_GENERIC"

void main()
{
    SetListenPattern(OBJECT_SELF, "**deposit ** gold**", 20);
    SetListenPattern(OBJECT_SELF, "**withdraw ** gold**", 21);
    SetListenPattern(OBJECT_SELF, "**balance**", 22);
    SetListenPattern(OBJECT_SELF, "**withdraw all**", 23);
    SetListenPattern(OBJECT_SELF, "**deposit all**", 24);
    SetListening(OBJECT_SELF, TRUE);

// DEFAULT GENERIC BEHAVIOR (DO NOT TOUCH) *****************************************************************************************
    SetListeningPatterns();    // Goes through and sets up which shouts the NPC will listen to.
    WalkWayPoints();           // Optional Parameter: void WalkWayPoints(int nRun = FALSE, float fPause = 1.0)
                               // 1. Looks to see if any Way Points in the module have the tag "WP_" + NPC TAG + "_0X", if so walk them
                               // 2. If the tag of the Way Point is "POST_" + NPC TAG the creature will return this way point after
                               //    combat.
    GenerateNPCTreasure();     //* Use this to create a small amount of treasure on the creature
}


