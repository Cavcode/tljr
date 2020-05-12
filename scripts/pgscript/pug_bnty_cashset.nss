void main()
{
object oPC = GetPCSpeaker();
string sName10 = GetLocalString(oPC, "TARGET_10");
string sName16 = GetLocalString(oPC, "TARGET_16");
string sName22 = GetLocalString(oPC, "TARGET_22");
string sName28 = GetLocalString(oPC, "TARGET_28");
string sName34 = GetLocalString(oPC, "TARGET_34");

SetCustomToken(97810, "I've come to collect the bounty on "+sName10);
SetCustomToken(97816, "I've come to collect the bounty on "+sName16);
SetCustomToken(97822, "I've come to collect the bounty on "+sName22);
SetCustomToken(97828, "I've come to collect the bounty on "+sName28);
SetCustomToken(97834, "I've come to collect the bounty on "+sName34);

}
