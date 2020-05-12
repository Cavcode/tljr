int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "QUEST_SNAKES") == 5))
        return FALSE;

    return TRUE;
}
