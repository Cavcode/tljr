//::///////////////////////////////////////////////
//:: FileName holo_ishunter
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Pugnius
//:: Created On: 29/01/2008 9:59:35 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "BountyHunterGuildBadge"))
        return FALSE;

    return TRUE;
}
