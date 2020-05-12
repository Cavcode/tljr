int StartingConditional()
{
    int nThisQuest = 16;
object oPC = GetLastUsedBy();
int nQuests = GetCampaignInt("starwars", "COMPLETED_QUESTS", oPC);
    // Inspect local variables
if (!(nQuests & 16) && GetLocalInt(oPC, "Q5_FOUND")==FALSE)
    {
    if(!(GetLocalInt(GetPCSpeaker(), "Q"+IntToString(nThisQuest)+"_STARTED") == 1))
        return FALSE;
     }
    return TRUE;
}
