int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalString(GetPCSpeaker(), "DIPLO_MISSION") == "SUCCEED"))
        return FALSE;

    return TRUE;
}
