void main()
{
object oPC = GetEnteringObject();
int nQuests = GetCampaignInt("starwars", "COMPLETED_QUESTS", oPC);
object oDroid = GetNearestObjectByTag("Broken", oPC);

if (!(nQuests & 1) && GetLocalInt(oPC, "Q1_FOUND")==FALSE)
    {
    AddJournalQuestEntry("DesertFarmer", 2, oPC, FALSE, FALSE, FALSE);
    SetLocalInt(oPC, "Q1_FOUND", TRUE);
    GiveXPToCreature(oPC, 50);
    AssignCommand(oDroid, ActionSpeakString("*This droid appears to have taken heavy blaster fire, likely from Tusken Raiders*", TALKVOLUME_TALK));
    }
}
