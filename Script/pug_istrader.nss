int StartingConditional()
{
    int iPassed = 0;
    if(GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "TraderBadge"))==TRUE)
        iPassed = 1;
    if(iPassed == 0)
        return FALSE;

    return TRUE;
}
