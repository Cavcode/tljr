int StartingConditional()
{
    int nThisQuest = GetLocalInt(OBJECT_SELF, "QUEST");
    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "Q"+IntToString(nThisQuest)+"_STARTED") == 1))
        return FALSE;

    return TRUE;
}
