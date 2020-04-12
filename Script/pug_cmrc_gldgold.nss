void main()      //<CUSTOM40405700>
{
int nAccount = GetCampaignInt("cmrcgld", "ACCOUNT_GUILD");
float fTax = GetCampaignFloat("cmrcgld", "CMRC_TAX");

SetCustomToken(40405700, "The guild currently has "+IntToString(nAccount)+" credits in its account and the current tax rate is "+FloatToString(fTax*100)+"%");
}
