int StartingConditional()
{
    //These one shot quests use bitwise, so they are all stored in this variable here
    int nQuests = GetCampaignInt("starwars", "COMPLETED_QUESTS", GetPCSpeaker());
    int nThisQuest = GetLocalInt(OBJECT_SELF, "QUEST");

    //Did we finish this quest already?
    if (nQuests & nThisQuest)
        //Yes we did so lets show the greeting this condtion is on
        {return TRUE;}
    else{return FALSE;}
}
