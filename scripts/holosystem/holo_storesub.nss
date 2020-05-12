void main()
{
    string CHANNEL = GetLocalString(OBJECT_SELF, "CHANNEL");
    string sSub1 = GetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_1");
    string sSub2 = GetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_2");
    string sSub3 = GetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_3");
    string sSub4 = GetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_4");
    string sSub5 = GetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_5");
    string sSub6 = GetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_6");
    string sSub7 = GetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_7");
    string sSub8;

    string sMessage = GetLocalString(OBJECT_SELF, "MESSAGE");

    if (sMessage == "")
        {
            sMessage = "Unnamed message";
        }

    //object oListener = GetNearestObjectByTag("holo_listen", OBJECT_SELF, 1);

    SetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_1", sMessage+" - "+GetName(GetPCSpeaker()));
    SetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_2", sSub1);
    SetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_3", sSub2);
    SetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_4", sSub3);
    SetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_5", sSub4);
    SetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_6", sSub5);
    SetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_7", sSub6);
    SetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_8", sSub7);

    SetLocalString(OBJECT_SELF, "MESSAGE", "");
}
