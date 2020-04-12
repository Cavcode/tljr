void main()
{
int nMarkup = GetCampaignInt("cmrcgld", "MARKDOWN_"+GetTag(OBJECT_SELF));

SetCustomToken(4040503, "The current markdown on purchasing items is "+IntToString(nMarkup)+"% . If you would like to change that, please tell me a number between 10 and 80. Please indicate to me when you are done speaking and I will make the changes.");
SetLocalInt(GetPCSpeaker(), "SPEAKING", TRUE);

}
