//::///////////////////////////////////////////////
//:: FileName holo_istrooper
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Pugnius
//:: Created On: 29/01/2008 9:58:05 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "StormtrooperBadge"))
        return FALSE;

    return TRUE;
}
