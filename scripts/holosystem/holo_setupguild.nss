void main()
{
string CHANNEL = "GUILD";

SetLocalString(OBJECT_SELF, "CHANNEL", CHANNEL);
string sSub1 = GetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_1");
string sSub2 = GetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_2");
string sSub3 = GetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_3");
string sSub4 = GetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_4");
string sSub5 = GetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_5");
string sSub6 = GetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_6");
string sSub7 = GetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_7");
string sSub8 = GetCampaignString("starwars", "HOLONET_SUB"+CHANNEL+"_8");

string sMSG1 = GetCampaignString("starwars", "HOLONET_"+CHANNEL+"_1");
string sMSG2 = GetCampaignString("starwars", "HOLONET_"+CHANNEL+"_2");
string sMSG3 = GetCampaignString("starwars", "HOLONET_"+CHANNEL+"_3");
string sMSG4 = GetCampaignString("starwars", "HOLONET_"+CHANNEL+"_4");
string sMSG5 = GetCampaignString("starwars", "HOLONET_"+CHANNEL+"_5");
string sMSG6 = GetCampaignString("starwars", "HOLONET_"+CHANNEL+"_6");
string sMSG7 = GetCampaignString("starwars", "HOLONET_"+CHANNEL+"_7");
string sMSG8 = GetCampaignString("starwars", "HOLONET_"+CHANNEL+"_8");;

if (sMSG1 == "") { sSub1 = "No message"; DeleteCampaignVariable("starwars", "HOLOGRAM_"+CHANNEL+"_1");}
if (sMSG2 == "") { sSub2 = "No message"; DeleteCampaignVariable("starwars", "HOLOGRAM_"+CHANNEL+"_2");}
if (sMSG3 == "") { sSub3 = "No message"; DeleteCampaignVariable("starwars", "HOLOGRAM_"+CHANNEL+"_3");}
if (sMSG4 == "") { sSub4 = "No message"; DeleteCampaignVariable("starwars", "HOLOGRAM_"+CHANNEL+"_4");}
if (sMSG5 == "") { sSub5 = "No message"; DeleteCampaignVariable("starwars", "HOLOGRAM_"+CHANNEL+"_5");}
if (sMSG6 == "") { sSub6 = "No message"; DeleteCampaignVariable("starwars", "HOLOGRAM_"+CHANNEL+"_6");}
if (sMSG7 == "") { sSub7 = "No message"; DeleteCampaignVariable("starwars", "HOLOGRAM_"+CHANNEL+"_7");}
if (sMSG8 == "") { sSub8 = "No message"; DeleteCampaignVariable("starwars", "HOLOGRAM_"+CHANNEL+"_8");}

SetCustomToken(199040, sSub1);
SetCustomToken(199041, sSub2);
SetCustomToken(199042, sSub3);
SetCustomToken(199043, sSub4);
SetCustomToken(199044, sSub5);
SetCustomToken(199045, sSub6);
SetCustomToken(199046, sSub7);
SetCustomToken(199047, sSub8);

}
