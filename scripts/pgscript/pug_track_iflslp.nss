int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(OBJECT_SELF, "RACE_MAXLAP") > 1))
        return FALSE;

    return TRUE;
}
