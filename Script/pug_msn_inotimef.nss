int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(OBJECT_SELF, "MISSION_TIME") == 0))
        return FALSE;

    return TRUE;
}
