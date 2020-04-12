int StartingConditional()
{
object oPC = GetPCSpeaker();
string sRank = GetLocalString(oPC, "CMRC_SUBJECT");
int nMulti = GetLocalInt(oPC, "CMRC_MULTIPLIER");
    // Inspect local variables
    if(!(GetCampaignInt("cmrcgld", "CMRC_"+sRank+"_COUNT") > 6+nMulti))
        return FALSE;

    return TRUE;
}
