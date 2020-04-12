//::///////////////////////////////////////////////
//:: FileName qx_conv_tool_c1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/4/2008 3:30:48 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Restrict based on the player's class
    int iPassed = 0;
    if(GetLevelByClass(CLASS_TYPE_MONK, GetPCSpeaker()) >= 1)
        iPassed = 1;
    if((iPassed == 0) && (GetLevelByClass(CLASS_TYPE_WEAPON_MASTER, GetPCSpeaker()) >= 1))
        iPassed = 1;
    if(iPassed == 0)
        return FALSE;

    return TRUE;
}
