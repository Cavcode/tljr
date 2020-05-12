void main()
{
object oTrader = GetFirstPC();
object oPC = GetPCSpeaker();
int nExecCount = GetCampaignInt("cmrcgld", "CMRC_EXEC_COUNT");
int nPropCount = GetCampaignInt("cmrcgld", "CMRC_PROP_COUNT");
int nMerchCount = GetCampaignInt("cmrcgld", "CMRC_MERCH_COUNT");
int x, y, z;


SendMessageToPC(oPC, "PRESIDENT:");
SendMessageToPC(oPC, GetCampaignString("cmrcgld", "CMRC_PRESIDENT"));
SendMessageToPC(oPC, "EXECUTIVES:");
for (x = 0; x < (nExecCount+1); x++)
    {
    SendMessageToPC(oPC, GetCampaignString("cmrcgld", "CMRC_EXEC_"+IntToString(x)));
    }
SendMessageToPC(oPC, "PROPRIETORS:");
for (y = 0; y < (nPropCount+1); y++)
    {
    SendMessageToPC(oPC, GetCampaignString("cmrcgld", "CMRC_PROP_"+IntToString(y)));
    }
SendMessageToPC(oPC, "MERCHANTS:");
for (z = 0; z < (nMerchCount+1); z++)
    {
    SendMessageToPC(oPC, GetCampaignString("cmrcgld", "CMRC_MERCH_"+IntToString(z)));
    }
SendMessageToPC(oPC, "TRADERS(online):");
while (GetIsPC(oTrader) == TRUE && GetIsObjectValid(oTrader)==TRUE)
    {
    if (GetCampaignInt("cmrcgld", "CMRC_RANK", oTrader) == 0 && GetIsObjectValid(GetItemPossessedBy(oTrader, "TraderBadge"))==TRUE)
        {
        SendMessageToPC(oPC, GetName(oTrader));
        }
    oTrader = GetNextPC();
    }
}
