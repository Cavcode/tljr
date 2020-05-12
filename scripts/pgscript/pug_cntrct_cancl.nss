void main()
{
object oPC = GetPCSpeaker();
object oContractee = GetLocalObject(oPC, "CONTRACTEE");
string sContract = GetCampaignString("starwars", "CONTRACT", oContractee);

FloatingTextStringOnCreature(GetName(oPC)+" has canceled a contract with the "+sContract, oPC, TRUE);
SetCampaignString("starwars", "CONTRACT", "", oPC);
SetCampaignString("starwars", "SIGNER", "", oPC);
ExecuteScript("pug_fac_set",oPC);
}
