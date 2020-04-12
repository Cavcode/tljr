int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(OBJECT_SELF, "RACE_BUSY") > 0))
        return FALSE;

    return TRUE;
}
