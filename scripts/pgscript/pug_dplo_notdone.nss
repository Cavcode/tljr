int StartingConditional()
{

    // Inspect local variables
    if(GetLocalString(GetPCSpeaker(), "DIPLO_MISSION") == "SUCCEED")
        return FALSE;
    if(GetLocalString(GetPCSpeaker(), "DIPLO_MISSION") == "FAIL")
        return FALSE;

    return TRUE;
}
