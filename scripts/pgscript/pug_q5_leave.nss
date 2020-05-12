void main()
{
object oPC = GetLastUsedBy();
int nQuests = GetCampaignInt("starwars", "COMPLETED_QUESTS", oPC);

AssignCommand(OBJECT_SELF, ActionMoveAwayFromObject(GetPCSpeaker(), FALSE, 50.0));
DelayCommand(10.0, DestroyObject(OBJECT_SELF));
if (!(nQuests & 16) && GetLocalInt(oPC, "Q5_FOUND")==FALSE)
    {
    AddJournalQuestEntry("MistakenIdentity", 2, oPC, FALSE, FALSE, FALSE);
    SetLocalInt(oPC, "Q5_FOUND", TRUE);
    GiveXPToCreature(oPC, 200);
    }
}
