int StartingConditional()
{

    int iPassed = 0;
    if(GetHitDice(GetPCSpeaker()) >= 27)
        iPassed = 1;
    if(GetHitDice(GetPCSpeaker()) <= 18)
        iPassed = 1;
    if(iPassed == 0)
        return FALSE;

    return TRUE;
}
