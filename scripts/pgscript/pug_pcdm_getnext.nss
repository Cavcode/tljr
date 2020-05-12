void main()
{
object oPC = GetPCSpeaker();
object oTarget = GetLocalObject(oPC, "DM_TARGET");
oTarget = GetNextPC();

if (GetIsObjectValid(oTarget) == FALSE)
    {
    oTarget = GetFirstPC();
    }

SetLocalObject(oPC, "DM_TARGET",oTarget);

SetCustomToken(10109900, "What would you like to do with "+GetName(oTarget)+"? (PCDM: "+IntToString(GetCampaignInt("starwars", "PCDM", oTarget))+")");

}
