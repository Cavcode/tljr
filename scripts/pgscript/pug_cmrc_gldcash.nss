void main()
{
object oPC = GetPCSpeaker();
int nAmount = GetLocalInt(oPC, "LISTEN_INT");
int nAccount = GetCampaignInt("cmrcgld", "ACCOUNT_GUILD");

if (nAmount > 0 && nAmount <= nAccount)
    {
    nAccount = nAccount - nAmount;
    GiveGoldToCreature(oPC, nAmount);
    SetCampaignInt("cmrcgld", "ACCOUNT_GUILD", nAccount);
    }
else
    {
    AssignCommand(OBJECT_SELF, ActionSpeakString("That is an invalid amount"));
    }
    DeleteLocalString(oPC, "LISTEN_STRING");
    DeleteLocalInt(oPC, "LISTEN_INT");
    DeleteLocalFloat(oPC, "LISTEN_FLOAT");
    SetLocalInt(oPC, "SPEAKING", FALSE);
}
