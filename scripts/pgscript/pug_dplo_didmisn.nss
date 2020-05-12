#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "pug_ngo_contract"))
        return TRUE;

    return FALSE;
}
