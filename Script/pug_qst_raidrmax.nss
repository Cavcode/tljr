int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "QUEST_RAIDERS") == 5 && GetCampaignInt("starwars", "QUEST_SHIP_DONE", GetPCSpeaker()) == FALSE))
        return FALSE;

    return TRUE;
}
