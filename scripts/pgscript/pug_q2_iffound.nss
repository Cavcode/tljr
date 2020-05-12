int StartingConditional()
{
    int nThisQuest = GetLocalInt(OBJECT_SELF, "QUEST");
    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "Q2_FOUND") == TRUE))
        return FALSE;

    return TRUE;
}
