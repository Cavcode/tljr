void main()
{

object oPC = GetLastUsedBy();

object oTarget = GetWaypointByTag("NarRoof2ToApartment2");
location lTarget = GetLocation(oTarget);

if (GetAreaFromLocation(lTarget)==OBJECT_INVALID) return;

AssignCommand(oPC, ActionJumpToLocation(lTarget));
}
