void main()         //<CUSTOM40405100>
{
//object oTrader = GetFirstPC();
object oPC = GetPCSpeaker();
/*int nPROPCount = GetCampaignInt("cmrcgld", "CMRC_PROP_COUNT");
int nCount = 0;

while (nCount <= nPROPCount)
    {
    if (GetCampaignInt("cmrcgld", "CMRC_RANK", oTrader) == 0 && GetIsObjectValid(GetItemPossessedBy(oTrader, "TraderBadge"))==TRUE)
        {
        nCount=nCount+1;
        SetLocalObject(oPC, "CMRC_PROP_"+IntToString(nCount), oTrader);
        }
    oTrader = GetNextPC();
    }        */
SetLocalString(oPC, "CMRC_SUBJECT", "PROP");
SetLocalInt(oPC, "CMRC_MULTIPLIER", 0);
SetCustomToken(40405100, GetCampaignString("cmrcgld", "CMRC_PROP_1"));
SetCustomToken(40405101, GetCampaignString("cmrcgld", "CMRC_PROP_2"));
SetCustomToken(40405102, GetCampaignString("cmrcgld", "CMRC_PROP_3"));
SetCustomToken(40405103, GetCampaignString("cmrcgld", "CMRC_PROP_4"));
SetCustomToken(40405104, GetCampaignString("cmrcgld", "CMRC_PROP_5"));
SetCustomToken(40405105, GetCampaignString("cmrcgld", "CMRC_PROP_6"));
}
