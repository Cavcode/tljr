void main()
{
    string CHANNEL = GetLocalString(OBJECT_SELF, "CHANNEL");
    string sMSG1 = GetCampaignString("starwars", "HOLONET_"+CHANNEL+"_1");
    string sMSG2 = GetCampaignString("starwars", "HOLONET_"+CHANNEL+"_2");
    string sMSG3 = GetCampaignString("starwars", "HOLONET_"+CHANNEL+"_3");
    string sMSG4 = GetCampaignString("starwars", "HOLONET_"+CHANNEL+"_4");
    string sMSG5 = GetCampaignString("starwars", "HOLONET_"+CHANNEL+"_5");
    string sMSG6 = GetCampaignString("starwars", "HOLONET_"+CHANNEL+"_6");
    string sMSG7 = GetCampaignString("starwars", "HOLONET_"+CHANNEL+"_7");
    string sMSG8;

    object oListener = GetNearestObjectByTag("holo_listen", OBJECT_SELF, 1);
    string sMessage = GetLocalString(OBJECT_SELF, "MESSAGE");
    string sHolo1 = GetCampaignString("starwars", "HOLOGRAM_"+CHANNEL+"_1");
    string sHolo2 = GetCampaignString("starwars", "HOLOGRAM_"+CHANNEL+"_2");
    string sHolo3 = GetCampaignString("starwars", "HOLOGRAM_"+CHANNEL+"_3");
    string sHolo4 = GetCampaignString("starwars", "HOLOGRAM_"+CHANNEL+"_4");
    string sHolo5 = GetCampaignString("starwars", "HOLOGRAM_"+CHANNEL+"_5");
    string sHolo6 = GetCampaignString("starwars", "HOLOGRAM_"+CHANNEL+"_6");
    string sHolo7 = GetCampaignString("starwars", "HOLOGRAM_"+CHANNEL+"_7");
    string sHolo8;

    SetCampaignString("starwars", "HOLONET_"+CHANNEL+"_1", sMessage);
    SetCampaignString("starwars", "HOLONET_"+CHANNEL+"_2", sMSG1);
    SetCampaignString("starwars", "HOLONET_"+CHANNEL+"_3", sMSG2);
    SetCampaignString("starwars", "HOLONET_"+CHANNEL+"_4", sMSG3);
    SetCampaignString("starwars", "HOLONET_"+CHANNEL+"_5", sMSG4);
    SetCampaignString("starwars", "HOLONET_"+CHANNEL+"_6", sMSG5);
    SetCampaignString("starwars", "HOLONET_"+CHANNEL+"_7", sMSG6);
    SetCampaignString("starwars", "HOLONET_"+CHANNEL+"_8", sMSG7);

    StoreCampaignObject("starwars", "HOLOGRAM_"+GetName(GetPCSpeaker()), GetPCSpeaker());

    SetCampaignString("starwars", "HOLOGRAM_"+CHANNEL+"_1", GetName(GetPCSpeaker()));
    SetCampaignString("starwars", "HOLOGRAM_"+CHANNEL+"_2", sHolo1);
    SetCampaignString("starwars", "HOLOGRAM_"+CHANNEL+"_3", sHolo2);
    SetCampaignString("starwars", "HOLOGRAM_"+CHANNEL+"_4", sHolo3);
    SetCampaignString("starwars", "HOLOGRAM_"+CHANNEL+"_5", sHolo4);
    SetCampaignString("starwars", "HOLOGRAM_"+CHANNEL+"_6", sHolo5);
    SetCampaignString("starwars", "HOLOGRAM_"+CHANNEL+"_7", sHolo6);
    SetCampaignString("starwars", "HOLOGRAM_"+CHANNEL+"_8", sHolo7);

    SetLocalString(OBJECT_SELF, "MESSAGE", "");

    DestroyObject(oListener);
}
