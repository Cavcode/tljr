void main()
{
object oPC = GetPCSpeaker();
float fTax = GetCampaignFloat("cmrcgld", "CMRC_TAX");

    SetCustomToken(40405702, "The tax rate is "+FloatToString(fTax*100)+"% right now. Please tell me the the new rate, between 0 and 50, then indicate to me when you are done speaking.");
    SetLocalInt(GetPCSpeaker(), "SPEAKING", TRUE);


}
