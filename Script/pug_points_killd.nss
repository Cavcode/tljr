void main()
{
string sBoard = "POINTS_KIL";

string sLeader, sLeader2, sLeader3, sLeader4, sLeader5;
string sMsg = "";
int nLeaderTotal, nLeaderPlanet, nLeaderKill;
int nLeaderTotal2, nLeaderPlanet2, nLeaderKill2;
int nLeaderTotal3, nLeaderPlanet3, nLeaderKill3;
int nLeaderTotal4, nLeaderPlanet4, nLeaderKill4;
int nLeaderTotal5, nLeaderPlanet5, nLeaderKill5;

    sLeader = GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_1");
    nLeaderTotal = GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_1");
    nLeaderPlanet = GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_1");
    nLeaderKill = GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_1");

    sLeader2 = GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_2");
    nLeaderTotal2 = GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_2");
    nLeaderPlanet2 = GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_2");
    nLeaderKill2 = GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_2");

    sLeader3 = GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3");
    nLeaderTotal3 = GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3");
    nLeaderPlanet3 = GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3");
    nLeaderKill3 = GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3");

    sLeader4 = GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4");
    nLeaderTotal4 = GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4");
    nLeaderPlanet4 = GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4");
    nLeaderKill4 = GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4");

    sLeader5 = GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_5");
    nLeaderTotal5 = GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_5");
    nLeaderPlanet5 = GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_5");
    nLeaderKill5 = GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_5");

sMsg += "Rank)Name: Total Points / Planet Conquering Points / Kill Points";
sMsg += "1)"+sLeader+": "+IntToString(nLeaderTotal)+" / "+IntToString(nLeaderPlanet)+" / "+IntToString(nLeaderKill)+", ";
sMsg = sMsg + "2)"+sLeader2+": "+IntToString(nLeaderTotal2)+" / "+IntToString(nLeaderPlanet2)+" / "+IntToString(nLeaderKill2)+", ";
sMsg = sMsg + "3)"+sLeader3+": "+IntToString(nLeaderTotal3)+" / "+IntToString(nLeaderPlanet3)+" / "+IntToString(nLeaderKill3)+", ";
sMsg = sMsg + "4)"+sLeader4+": "+IntToString(nLeaderTotal4)+" / "+IntToString(nLeaderPlanet4)+" / "+IntToString(nLeaderKill4)+", ";
sMsg = sMsg + "5)"+sLeader5+": "+IntToString(nLeaderTotal5)+" / "+IntToString(nLeaderPlanet5)+" / "+IntToString(nLeaderKill5);

SetCustomToken(59601, sMsg);
}
