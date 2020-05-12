void main()
{
object oPC = GetPCSpeaker();
int nAmount = GetLocalInt(oPC, "LISTEN_INT");
int nAccount = GetCampaignInt("cmrcgld", "ACCOUNT_"+GetTag(OBJECT_SELF));
int nGuild = GetCampaignInt("cmrcgld", "ACCOUNT_GUILD");
float fTax = GetCampaignFloat("cmrcgld", "CMRC_TAX");

if (nAmount > 0 && nAmount <= FloatToInt(nAccount-nAccount*fTax))
    {
    nAccount = nAccount - nAmount*FloatToInt((1.0+fTax));
    GiveGoldToCreature(oPC, nAmount);
    SetCampaignInt("cmrcgld", "ACCOUNT_GUILD", FloatToInt(nGuild+nAmount*fTax));
    SetCampaignInt("cmrcgld", "ACCOUNT_"+GetTag(OBJECT_SELF), nAccount);
    }
else
    {
    AssignCommand(OBJECT_SELF, ActionSpeakString("That is an invalid amount"));
    }
    DeleteLocalString(oPC, "LISTEN_STRING");
    DeleteLocalInt(oPC, "LISTEN_INT");
    DeleteLocalFloat(oPC, "LISTEN_FLOAT");

nAccount = GetCampaignInt("cmrcgld", "ACCOUNT_"+GetTag(OBJECT_SELF));
int nMarkup = GetCampaignInt("cmrcgld", "MARKUP_"+GetTag(OBJECT_SELF));
int nMarkDown = GetCampaignInt("cmrcgld", "MARKDOWN_"+GetTag(OBJECT_SELF));
int nMaxBuy = GetCampaignInt("cmrcgld", "MAXBUY_"+GetTag(OBJECT_SELF));
int nIdentify = GetCampaignInt("cmrcgld", "IDENTIFY_"+GetTag(OBJECT_SELF));
SetLocalInt(oPC, "SPEAKING", FALSE);

SetCustomToken(4040500, "This shop currently has "+IntToString(nAccount)+" credits in its account. Items for sale are marked up "+IntToString(nMarkup)+"% of their value and items purchased by the shop are marked down by "+IntToString(nMarkDown)+"%. The most we will pay for any item is "+IntToString(nMaxBuy)+" credits and we are currently charging "+IntToString(nIdentify)+" credits to identify items.");

}
