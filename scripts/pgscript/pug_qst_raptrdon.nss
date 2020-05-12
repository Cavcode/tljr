int StartingConditional()
{

    // Inspect local variables
    if(!(GetCampaignInt("starwars", "QUEST_SHIP_DONE", GetPCSpeaker()) == TRUE))
        return FALSE;

    return TRUE;
}
