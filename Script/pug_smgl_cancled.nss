int StartingConditional()
{
    if(!(GetLocalString(GetPCSpeaker(), "SMUGGLE_STOP") == GetTag(OBJECT_SELF)))
        return FALSE;

    return TRUE;
}
