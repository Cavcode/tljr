//::///////////////////////////////////////////////
//:: FileName pug_q3_looking
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 27/05/2009 11:56:41 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"
int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "Q4_STARTED") == 1) && HasItem(GetPCSpeaker(), "pug_q3_item")==FALSE)
        return FALSE;

    return TRUE;
}
