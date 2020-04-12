//::///////////////////////////////////////////////
//:: FileName qx_convo_tool_c2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/4/2008 3:38:46 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Restrict based on the player's class
    int iPassed = 0;
    if(GetLevelByClass(CLASS_TYPE_MONK, GetPCSpeaker()) >= 6)
        iPassed = 1;
    if(iPassed == 0)
        return FALSE;

    return TRUE;
}
