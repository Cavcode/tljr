int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "Q2_STARTED") == 1))
        return FALSE;

    return TRUE;
}
