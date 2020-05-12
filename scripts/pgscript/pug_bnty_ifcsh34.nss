int StartingConditional()
{
    if(!(GetLocalInt(GetPCSpeaker(), "BOUNTY_34")> 0))
        return FALSE;

    return TRUE;
}
