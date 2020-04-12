int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalString(GetPCSpeaker(), "DIPLO_MISSION") == GetTag(OBJECT_SELF)))
        return FALSE;

    return TRUE;
}
