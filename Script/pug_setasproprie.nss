void main()
{
object oPC = GetPCSpeaker();
int nRank = 2;
int nPage = GetLocalInt(oPC, "CMRC_MULTIPLIER");
int nChoice = GetLocalInt(oPC, "CMRC_NUMBER");
string sSubject = GetLocalString(oPC, "CMRC_SUBJECT");
//object oMember = GetLocalObject(oPC, "CMRC_"+sSubject+"_"+IntToString(nChoice+nPage));
string sMember = GetCampaignString("cmrcgld", "CMRC_"+sSubject+"_"+IntToString(nChoice+nPage));
int nExecCount = GetCampaignInt("cmrcgld", "CMRC_EXEC_COUNT");
int nPropCount = GetCampaignInt("cmrcgld", "CMRC_PROP_COUNT");
int nMerchCount = GetCampaignInt("cmrcgld", "CMRC_MERCH_COUNT");
int x = 1; int z = 0;

if (sSubject == "MERCH")
    {
    while (sMember != GetCampaignString("cmrcgld", "CMRC_MERCH_"+IntToString(x)) && x < 200)
        {
        x=x+1;
        }
    for (z = x; z < (nMerchCount); z++)
        {
        SetCampaignString("cmrcgld", "CMRC_MERCH_"+IntToString(z), GetCampaignString("cmrcgld", "CMRC_MERCH_"+IntToString(z+1)) );
        }
    SetCampaignInt("cmrcgld", "CMRC_"+sMember, nRank+1);
    SetCampaignString("cmrcgld", "CMRC_MERCH_"+IntToString(z+nMerchCount), "");
    SetCampaignInt("cmrcgld", "CMRC_MERCH_COUNT", nMerchCount-1);
    }
else if (sSubject == "EXEC")
    {
    while (sMember != GetCampaignString("cmrcgld", "CMRC_EXEC_"+IntToString(x)) && x < 200)
        {
        x=x+1;
        }
    for (z = x; z < (nExecCount); z++)
        {
        SetCampaignString("cmrcgld", "CMRC_EXEC_"+IntToString(z), GetCampaignString("cmrcgld", "CMRC_EXEC_"+IntToString(z+1)) );
        }
    SetCampaignInt("cmrcgld", "CMRC_"+sMember, nRank+1);
    SetCampaignString("cmrcgld", "CMRC_EXEC_"+IntToString(z+nExecCount), "");
    SetCampaignInt("cmrcgld", "CMRC_EXEC_COUNT", nExecCount-1);
    }
else if (sSubject == "TRADER")
    {
    SetCampaignInt("cmrcgld", "CMRC_"+sMember, nRank+1);
    SetCampaignString("cmrcgld", "CMRC_PROP_"+IntToString(1+nPropCount), sMember);
    SetCampaignInt("cmrcgld", "CMRC_PROP_COUNT", nPropCount+1);
    }
object oPlayer = GetFirstPC();

while (GetIsObjectValid(oPlayer) == TRUE && sSubject != "PROP")
    {
    if (GetCampaignInt("cmrcgld", "CMRC_"+GetName(oPlayer))-1 != GetCampaignInt("cmrcgld", "CMRC_RANK", oPlayer) && GetIsObjectValid(GetItemPossessedBy(oPlayer, "TraderBadge"))==TRUE && GetCampaignInt("cmrcgld", "CMRC_"+GetName(oPlayer))>0)
        {
        SetCampaignInt("cmrcgld", "CMRC_RANK", GetCampaignInt("cmrcgld", "CMRC_"+GetName(oPlayer))-1,oPlayer);
        SetCampaignInt("cmrcgld", "CMRC_"+GetName(oPlayer), 0);
        }
    oPlayer = GetNextPC();
    }
}
