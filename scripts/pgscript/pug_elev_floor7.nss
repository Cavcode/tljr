void main()
{
object oPC = GetPCSpeaker();
location lFloor = GetLocation(GetWaypointByTag(GetTag(OBJECT_SELF)+"_7"));
AssignCommand(oPC,ActionJumpToLocation(lFloor));
}
