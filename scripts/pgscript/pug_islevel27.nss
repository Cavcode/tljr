//::///////////////////////////////////////////////
//:: FileName pug_islevel17
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 13/02/2008 3:34:53 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Restrict based on the player's class
    int iPassed = 0;
    if(GetHitDice(GetPCSpeaker()) >= 27)
        iPassed = 1;
    if(iPassed == 0)
        return FALSE;

    return TRUE;
}
