void main()
{
object oShop = GetObjectByTag("inv_"+GetTag(OBJECT_SELF));
//int nCount = GetCampaignInt("cmrcgld", "INV_COUNT", GetObjectByTag("chest_"+GetTag(OBJECT_SELF)));
object oItem;string sResRef; int nSize;  int x=1;
int nMaxBuy = GetCampaignInt("cmrcgld", "MAXBUY_"+GetTag(OBJECT_SELF));
int nIdentify = GetCampaignInt("cmrcgld", "IDENTIFY_"+GetTag(OBJECT_SELF));

SetStoreMaxBuyPrice(oShop, nMaxBuy);
SetStoreIdentifyCost(oShop, nIdentify);

while (GetCampaignString("cmrcgld", GetTag(OBJECT_SELF)+"_"+IntToString(x))!="" && x<100)
    {
    sResRef = GetCampaignString("cmrcgld", GetTag(OBJECT_SELF)+"_"+IntToString(x));
    oItem = CreateItemOnObject(sResRef, oShop, nSize);
    SetInfiniteFlag(oItem, TRUE);
    x++;
    }

/*while(nCount > 0)
    {
    sResRef = GetCampaignString("cmrcgld", "INV_"+IntToString(x), OBJECT_SELF);
    object oBoxItem = CreateItemOnObject(sResRef, GetObjectByTag("chest_"+GetTag(OBJECT_SELF)));
    if(GetBaseItemType(oBoxItem)==BASE_ITEM_ARROW){nSize = 99;}
    else if(GetBaseItemType(oBoxItem)==BASE_ITEM_BOLT){nSize = 99;}
    else if(GetBaseItemType(oBoxItem)==BASE_ITEM_BULLET){nSize = 99;}
    else { nSize = 1;}
    oItem = CreateItemOnObject(sResRef, oShop, nSize);
    SetInfiniteFlag(oItem, TRUE);
    nCount=nCount-1;
    }*/
}
