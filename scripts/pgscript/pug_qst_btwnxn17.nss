int StartingConditional()
{

    int iPassed = 0;
    if(GetHitDice(GetPCSpeaker()) >= 17)
        iPassed = 1;
    if(GetHitDice(GetPCSpeaker()) <= 10)
        iPassed = 1;
    if(iPassed == 0)
        return FALSE;

    return TRUE;
}
