int StartingConditional()
{
    object oCommander = GetLocalObject(OBJECT_SELF, "LEADER");

    if (oCommander == GetPCSpeaker())
    {return TRUE;}

    else return FALSE;
}
