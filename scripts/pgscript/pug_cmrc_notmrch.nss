int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalString(GetPCSpeaker(), "CMRC_SUBJECT") != "MERCH"))
        return FALSE;

    return TRUE;
}
