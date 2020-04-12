int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sHouse = GetTag(OBJECT_SELF);
    string sOwner = GetCampaignString("swhouses", "OWNER_NAME_"+sHouse);
    string sID = GetCampaignString("swhouses", "OWNER_ID_"+sHouse);

    if (sOwner == GetName(oPC) && GetPCPlayerName(oPC) == sID)
        {
        return TRUE;
        }
    else
        {return FALSE;}
}
