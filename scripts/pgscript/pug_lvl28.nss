
int StartingConditional()
{
    int iPassed = 0;
    if(GetHitDice(GetPCSpeaker()) >= 28)
        iPassed = 1;
    if(iPassed == 0)
        return FALSE;

    return TRUE;
}
