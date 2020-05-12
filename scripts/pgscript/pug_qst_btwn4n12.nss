int StartingConditional()
{

    int iPassed = 0;
    if(GetHitDice(GetPCSpeaker()) >= 12)
        iPassed = 1;
    if(GetHitDice(GetPCSpeaker()) <= 4)
        iPassed = 1;
    if(iPassed == 0)
        return FALSE;

    return TRUE;
}
