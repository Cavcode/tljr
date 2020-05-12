int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "MISSION_COMPLETE") == 0))
        return FALSE;

    return TRUE;
}
