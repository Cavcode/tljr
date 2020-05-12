int StartingConditional()
{
    string sBuyer = GetStringRight(GetTag(OBJECT_SELF), 5);
    int nRep = GetCampaignInt("starwars", "REPUTATION_"+sBuyer, GetPCSpeaker());
    // Inspect local variables
    if(nRep == 10)
        return TRUE;

    else {return FALSE;}
}
