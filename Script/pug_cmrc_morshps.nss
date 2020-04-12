void main()
{
object oPC = GetPCSpeaker();
string sRank = GetLocalString(oPC, "CMRC_SUBJECT");
int nCount = GetLocalInt(oPC, "CMRC_SHOP_COUNT");
int nMulti = GetLocalInt(oPC, "CMRC_MULTIPLIER");

if (nMulti >= nCount)
    {
    nMulti = 0;
    SetLocalInt(oPC, "CMRC_MULTIPLIER", 0);
    }
else
    {
    nMulti = nMulti + 6;
    SetLocalInt(oPC, "CMRC_MULTIPLIER", nMulti);
    }

//SetCustomToken(40405200, "Shop "+GetStringRight(GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(1+nMulti)));
SetCustomToken(40405200, "Shop "+GetStringRight(GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(1+nMulti))), 3)+": "+GetName(GetArea(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(1+nMulti))))+" ("+GetCampaignString("cmrcgld", "OWNER_"+GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(1+nMulti))))+")");
SetCustomToken(40405201, "Shop "+GetStringRight(GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(2+nMulti))), 3)+": "+GetName(GetArea(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(2+nMulti))))+" ("+GetCampaignString("cmrcgld", "OWNER_"+GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(2+nMulti))))+")");
SetCustomToken(40405202, "Shop "+GetStringRight(GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(3+nMulti))), 3)+": "+GetName(GetArea(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(3+nMulti))))+" ("+GetCampaignString("cmrcgld", "OWNER_"+GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(3+nMulti))))+")");
SetCustomToken(40405203, "Shop "+GetStringRight(GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(4+nMulti))), 3)+": "+GetName(GetArea(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(4+nMulti))))+" ("+GetCampaignString("cmrcgld", "OWNER_"+GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(4+nMulti))))+")");
SetCustomToken(40405204, "Shop "+GetStringRight(GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(5+nMulti))), 3)+": "+GetName(GetArea(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(5+nMulti))))+" ("+GetCampaignString("cmrcgld", "OWNER_"+GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(5+nMulti))))+")");
SetCustomToken(40405205, "Shop "+GetStringRight(GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(6+nMulti))), 3)+": "+GetName(GetArea(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(6+nMulti))))+" ("+GetCampaignString("cmrcgld", "OWNER_"+GetTag(GetLocalObject(oPC, "CMRC_SHOP_NUM_"+IntToString(6+nMulti))))+")");
}
