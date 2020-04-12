//::///////////////////////////////////////////////
//:: FileName pug_voc_isjedi
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 07/02/2008 2:03:12 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalString(GetPCSpeaker(), "SETVOCATION") == "JEDI"))

    if(!(GetLocalString(GetPCSpeaker(), "SETVOCATION") == "SPACE"))
        return FALSE;

    return TRUE;
}
