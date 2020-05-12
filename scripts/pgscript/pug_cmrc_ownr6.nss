void main()
{
int nChoice = 6;
object oPC = GetPCSpeaker();
int nMulti = GetLocalInt(oPC, "CMRC_SETSHOP_PAGE");
int nShop = GetLocalInt(oPC, "CMRC_SHOP_CHOICE");
object oMember = GetLocalObject(oPC, "CMRC_SETSHOP_"+IntToString(nChoice+nMulti));
object oShop = GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(nShop));

SetCampaignString("cmrcgld", "OWNER_"+GetTag(oShop), GetName(oMember));
}
