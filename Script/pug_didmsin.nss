int StartingConditional()
{
    int nDone = FALSE;
    if(GetLocalString(GetPCSpeaker(), "DIPLO_MISSION") == "SUCCEED")
        {
        nDone = TRUE;
        }
    if(GetLocalString(GetPCSpeaker(), "DIPLO_MISSION") == "FAIL")
        {
        nDone = TRUE;
        }
    // Inspect local variables
    if(!(nDone == TRUE))
        return FALSE;

    return TRUE;
}
