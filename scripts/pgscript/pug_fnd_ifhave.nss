#include "nw_i0_tool"

int StartingConditional()
{
    string sItem = GetLocalString(OBJECT_SELF, "WANTED");

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), sItem))
        return FALSE;

    return TRUE;
}
