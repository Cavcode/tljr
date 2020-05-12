void main()
{
object oPC = GetPCSpeaker();
object oContractee = GetLocalObject(oPC, "CONTRACTEE");
string sFaction;

if (GetIsObjectValid(GetItemPossessedBy(oPC, "RebelAllianceID"))==TRUE)
    {
    sFaction = "Rebels";
    }
else if (GetIsObjectValid(GetItemPossessedBy(oPC, "GalaticEmpireID"))==TRUE)
    {
    sFaction = "Empire";
    }
SetCampaignString("starwars", "CONTRACT", sFaction, oContractee);
SetCampaignString("starwars", "SIGNER", GetName(oPC), oContractee);
ExecuteScript("pug_fac_set",oContractee);
FloatingTextStringOnCreature(GetName(oContractee)+" has signed a contract with "+GetName(oPC)+" for the "+sFaction, oContractee, TRUE);
}
