void main()         //<CUSTOM40405100>
{
object oPC = GetPCSpeaker();

SetLocalString(oPC, "CMRC_SUBJECT", "MERCH");
SetLocalInt(oPC, "CMRC_MULTIPLIER", 0);
SetCustomToken(40405100, GetCampaignString("cmrcgld", "CMRC_MERCH_1"));
SetCustomToken(40405101, GetCampaignString("cmrcgld", "CMRC_MERCH_2"));
SetCustomToken(40405102, GetCampaignString("cmrcgld", "CMRC_MERCH_3"));
SetCustomToken(40405103, GetCampaignString("cmrcgld", "CMRC_MERCH_4"));
SetCustomToken(40405104, GetCampaignString("cmrcgld", "CMRC_MERCH_5"));
SetCustomToken(40405105, GetCampaignString("cmrcgld", "CMRC_MERCH_6"));
}
