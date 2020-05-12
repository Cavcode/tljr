void main()         //<CUSTOM40405100>
{
//object oTrader = GetFirstPC();
object oPC = GetPCSpeaker();
/*int nEXECCount = GetCampaignInt("cmrcgld", "CMRC_EXEC_COUNT");
int nCount = 0;

while (nCount <= nEXECCount)
    {
    if (GetCampaignInt("cmrcgld", "CMRC_RANK", oTrader) == 0 && GetIsObjectValid(GetItemPossessedBy(oTrader, "TraderBadge"))==TRUE)
        {
        nCount=nCount+1;
        SetLocalObject(oPC, "CMRC_EXEC_"+IntToString(nCount), oTrader);
        }
    oTrader = GetNextPC();
    }    */
SetLocalString(oPC, "CMRC_SUBJECT", "EXEC");
SetLocalInt(oPC, "CMRC_MULTIPLIER", 0);
SetCustomToken(40405100, GetCampaignString("cmrcgld", "CMRC_EXEC_1"));
SetCustomToken(40405101, GetCampaignString("cmrcgld", "CMRC_EXEC_2"));
SetCustomToken(40405102, GetCampaignString("cmrcgld", "CMRC_EXEC_3"));
SetCustomToken(40405103, GetCampaignString("cmrcgld", "CMRC_EXEC_4"));
SetCustomToken(40405104, GetCampaignString("cmrcgld", "CMRC_EXEC_5"));
SetCustomToken(40405105, GetCampaignString("cmrcgld", "CMRC_EXEC_6"));
}
