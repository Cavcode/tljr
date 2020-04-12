void main()
{
object oPC = GetEnteringObject();
ExploreAreaForPlayer(GetArea(oPC), oPC, TRUE);

if (GetIsObjectValid(GetWaypointByTag(GetTag(OBJECT_SELF)+"_SPAWN")) && GetLocalInt(OBJECT_SELF, "SETUP") == FALSE)
    {
    ExecuteScript("pug_dfnd_onenter", OBJECT_SELF);
    }
}
