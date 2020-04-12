void main()
{
object oPC = GetPCSpeaker();
location lFloor = GetLocation(GetWaypointByTag(GetTag(OBJECT_SELF)+"_1"));
AssignCommand(oPC,ActionJumpToLocation(lFloor));
}
