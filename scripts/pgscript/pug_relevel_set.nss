void main()
{
object oPC = GetPCSpeaker();
int nXP = GetXP(oPC);
int nLevel = GetHitDice(oPC);
int nAmount = GetLocalInt(oPC, "LISTEN_INT");

if (nAmount < nLevel && nAmount > 0)
    {
    SetXP(oPC, (( nAmount * ( nAmount - 1 )) / 2 * 1000 ));
    DelayCommand(1.0, SetXP(oPC, nXP-(nLevel-nAmount)*100));
    }
else
    {
    AssignCommand(OBJECT_SELF, ActionSpeakString("That is an invalid level"));
    }
    DeleteLocalString(oPC, "LISTEN_STRING");
    DeleteLocalInt(oPC, "LISTEN_INT");
    DeleteLocalFloat(oPC, "LISTEN_FLOAT");

SetLocalInt(oPC, "SPEAKING", FALSE);

}
