int StartingConditional()
{
    if(!(GetLocalInt(GetPCSpeaker(), "BOUNTY_28")> 0))
        return FALSE;

    return TRUE;
}
