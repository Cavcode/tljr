#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC doesn't have any buckets, full or empty
    if(HasItem(GetPCSpeaker(), "pug_q1_bucket"))
        return FALSE;
    if(HasItem(GetPCSpeaker(), "pug_q1_fullbucke"))
        return FALSE;

    return TRUE;
}
