void main()
{
    int nPrice;
    string sHouse = GetTag(OBJECT_SELF);
if (GetCampaignInt("swhouses", "HOUSE_PRICE_"+sHouse) > 0) {nPrice = GetCampaignInt("swhouses", "HOUSE_PRICE_"+sHouse);}
else if (GetLocalInt(OBJECT_SELF,"PRICE")>0){nPrice = GetLocalInt(OBJECT_SELF, "PRICE");}
else {nPrice = 50000;}
    int nSell = nPrice*80/100;
    SetCampaignString("swhouses", "OWNER_NAME_"+sHouse, "For Sale");
    SetCampaignString("swhouses", "OWNER_ID_"+sHouse, "");
    GiveGoldToCreature(GetPCSpeaker(), nSell);
}
