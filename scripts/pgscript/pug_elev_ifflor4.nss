int StartingConditional()
{
string sTag = GetTag(OBJECT_SELF);
object oWP = GetWaypointByTag(sTag+"_4");
object oArea = GetAreaFromLocation(GetLocation(oWP));
return GetIsObjectValid(oArea);

}
