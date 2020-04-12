int StartingConditional()
{
    if(GetIsDM(GetPCSpeaker())) return TRUE;
    if(GetCampaignString("cmrcgld", "OWNER_"+GetTag(OBJECT_SELF)) == GetName(GetPCSpeaker()) )
        return FALSE;
   // if(!(GetCampaignString("cmrcgld", "OWNER_"+GetTag(OBJECT_SELF)) == GetName(GetPCSpeaker())) && GetIsDM(GetPCSpeaker()) == FALSE)
    //    return FALSE;

    return TRUE;
}
