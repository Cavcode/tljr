int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "QUEST_BOSS_KILL") == TRUE && GetCampaignInt("starwars", "QUEST_SHIP_DONE", GetPCSpeaker()) == FALSE))
        return FALSE;

    return TRUE;
}
