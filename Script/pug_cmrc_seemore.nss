void main()
{
object oPC = GetPCSpeaker();
string sRank = GetLocalString(oPC, "CMRC_SUBJECT");
int nCount = GetLocalInt(oPC, sRank+"_COUNT");
int nMulti = GetLocalInt(oPC, "CMRC_MULTIPLIER");

/*if (nMulti >= nCount)
    {
    nMulti = 0;
    SetLocalInt(oPC, "CMRC_MULTIPLIER", 0);
    }
else
    {*/
    nMulti = nMulti + 6;
    SetLocalInt(oPC, "CMRC_MULTIPLIER", nMulti);
    //}

SetCustomToken(40405100, GetCampaignString("cmrcgld", "CMRC_"+sRank+"_"+IntToString(1+nMulti)));
SetCustomToken(40405101, GetCampaignString("cmrcgld", "CMRC_"+sRank+"_"+IntToString(2+nMulti)));
SetCustomToken(40405102, GetCampaignString("cmrcgld", "CMRC_"+sRank+"_"+IntToString(3+nMulti)));
SetCustomToken(40405103, GetCampaignString("cmrcgld", "CMRC_"+sRank+"_"+IntToString(4+nMulti)));
SetCustomToken(40405104, GetCampaignString("cmrcgld", "CMRC_"+sRank+"_"+IntToString(5+nMulti)));
SetCustomToken(40405105, GetCampaignString("cmrcgld", "CMRC_"+sRank+"_"+IntToString(6+nMulti)));
}
