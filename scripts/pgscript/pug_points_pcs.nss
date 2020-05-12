void main()
{
object oPC = GetPCSpeaker();
string sPoints = IntToString(GetCampaignInt("swpcpoints", "PC_POINTS",oPC));
string sPointsPlanet = IntToString(GetCampaignInt("swpcpoints", "PC_POINTS_PLANET", oPC));
string sPointsKill = IntToString(GetCampaignInt("swpcpoints", "PC_POINTS_KILL", oPC));

SetCustomToken(59601, "Your Total Points: "+sPoints+", Planet Conquering Points: "+sPointsPlanet+", Kill Points: "+sPointsKill);
}
