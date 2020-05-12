void main()
{
int nMarkup = GetCampaignInt("cmrcgld", "MARKUP_"+GetTag(OBJECT_SELF));

SetCustomToken(4040502, "The current markup on items is "+IntToString(nMarkup)+"% . If you would like to change that, please tell me a number between 20 and 100. Please indicate to me when you are done speaking and I will make the changes.");
SetLocalInt(GetPCSpeaker(), "SPEAKING", TRUE);

}
