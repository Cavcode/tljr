int StartingConditional()
{
    if(GetHitDice(GetPCSpeaker()) >= 19)
        {return TRUE;}
    if(GetHitDice(GetPCSpeaker()) <= 13)
        {return TRUE;}
    else
        {return FALSE;}
}
