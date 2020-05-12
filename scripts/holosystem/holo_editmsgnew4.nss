void main()
{
    int nMsg = 4 ;
    string sMsg = IntToString(nMsg);
    string CHANNEL = GetLocalString(OBJECT_SELF, "CHANNEL");
    object oListener = GetNearestObjectByTag("holo_listen", OBJECT_SELF, 1);
    string sMessage = GetLocalString(OBJECT_SELF, "MESSAGE");

    SetCampaignString("starwars", "HOLONET_"+CHANNEL+"_"+sMsg, sMessage);

    SetCampaignString("starwars", "HOLOGRAM_"+CHANNEL+"_"+sMsg, GetName(GetPCSpeaker()));
    StoreCampaignObject("starwars", "HOLOGRAM_"+GetName(GetPCSpeaker()), GetPCSpeaker());

    DestroyObject(oListener);
}
