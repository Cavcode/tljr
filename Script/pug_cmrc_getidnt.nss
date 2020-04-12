void main()
{
int nMaxbuy = GetCampaignInt("cmrcgld", "IDENTIFY_"+GetTag(OBJECT_SELF));

SetCustomToken(4040505, "This shop charges "+IntToString(nMaxbuy)+" to identify an item. If you would like to change that, please tell me a new maximum buying price. If you don't want your store buying anything, then set the maximum buying price to 0. If you dont want to have a maximum then set the maximum buy price to -1 and your store will pay full dollar for any item after a markdown of course. If you would like to change that, please tell me a number between 20 and 200. Please indicate to me when you are done speaking and I will make the changes.");
SetLocalInt(GetPCSpeaker(), "SPEAKING", TRUE);

}
