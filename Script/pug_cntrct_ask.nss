void main()
{
object oPC = GetPCSpeaker();
object oTarget = GetLocalObject(oPC, "TARGET");
string sFaction;


if (GetIsObjectValid(GetItemPossessedBy(oTarget, "RebelAllianceID"))==TRUE)
    {
    sFaction = "Rebels";
    SetLocalObject(oTarget, "CONTRACTEE", oPC);
    SetCustomToken(2211223, GetName(oPC)+" has requested for you to sign a contract for "+GetName(oPC)+"'s mercenary services to the "+sFaction);
    AssignCommand(oTarget, ClearAllActions(FALSE));
    AssignCommand(oTarget, ActionStartConversation (oTarget, "pug_contract_ask", TRUE,FALSE));
    }
if (GetIsObjectValid(GetItemPossessedBy(oTarget, "GalaticEmpireID"))==TRUE)
    {
    sFaction = "Empire";
    SetLocalObject(oTarget, "CONTRACTEE", oPC);
    SetCustomToken(2211223, GetName(oPC)+" has requested for you to sign a contract for "+GetName(oPC)+"'s mercenary services to the "+sFaction);
    AssignCommand(oTarget, ClearAllActions(FALSE));
    AssignCommand(oTarget, ActionStartConversation (oTarget, "pug_contract_ask", TRUE,FALSE));
    }
}
