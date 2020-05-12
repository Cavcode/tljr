void main()
{
object oPC = GetLastUsedBy();
int nQuests = GetCampaignInt("starwars", "COMPLETED_QUESTS", oPC);
object oDroid = GetNearestObjectByTag("DocCorpse", oPC);

if (!(nQuests & 2) && GetLocalInt(oPC, "Q2_FOUND")==FALSE)
    {
    AddJournalQuestEntry("JungleFever", 2, oPC, FALSE, FALSE, FALSE);
    SetLocalInt(oPC, "Q2_FOUND", TRUE);
    GiveXPToCreature(oPC, 50);
    AssignCommand(oDroid, ActionSpeakString("*You retrieve what appears to be a vaccine*", TALKVOLUME_TALK));
    }
}
