int StartingConditional()
{
    if(!(GetLocalInt(GetPCSpeaker(), "BOUNTY_22")> 0))
        return FALSE;

    return TRUE;
}
