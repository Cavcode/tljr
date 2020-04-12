int StartingConditional()
{
    if(!(GetLocalInt(GetPCSpeaker(), "MISSION_COMPLETE") == 2))
        return FALSE;

    return TRUE;
}
