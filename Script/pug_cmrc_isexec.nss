int StartingConditional()
{
    if(!(GetCampaignInt("cmrcgld", "CMRC_RANK", GetPCSpeaker()) > 2) && GetIsDM(GetPCSpeaker()) == FALSE)
        return FALSE;

    return TRUE;
}
