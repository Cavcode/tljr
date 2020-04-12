void main()
{
int nMarkup = GetCampaignInt("cmrcgld", "MARKUP_"+GetTag(OBJECT_SELF));
int nMarkdown = GetCampaignInt("cmrcgld", "MARKDOWN_"+GetTag(OBJECT_SELF));
if (nMarkup <20){nMarkup = 60; SetCampaignInt("cmrcgld", "MARKUP_"+GetTag(OBJECT_SELF), nMarkup);}
if (nMarkdown > 80){nMarkdown = 80; SetCampaignInt("cmrcgld", "MARKUP_"+GetTag(OBJECT_SELF), nMarkdown);}

OpenStore(GetObjectByTag("inv_"+GetTag(OBJECT_SELF)), GetPCSpeaker(), nMarkup, nMarkdown);
}
