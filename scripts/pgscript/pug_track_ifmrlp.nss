int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(OBJECT_SELF, "RACE_MAXLAP") < 5))
        return FALSE;

    return TRUE;
}
