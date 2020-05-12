int StartingConditional()
{
    string sLevel = GetStringRight(GetTag(OBJECT_SELF), 2);
    if(!(GetLocalString(GetPCSpeaker(), "TARGET_"+sLevel) == GetName(OBJECT_SELF)))
        return FALSE;

    return TRUE;
}
