int StartingConditional()
{
    if(!(GetCampaignInt("cmrcgld", "CMRC_RANK", GetPCSpeaker()) > 3 ))
        return FALSE;
    if(!(GetCampaignString("cmrcgld", "CMRC_PRESIDENT") == GetName(GetPCSpeaker())))
        return FALSE;

    return TRUE;
}
