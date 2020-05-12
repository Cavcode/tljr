#include "nw_i0_tool"
void main()
{
    if(GetLocalInt(GetPCSpeaker(),"bucket") == 1)
        SetLocalInt(GetPCSpeaker(),"bucket", 0);
    if(HasItem(GetPCSpeaker(), "pug_q1_bucket"))
        return;
    if(HasItem(GetPCSpeaker(), "pug_q1_fullbucke"))
        return;
    // Give the speaker the items
    CreateItemOnObject("pug_q1_bucket", GetPCSpeaker(), 1);

}
