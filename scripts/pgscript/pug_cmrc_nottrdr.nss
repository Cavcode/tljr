int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalString(GetPCSpeaker(), "CMRC_SUBJECT") != "TRADER"))
        return FALSE;

    return TRUE;
}
