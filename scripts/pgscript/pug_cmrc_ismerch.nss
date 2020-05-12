int StartingConditional()
{
    if(!(GetCampaignInt("cmrcgld", "CMRC_RANK", GetPCSpeaker()) > 0) && GetIsDM(GetPCSpeaker()) == FALSE)
        return FALSE;

    return TRUE;
}
