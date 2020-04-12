void main()
{
object oPC = GetPCSpeaker();
int nAmount = GetLocalInt(oPC, "LISTEN_INT");

if (nAmount >= 0 && nAmount <= 50)
    {
    SetCampaignFloat("cmrcgld", "CMRC_TAX", IntToFloat(nAmount)/100);
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
