void main()
{
int nMaxbuy = GetCampaignInt("cmrcgld", "MAXBUY_"+GetTag(OBJECT_SELF));

SetCustomToken(4040504, "This shop will not buy any items for more than "+IntToString(nMaxbuy)+". If you would like to change that, please tell me a new maximum buying price. If you don't want your store buying anything, then set the maximum buying price to 0. If you dont want to have a maximum then set the maximum buy price to -1 and your store will pay full dollar for any item after a markdown of course. Please indicate to me when you are done speaking and I will make the changes.");
SetLocalInt(GetPCSpeaker(), "SPEAKING", TRUE);

}
