void main()  //40405500
{
object oTrader = GetFirstPC();
object oPC = GetPCSpeaker();
int nCount=0;

while (GetIsPC(oTrader) == TRUE && GetIsObjectValid(oTrader)==TRUE)
    {
    if (GetCampaignInt("cmrcgld", "CMRC_RANK", oTrader) > 1 && GetIsObjectValid(GetItemPossessedBy(oTrader, "TraderBadge"))==TRUE)
        {
        nCount=nCount+1;
        SetLocalObject(oPC, "CMRC_SETSHOP_"+IntToString(nCount), oTrader);
        }
    oTrader = GetNextPC();
    }
    SetLocalInt(oPC, "CMRC_SETSHOP_COUNT", nCount);
    SetLocalInt(oPC, "CMRC_SETSHOP_PAGE", 0);

SetCustomToken(40405500, GetName(GetLocalObject(oPC, "CMRC_SETSHOP_1")));
SetCustomToken(40405501, GetName(GetLocalObject(oPC, "CMRC_SETSHOP_2")));
SetCustomToken(40405502, GetName(GetLocalObject(oPC, "CMRC_SETSHOP_3")));
SetCustomToken(40405503, GetName(GetLocalObject(oPC, "CMRC_SETSHOP_4")));
SetCustomToken(40405504, GetName(GetLocalObject(oPC, "CMRC_SETSHOP_5")));
SetCustomToken(40405505, GetName(GetLocalObject(oPC, "CMRC_SETSHOP_6")));
}
