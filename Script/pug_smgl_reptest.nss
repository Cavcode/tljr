void main()
{
    string sBuyer = GetStringRight(GetTag(OBJECT_SELF), 5);
    int nRep = GetCampaignInt("starwars", "REPUTATION_"+sBuyer, GetPCSpeaker());

    SendMessageToPC(GetPCSpeaker(), sBuyer+" : "+IntToString(nRep));
}
