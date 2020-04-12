int StartingConditional()
{
    if(!(GetLocalInt(GetPCSpeaker(), "BOUNTY_16")> 0))
        return FALSE;

    return TRUE;
}
