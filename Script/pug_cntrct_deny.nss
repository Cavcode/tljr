void main()
{
object oPC = GetPCSpeaker();
object oContractee = GetFirstPC();
string sFaction;
string sContractee = GetLocalString(oPC, "CONTRACTEE");

while(GetPCPublicCDKey(oContractee) != sContractee)
    {
    oContractee = GetNextPC();
    }

if (GetIsObjectValid(GetItemPossessedBy(oContractee, "RebelAllianceID"))==TRUE)
    {
    sFaction = "Rebels";
    }
if (GetIsObjectValid(GetItemPossessedBy(oContractee, "GalaticEmpireID"))==TRUE)
    {
    sFaction = "Empire";
    }

FloatingTextStringOnCreature(GetName(oContractee)+" has refused to sign a contract with "+GetName(oPC)+" for the "+sFaction, oContractee, TRUE);
}
