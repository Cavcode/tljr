void main()
{
object oPC = GetLastClosedBy();
int nAccount = GetCampaignInt("cmrcgld", "ACCOUNT_"+GetStringRight(GetTag(OBJECT_SELF),8));
int nStart = GetLocalInt(oPC, "CMRC_INITIAL_GOLD");
int nRevenue = nStart-GetGold(oPC);

if (nRevenue < -10000)
    {
    nRevenue = -10000;
    }

SetCampaignInt("cmrcgld", "ACCOUNT_"+GetStringRight(GetTag(OBJECT_SELF),8), nAccount + nRevenue);
DeleteLocalInt(oPC, "CMRC_INITIAL_GOLD");
}
