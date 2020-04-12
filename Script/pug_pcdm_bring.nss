void main()
{
object oPC = GetPCSpeaker();
object oTarget = GetLocalObject(oPC, "DM_TARGET");

AssignCommand(oTarget, ActionJumpToLocation(GetLocation(oPC)));
}
