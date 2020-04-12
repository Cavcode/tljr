void main()
{
SetCampaignInt("swpcpoints", "POINTS_Rebels", 0);
SetCampaignInt("swpcpoints", "POINTS_Empire", 0);
SetCampaignInt("swpcpoints", "POINTS_PLANET_Rebels", 0);
SetCampaignInt("swpcpoints", "POINTS_PLANET_Empire", 0);
SetCampaignInt("swpcpoints", "POINTS_KILL_Rebels", 0);
SetCampaignInt("swpcpoints", "POINTS_KILL_Empire", 0);
FloatingTextStringOnCreature("Points Reset", GetPCSpeaker(), FALSE);
}
