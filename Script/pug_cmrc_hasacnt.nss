int StartingConditional()
{
int nAccount = GetCampaignInt("cmrcgld", "ACCOUNT_"+GetTag(OBJECT_SELF));
    // Inspect local variables
    if(!(nAccount > 0))
        return FALSE;

    return TRUE;
}
