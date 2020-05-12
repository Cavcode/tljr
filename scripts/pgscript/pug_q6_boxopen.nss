#include "nw_i0_tool"
void main()
{
object oPC = GetLastOpenedBy();
int nQuests = GetCampaignInt("starwars", "COMPLETED_QUESTS", oPC);

if (!(nQuests & 32) && !(HasItem(oPC, "pug_q6_artifact")) && !(HasItem(OBJECT_SELF, "pug_q6_artifact")) && GetHitDice(oPC)>14)
    {
    CreateItemOnObject("pug_q6_artifact", oPC);
    AddJournalQuestEntry("LostandFound", 2, oPC, FALSE, FALSE, FALSE);
    }
}
