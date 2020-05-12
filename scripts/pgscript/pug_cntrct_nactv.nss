int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sContract = GetCampaignString("starwars", "CONTRACT", oPC);

    if (sContract!= "Rebels" && sContract != "Empire")
    return TRUE;

    else return FALSE;
}
