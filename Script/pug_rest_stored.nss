int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalString(GetPCSpeaker(), "CURRENT_DESCRIPTION") != ""))
        return FALSE;

    return TRUE;
}
