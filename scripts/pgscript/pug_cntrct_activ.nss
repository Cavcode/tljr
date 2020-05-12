int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sContract = GetCampaignString("starwars", "CONTRACT", oPC);

    if(!(sContract == "Rebels"))

    if(!(sContract == "Empire"))
        return FALSE;

    return TRUE;
}
