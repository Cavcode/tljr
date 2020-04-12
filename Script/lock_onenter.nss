//**///////////////////////////////////////////////////////////////////////////
//** LOCK!NESS v1.02 - onEnter script
//**///////////////////////////////////////////////////////////////////////////
//**
//** This script must be installed on the onEnter event. Do NOT forget to
//** assign the "lock_onexit" script to the onExit event !!!
//**
//**///////////////////////////////////////////////////////////////////////////
//** Last modification: 08/06/2005
//** Created by Firya'nis & Ex Tempus.
//**///////////////////////////////////////////////////////////////////////////

#include "lock_inc"
#include "pug_inc"

void main()
{
    object oPC = GetEnteringObject();

    // Only if the entering creature is a PC or DM.
    if (GetIsPC(oPC) || GetIsDMPossessed(oPC) || GetIsDM(oPC))
    {
        // Stop the timer so the despawn won't occurs.
        SetLocalInt(OBJECT_SELF, "LOCK_TIMER", -1);

        float fSpawnDelay = 0.0;
        int nNth = 1;
        object oTarget = GetFirstObjectInArea(OBJECT_SELF);
        object oObject;

        // Find out the first LOCK WP.
        if (GetStringLeft(GetTag(oTarget), 5) != "LOCK_")
             oObject = GetNearestObject(OBJECT_TYPE_WAYPOINT, oTarget, nNth);
        else
        {
            oObject = oTarget;
            nNth = 0;            // Corrected on 08/02/2005 by Firya'nis.
        }

        int iSpawn = GetLocalInt(OBJECT_SELF, "LOCK_SPAWN_ENTER");

        while (GetIsObjectValid(oObject) && iSpawn != 1)
        {
            string sObject = GetStringLeft(GetTag(oObject), 5);
            if (sObject == "LOCK_")
            {
                // Get information about this WP.
                location lLoc = GetLocation(oObject);
                string sWP    = GetTag(oObject);
                int iWP       = GetStringLength(sWP);
                iWP = iWP - 5;
                string sTAG   = GetStringRight(sWP, iWP);

                // Get the variables on the WP.
                int PLC         = GetLocalInt(oObject, "PLC");
                int ITEM        = GetLocalInt(oObject, "ITEM");
                int RW          = GetLocalInt(oObject, "RW");
                int SD          = GetLocalInt(oObject, "SD");
                int AA          = GetLocalInt(oObject, "AA");
                string NEWTAG   = GetLocalString(oObject, "NEWTAG");
                string AUTOCONV = GetLocalString(oObject, "AUTOCONV");

                if (PLC == 1)       // Is it a placeable ?
                    DelayCommand(fSpawnDelay, LOCK_SpawnPlaceable(lLoc, sTAG, NEWTAG));
                else if (ITEM == 1) // Is it an item ?
                    DelayCommand(fSpawnDelay, LOCK_SpawnObject(oPC, lLoc, sTAG, NEWTAG));
                else                // So... it should be a creature !
                    DelayCommand(fSpawnDelay, LOCK_SpawnCreature(RW, SD, AA, lLoc, sTAG, NEWTAG, AUTOCONV));
                fSpawnDelay += 0.4; // To define an interval between all spawns.
            }
            nNth ++;
            oObject = GetNearestObject(OBJECT_TYPE_WAYPOINT, oTarget, nNth);
        }

        // We confirm the spawn has been done.
        SetLocalInt(OBJECT_SELF, "LOCK_SPAWN_ENTER", 1);

    //This will set any opposite faction members to hate you and vice versa
    PCFactions(oPC, GetFaction(oPC, TRUE), "");

    }
}
