void main()
{
object oPC = GetPCSpeaker();
int nRank = 4;
int nPage = GetLocalInt(oPC, "CMRC_MULTIPLIER");
int nChoice = GetLocalInt(oPC, "CMRC_NUMBER");
string sSubject = GetLocalString(oPC, "CMRC_SUBJECT");
string sMember = GetCampaignString("cmrcgld", "CMRC_"+sSubject+"_"+IntToString(nChoice+nPage));
int nExecCount = GetCampaignInt("cmrcgld", "CMRC_EXEC_COUNT");

object oPlayer = GetFirstPC();

if (GetIsDM(oPC)==FALSE)
    {
    SetCampaignInt("cmrcgld", "CMRC_RANK", 3, oPC);
    }
else if (GetIsDM(oPC) == TRUE && GetCampaignString("cmrcgld", "CMRC_PRESIDENT") != "")
    {
    SetCampaignInt("cmrcgld", "CMRC_"+GetCampaignString("cmrcgld", "CMRC_PRESIDENT"), 3);
    }

SetCampaignString("cmrcgld", "CMRC_PRESIDENT", sMember);
SetCampaignInt("cmrcgld", "CMRC_"+sMember, nRank+1);

while (GetIsObjectValid(oPlayer) == TRUE && sSubject == "EXEC")
    {
    if (GetCampaignInt("cmrcgld", "CMRC_"+GetName(oPlayer))-1 != GetCampaignInt("cmrcgld", "CMRC_RANK", oPlayer) && GetIsObjectValid(GetItemPossessedBy(oPlayer, "TraderBadge"))==TRUE && GetCampaignInt("cmrcgld", "CMRC_"+GetName(oPlayer))>0)
        {
        SetCampaignInt("cmrcgld", "CMRC_RANK", GetCampaignInt("cmrcgld", "CMRC_"+GetName(oPlayer)),oPlayer);
        SetCampaignInt("cmrcgld", "CMRC_"+GetName(oPlayer), 0);
        }
    oPlayer = GetNextPC();
    }
}
