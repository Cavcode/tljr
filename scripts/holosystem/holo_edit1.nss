void main()
{
    int nMsg = 1;
    string CHANNEL = GetLocalString(OBJECT_SELF, "CHANNEL");

    string sMessage = GetLocalString(OBJECT_SELF, "MESSAGE");

    SetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_"+IntToString(nMsg), sMessage);

    SetLocalString(OBJECT_SELF, "MESSAGE", "");
}
