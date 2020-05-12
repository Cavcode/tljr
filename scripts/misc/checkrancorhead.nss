//::///////////////////////////////////////////////
//:: FileName checkimperial
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 4/1/2010 9:38:56 AM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "RancorsHead"))
        return FALSE;

    return TRUE;
}
