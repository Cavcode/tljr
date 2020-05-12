#include "NW_O2_CONINCLUDE"
#include "NW_I0_GENERIC"
#include "pug_inc"

void main()
{
    EquipHenchman(OBJECT_SELF);
    string sTag = GetTag(OBJECT_SELF);

    //ActionRandomWalk();

        CreateItemOnObject("smallpowerpak", OBJECT_SELF,99);

        CreateItemOnObject("smallpowercell", OBJECT_SELF,99);

        CreateItemOnObject("dualsmallpowerpa", OBJECT_SELF,99);

        CreateItemOnObject("smallpowerpak", OBJECT_SELF,99);

        CreateItemOnObject("smallpowercell", OBJECT_SELF,99);

        CreateItemOnObject("dualsmallpowerpa", OBJECT_SELF,99);

    if (sTag == "rebel_soldier")
    {
        LastName(OBJECT_SELF);
        SetName(OBJECT_SELF, GetLocalString(OBJECT_SELF, "LAST_NAME"));
        ChangeFaction(OBJECT_SELF, GetObjectByTag("faction_rebels", 1));
    }
    if (sTag == "empire_soldier")
    {
        LastName(OBJECT_SELF);
        SetName(OBJECT_SELF, GetLocalString(OBJECT_SELF, "LAST_NAME"));
        ChangeFaction(OBJECT_SELF, GetObjectByTag("faction_empire", 1));
    }
// DEFAULT GENERIC BEHAVIOR (DO NOT TOUCH) *****************************************************************************************
   SetListeningPatterns ();    // Goes through and sets up which shouts the NPC will listen to.
    //WalkWayPoints();           // Optional Parameter: void WalkWayPoints(int nRun = FALSE, float fPause = 1.0)
                               // 1. Looks to see if any Way Points in the module have the tag "WP_" + NPC TAG + "_0X", if so walk them
                               // 2. If the tag of the Way Point is "POST_" + NPC TAG the creature will return this way point after
                               //    combat.
    GenerateNPCTreasure();     //* Use this to create a small amount of treasure on the creature
}
