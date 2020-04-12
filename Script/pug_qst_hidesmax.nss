int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "QUEST_HIDES") == 5))
        return FALSE;

    return TRUE;
}
