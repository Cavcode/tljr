#include "pug_inc"

void main()
{
    object oPC = GetEnteringObject();

    //This will set any opposite faction members to hate you and vice versa
    PCFactions(oPC, GetFaction(oPC, TRUE), "");

    if (GetIsObjectValid(GetWaypointByTag(GetTag(OBJECT_SELF)+"_SPAWN")) && GetLocalInt(OBJECT_SELF, "SETUP") == FALSE)
        {
        ExecuteScript("pug_dfnd_onenter", OBJECT_SELF);
        }
}
