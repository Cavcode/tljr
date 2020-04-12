void main()
{
object oPC = GetLastOpenedBy();
int nGold = GetGold(oPC);

SetLocalInt(oPC, "CMRC_INITIAL_GOLD", nGold);
}
