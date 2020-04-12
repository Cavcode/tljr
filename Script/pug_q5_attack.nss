//::///////////////////////////////////////////////
//:: FileName pug_q5_attack
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 24/05/2009 10:55:50 PM
//:://////////////////////////////////////////////
#include "nw_i0_generic"

void main()
{
    object oPC = GetPCSpeaker();
    // Set the faction to hate the player, then attack the player
    ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);
    SetLocalInt(oPC, "Q5_FOUND", TRUE);
}
