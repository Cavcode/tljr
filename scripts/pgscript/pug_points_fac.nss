void main()
{
string sPointsReb = IntToString(GetCampaignInt("swpcpoints", "POINTS_Rebels"));
string sPointsEmp = IntToString(GetCampaignInt("swpcpoints", "POINTS_Empire"));
string sPointsRebPlanet = IntToString(GetCampaignInt("swpcpoints", "POINTS_PLANET_Rebels"));
string sPointsEmpPlanet = IntToString(GetCampaignInt("swpcpoints", "POINTS_PLANET_Empire"));
string sPointsRebKill = IntToString(GetCampaignInt("swpcpoints", "POINTS_KILL_Rebels"));
string sPointsEmpKill = IntToString(GetCampaignInt("swpcpoints", "POINTS_KILL_Empire"));

SetCustomToken(59601, "Rebels ( Total Points: "+sPointsReb+", Planetary Control Points: "+sPointsRebPlanet+", Kill Points: "+sPointsRebKill+")   Empire ( Total Points: "+sPointsEmp+", Planetary Control Points: "+sPointsEmpPlanet+", Kill Points: "+sPointsEmpKill+")");
}
