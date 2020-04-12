int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalString(GetPCSpeaker(), "SETVOCATION") == "BOUNTY"))
        return FALSE;
    return TRUE;
}
