int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "QUEST_WINGS") == 5))
        return FALSE;

    return TRUE;
}
