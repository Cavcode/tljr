int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "QUEST_JUNK") == 5))
        return FALSE;

    return TRUE;
}
