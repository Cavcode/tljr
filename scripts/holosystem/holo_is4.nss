int StartingConditional()
{
    string CHANNEL = GetLocalString(OBJECT_SELF, "CHANNEL");
    string sMSG = GetCampaignString("starwars", "HOLONET_"+CHANNEL+"_4");

    if (sMSG == "")
        {
            return FALSE;
        }

    else return TRUE;
}
