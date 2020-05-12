int StartingConditional()
{
    string CHANNEL = GetLocalString(OBJECT_SELF, "CHANNEL");
    string sMSG = GetCampaignString("starwars", "HOLONET_"+CHANNEL+"_3");

    if (sMSG == "")
        {
            return FALSE;
        }

    else return TRUE;
}
