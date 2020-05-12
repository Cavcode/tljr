#include "NW_I0_PLOT"

int StartingConditional()
{
string sHouse = GetTag(OBJECT_SELF);
    int nPrice;
    if (GetCampaignInt("swhouses", "HOUSE_PRICE_"+sHouse) > 0) {nPrice = GetCampaignInt("swhouses", "HOUSE_PRICE_"+sHouse);}
    else if (GetLocalInt(OBJECT_SELF,"PRICE")>0){nPrice = GetLocalInt(OBJECT_SELF, "PRICE");}
    else {nPrice = 50000;}

    if(HasGold(nPrice,GetPCSpeaker()) == TRUE && GetCampaignString("swhouses", "OWNER_NAME_"+sHouse) != GetName(GetPCSpeaker()))
        {
        return TRUE;
        }
    else
        {
        return FALSE;
        }
}
