void main()
{
    string sHouse = GetTag(OBJECT_SELF);
    SetCampaignString("swhouses", "OWNER_NAME_"+sHouse, "For Sale");
    SetCampaignString("swhouses", "OWNER_ID_"+sHouse, "");
}
