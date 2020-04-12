int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "QUEST_RECIPE") == 5))
        return FALSE;

    return TRUE;
}
