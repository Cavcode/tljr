#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(HasItem(GetPCSpeaker(), "BountyHunterBadge"))
        return FALSE;
    if(HasItem(GetPCSpeaker(), "FringeID"))
        return FALSE;
    if(HasItem(GetPCSpeaker(), "StormtrooperBadge"))
        return FALSE;
    if(HasItem(GetPCSpeaker(), "TraderBadge"))
        return FALSE;

    return TRUE;
}
