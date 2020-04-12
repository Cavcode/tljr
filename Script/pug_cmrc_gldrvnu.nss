void main()
{
object oPC = GetLastClosedBy();
int nAccount = GetCampaignInt("cmrcgld", "ACCOUNT_GUILD");
int nStart = GetLocalInt(oPC, "CMRC_INITIAL_GOLD");

SetCampaignInt("cmrcgld", "ACCOUNT_GUILD", nAccount+FloatToInt(0.25*(nStart-GetGold(oPC))));
DeleteLocalInt(oPC, "CMRC_INITIAL_GOLD");
}
