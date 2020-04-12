int StartingConditional()
{
    if(!(GetLocalInt(OBJECT_SELF, "HAK_ATTEMPTS") == 1))
        return FALSE;

    return TRUE;
}
