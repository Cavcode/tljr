void main()
{
object oPC = GetPCSpeaker();
int nLevel = GetLocalInt(GetPCSpeaker(), "CONVO_LEVEL");
int nBounty = GetLocalInt(oPC, "BOUNTY_"+IntToString(nLevel));

GiveGoldToCreature(oPC, nBounty);

DeleteLocalInt(oPC, "BOUNTY_"+IntToString(nLevel));
DeleteLocalString(oPC, "TARGET_"+IntToString(nLevel));
DeleteLocalString(oPC, "BOUNTY_STATUS_"+IntToString(nLevel));
}
