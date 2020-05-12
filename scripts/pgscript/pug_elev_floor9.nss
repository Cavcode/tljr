void main()
{
object oPC = GetPCSpeaker();
location lFloor = GetLocation(GetWaypointByTag(GetTag(OBJECT_SELF)+"_9"));
AssignCommand(oPC,ActionJumpToLocation(lFloor));
}
