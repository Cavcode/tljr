
int StartingConditional()
{
 if (GetTag(GetPCSpeaker())=="Anchorman")
    return TRUE;
 if (GetIsDM(GetPCSpeaker())== TRUE)
    return TRUE;
 if (GetIsDMPossessed(GetPCSpeaker())==TRUE)
    return TRUE;

    else return FALSE;
}
