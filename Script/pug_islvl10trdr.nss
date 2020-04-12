int StartingConditional()
{

    // Restrict based on the player's class
    int nSmugs = GetLocalInt(GetPCSpeaker(), "SMUGGLE_COUNT");
    int iPassed = 0;
    if(GetHitDice(GetPCSpeaker()) >= 10 && GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "TraderBadge"))==TRUE && nSmugs < 10)
        iPassed = 1;
    if(iPassed == 0)
        return FALSE;

    return TRUE;
}
