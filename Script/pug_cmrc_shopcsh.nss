void main()
{
object oPC = GetPCSpeaker();
int nAccount = GetCampaignInt("cmrcgld", "ACCOUNT_"+GetTag(OBJECT_SELF));
float fTax = GetCampaignFloat("cmrcgld", "CMRC_TAX");

if (nAccount < 0)
    {
    SetCustomToken(4040501, "The shop is currently "+IntToString(abs(nAccount))+" credits in debt. If you would like to cash some credits out you will have to earn a profit. If you want to contribute some of your own credits to the shop, then purchase some items for sale.");
    }
else
    {
    SetCustomToken(4040501, "The shop currently has "+IntToString(nAccount)+" credits in its account. The guild currently taxes all credit withdrawls from a shop account at the rate of "+FloatToString(fTax*100)+"%. Therefore, the maximum amount you can cash out is "+(IntToString(FloatToInt(nAccount-nAccount*fTax)))+" credits. Please tell me the amount you wish to withdrawl, then indicate to me when you are done speaking.");
    SetLocalInt(GetPCSpeaker(), "SPEAKING", TRUE);
    }

}
