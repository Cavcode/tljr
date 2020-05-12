int StartingConditional()
{
    if(GetSubRace(GetPCSpeaker()) == "Human")
        return TRUE;
    else if(GetSubRace(GetPCSpeaker()) == "" && GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_HUMAN)
        return TRUE;

    else return FALSE;
}
