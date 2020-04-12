//::///////////////////////////////////////////////
//:: FileName grey_isempire
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 18/08/2008 8:44:58 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "GalaticEmpireID"))
        return FALSE;

    return TRUE;
}
