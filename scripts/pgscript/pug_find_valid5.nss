int StartingConditional()
{
    int x = 5;

    int nPage = GetLocalInt(OBJECT_SELF, "INFO_PAGE");

    if (GetIsObjectValid(GetLocalObject(OBJECT_SELF, "INFO_PERSON_"+IntToString(x+nPage))) == TRUE)
    {return TRUE;}
    else{return FALSE;}
}
