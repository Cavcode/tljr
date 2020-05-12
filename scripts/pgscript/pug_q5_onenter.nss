void main()
{
object oPC = GetEnteringObject();
int nQuests = GetCampaignInt("starwars", "COMPLETED_QUESTS", oPC);
ExploreAreaForPlayer(GetArea(oPC), oPC, TRUE);

if (!(nQuests & 16) && GetLocalInt(oPC, "Q5_FOUND")==FALSE && GetLocalInt(oPC, "Q16_STARTED") == 1 && GetIsObjectValid(GetObjectByTag("Contact_q5"))==FALSE)
    {
    CreateObject(OBJECT_TYPE_CREATURE,"grancontact",GetLocation(GetWaypointByTag("Q5_SPAWN_1")), FALSE, "Contact_q5");
    }

if (GetIsObjectValid(GetWaypointByTag(GetTag(OBJECT_SELF)+"_SPAWN")) && GetLocalInt(OBJECT_SELF, "SETUP") == FALSE )
    {
    ExecuteScript("pug_dfnd_onenter", OBJECT_SELF);
    }


}

