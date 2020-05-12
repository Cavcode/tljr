void main()
{
object oPC = GetPCSpeaker();
int nAccount = GetCampaignInt("cmrcgld", "ACCOUNT_GUILD");


    SetCustomToken(40405701, "The guild currently has "+IntToString(nAccount)+" credits in its reserves. Please tell me the amount you wish to withdrawl, then indicate to me when you are done speaking.");
    SetLocalInt(GetPCSpeaker(), "SPEAKING", TRUE);


}
