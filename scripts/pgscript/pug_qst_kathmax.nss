int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "QUEST_KATH") == 5))
        return FALSE;

    return TRUE;
}
