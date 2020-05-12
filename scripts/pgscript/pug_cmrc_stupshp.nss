//This script sets up the shop list to appear in the guild porter list

void main()         //<CUSTOM40405200>
{
object oPC = GetPCSpeaker();
int nCount=1;
object oShop = GetObjectByTag("cmrc_001");
string sNum;

while (GetIsObjectValid(oShop) == TRUE)
    {
    SetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(nCount), oShop);
    nCount = nCount+1;
    if (nCount < 10)
        {
        sNum = "00"+IntToString(nCount);
        }
    else if (nCount >= 10 && nCount <100)
        {
        sNum = "0"+IntToString(nCount);
        }
    else if (nCount >= 100)
        {
        sNum = IntToString(nCount);
        }
    oShop = GetObjectByTag("cmrc_"+sNum);
    }
SetLocalInt(oPC, "CMRC_SHOP_COUNT", nCount);
SetLocalInt(oPC, "CMRC_SHOP_CHOICE", 0);
SetLocalInt(oPC, "CMRC_MULTIPLIER", 0);

SetCustomToken(40405200, "Shop "+GetStringRight(GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_1")), 3)+": "+GetName(GetArea(GetLocalObject(oPC, "CMRC_SHOP_NUM_1")))+" ("+GetCampaignString("cmrcgld", "OWNER_"+GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_1")))+")");
SetCustomToken(40405201, "Shop "+GetStringRight(GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_2")), 3)+": "+GetName(GetArea(GetLocalObject(oPC, "CMRC_SHOP_NUM_2")))+" ("+GetCampaignString("cmrcgld", "OWNER_"+GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_2")))+")");
SetCustomToken(40405202, "Shop "+GetStringRight(GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_3")), 3)+": "+GetName(GetArea(GetLocalObject(oPC, "CMRC_SHOP_NUM_3")))+" ("+GetCampaignString("cmrcgld", "OWNER_"+GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_3")))+")");
SetCustomToken(40405203, "Shop "+GetStringRight(GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_4")), 3)+": "+GetName(GetArea(GetLocalObject(oPC, "CMRC_SHOP_NUM_4")))+" ("+GetCampaignString("cmrcgld", "OWNER_"+GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_4")))+")");
SetCustomToken(40405204, "Shop "+GetStringRight(GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_5")), 3)+": "+GetName(GetArea(GetLocalObject(oPC, "CMRC_SHOP_NUM_5")))+" ("+GetCampaignString("cmrcgld", "OWNER_"+GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_5")))+")");
SetCustomToken(40405205, "Shop "+GetStringRight(GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_6")), 3)+": "+GetName(GetArea(GetLocalObject(oPC, "CMRC_SHOP_NUM_6")))+" ("+GetCampaignString("cmrcgld", "OWNER_"+GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_6")))+")");
}
