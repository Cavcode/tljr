int StartingConditional()
{
    if(!(GetLocalInt(GetPCSpeaker(), "BOUNTY_10")> 0))
        return FALSE;

    return TRUE;
}
