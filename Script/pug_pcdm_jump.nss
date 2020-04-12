void main()
{
object oPC = GetPCSpeaker();
object oTarget = GetLocalObject(oPC, "DM_TARGET");

AssignCommand(oPC, ActionJumpToLocation(GetLocation(oTarget)));
}
