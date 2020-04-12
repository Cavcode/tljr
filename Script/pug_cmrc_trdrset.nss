void main()         //<CUSTOM40405100>
{
object oTrader = GetFirstPC();
object oPC = GetPCSpeaker();
int nCount=0;

while (GetIsPC(oTrader) == TRUE && GetIsObjectValid(oTrader)==TRUE)
    {
    if (GetCampaignInt("cmrcgld", "CMRC_RANK", oTrader) == 0 && GetIsObjectValid(GetItemPossessedBy(oTrader, "TraderBadge"))==TRUE )
        {
        nCount=nCount+1;
        SetCampaignString("cmrcgld", "CMRC_TRADER_"+IntToString(nCount), GetName(oTrader));
        }
    oTrader = GetNextPC();
    }
SetLocalString(oPC, "CMRC_SUBJECT", "TRADER");
SetCampaignInt("cmrcgld", "CMRC_TRADER_COUNT", nCount);
SetLocalInt(oPC, "CMRC_MULTIPLIER", 0);
SetCustomToken(40405100, GetCampaignString("cmrcgld", "CMRC_TRADER_1"));
SetCustomToken(40405101, GetCampaignString("cmrcgld", "CMRC_TRADER_2"));
SetCustomToken(40405102, GetCampaignString("cmrcgld", "CMRC_TRADER_3"));
SetCustomToken(40405103, GetCampaignString("cmrcgld", "CMRC_TRADER_4"));
SetCustomToken(40405104, GetCampaignString("cmrcgld", "CMRC_TRADER_5"));
SetCustomToken(40405105, GetCampaignString("cmrcgld", "CMRC_TRADER_6"));
}
