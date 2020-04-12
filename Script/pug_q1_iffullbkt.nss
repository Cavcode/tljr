//::///////////////////////////////////////////////
//:: FileName pug_q1_iffullbkt
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 22/05/2009 5:09:12 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "pug_q1_fullbucke"))
        return FALSE;

    return TRUE;
}
