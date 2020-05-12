int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "QUEST_SMUGGLERS") == 5))
        return FALSE;

    return TRUE;
}
