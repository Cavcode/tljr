int StartingConditional()
{
object oPC = GetPCSpeaker();
string sSub = GetLocalString(oPC, "CMRC_SUBJECT");
int nCount = GetCampaignInt("cmrcgld", "CMRC_"+sSub+"_COUNT");
int nMulti = GetLocalInt(oPC, "CMRC_MULTIPLIER");
int x = 5+nMulti;
    // Inspect local variables
    if(!(x+nMulti >= nCount))
        return FALSE;
if(!(GetCampaignString("cmrcgld", "CMRC_"+sSub+"_"+IntToString(x)) != ""))
        return FALSE;
    return TRUE;
}
