int StartingConditional()
{
    if(!(GetLocalInt(GetPCSpeaker(), "BOUNTY_10")+GetLocalInt(GetPCSpeaker(), "BOUNTY_16")+GetLocalInt(GetPCSpeaker(), "BOUNTY_22")+GetLocalInt(GetPCSpeaker(), "BOUNTY_28")+GetLocalInt(GetPCSpeaker(), "BOUNTY_34") != 0))
        return FALSE;

    return TRUE;
}
