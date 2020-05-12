void main() //<CUSTOM4040500>
{
int nAccount = GetCampaignInt("cmrcgld", "ACCOUNT_"+GetTag(OBJECT_SELF));
int nMarkup = GetCampaignInt("cmrcgld", "MARKUP_"+GetTag(OBJECT_SELF));
int nMarkDown = GetCampaignInt("cmrcgld", "MARKDOWN_"+GetTag(OBJECT_SELF));
int nMaxBuy = GetCampaignInt("cmrcgld", "MAXBUY_"+GetTag(OBJECT_SELF));
int nIdentify = GetCampaignInt("cmrcgld", "IDENTIFY_"+GetTag(OBJECT_SELF));

SetCustomToken(4040500, "This shop currently has "+IntToString(nAccount)+" credits in its account. Items for sale are marked up "+IntToString(nMarkup)+"% of their value and items purchased by the shop are marked down by "+IntToString(nMarkDown)+"%. The most we will pay for any item is "+IntToString(nMaxBuy)+" credits and we are currently charging "+IntToString(nIdentify)+" credits to identify items.");

}
