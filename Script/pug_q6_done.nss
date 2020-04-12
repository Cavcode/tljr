void main()
{
    object oPC = GetPCSpeaker();
    //These one shot quests use bitwise, so they are all stored in this variable here
    int nQuests = GetCampaignInt("starwars", "COMPLETED_QUESTS", oPC);
    int nThisQuest = GetLocalInt(OBJECT_SELF, "QUEST");
    int nGold = GetLocalInt(OBJECT_SELF, "GOLD");
    int nXP = GetLocalInt(OBJECT_SELF, "XP");

    if (!(nQuests & nThisQuest))
        {
        SetCampaignInt("starwars", "COMPLETED_QUESTS", nQuests+nThisQuest,GetPCSpeaker());
        GiveGoldToCreature(oPC, nGold);
        GiveXPToCreature(oPC, nXP);
        }

    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "pug_q6_artifact");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);

}
