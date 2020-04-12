//::///////////////////////////////////////////////
//:: Name x2_def_onconv
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On Conversation script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    /////// add so that well do nothing else during the open door action
    object oSelf = OBJECT_SELF;
    int bTaskDone = GetLocalInt(oSelf,"gy_Task");
    if (bTaskDone==1) return;
    /////////////////////////////////////////////////////////////////////
    ExecuteScript("nw_c2_default4", OBJECT_SELF);
}
