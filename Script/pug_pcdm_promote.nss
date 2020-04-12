void main()
{
object oPC = GetPCSpeaker();
object oTarget = GetLocalObject(oPC, "DM_TARGET");
SetCampaignInt("starwars", "PCDM", TRUE, oTarget);
}
