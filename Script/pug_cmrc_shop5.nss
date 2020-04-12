void main()  //<CUSTOM40405201>
{
int nChoice = 5;
object oPC = GetPCSpeaker();
int nMulti = GetLocalInt(oPC, "CMRC_MULTIPLIER");
int nShop = nChoice + nMulti;
SetLocalInt(oPC, "CMRC_SHOP_CHOICE", nChoice+nMulti);

SetCustomToken(40405201, "Shop "+GetStringRight(GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(nShop))), 3)+" is located at "+GetName(GetArea(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(nShop))))+" and is presently owned by "+GetCampaignString("cmrcgld", "OWNER_"+GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(nShop))))+". The account for this shop has a balance of "+IntToString(GetCampaignInt("cmrcgld", "ACCOUNT_"+GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(nShop)))+".")));
}
