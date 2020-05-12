//**///////////////////////////////////////////////////////////////////////////
//** LOCK!NESS v1.02 - onExit script
//**///////////////////////////////////////////////////////////////////////////
//**
//** This script must be installed on the onExit event. Do NOT forget to
//** assign the "lock_onenter" script to the onEnter event !!!
//**
//**///////////////////////////////////////////////////////////////////////////
//** Last modification: 08/01/2005
//** Created by Firya'nis & Ex Tempus.
//**///////////////////////////////////////////////////////////////////////////

#include "lock_inc"
#include "pug_inc"

void main()
{
    object oArea = OBJECT_SELF;
    object oPC = GetExitingObject();
    int TIMER = GetLocalInt(oArea, "LOCK_TIMER");

    // S'active uniquement si la creature qui sort est un DM ou un PJ.
    if (GetIsPC(oPC))
    {
        location lLoc = Location(OBJECT_SELF, Vector(0.0, 0.0, 0.0), 0.0); // Point 0 dans la zone
        object oMore = GetNearestCreatureToLocation(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, lLoc);
        if (oMore == oPC) oMore = GetNearestCreatureToLocation(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, lLoc, 2);
        float fDelay = 60.0; // 60 secondes * 5 = 5 mins

        LOCK_Debug("********* Lock_onexit lancé... **********");

        // S'active uniquement s'il ne reste plus de joueur dans la zone.
        if (oMore == OBJECT_INVALID || GetArea(oMore) != OBJECT_SELF) // comme ca on est vraiment sur... <_<
        {
            if (TIMER <= 0){  // -1 ou 0 -> on lance le TIMER
                LOCK_InitCleaningTimer(oArea, fDelay);
            }
            else {            // sinon, le TIMER est deja lance, donc on le remet a 0
                LOCK_ResetCleaningTimer(oArea);
            }

        }

    //This will reset the PC to neutral to all other PCs
    SetPCNeutral(oPC);

    } // Fin GetIsPC(oPC)
}


