int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int nMulti = GetLocalInt(oPC, "CMRC_SETSHOP_PAGE");
    int nCount = GetLocalInt(oPC, "CMRC_SETSHOP_COUNT");

    // Inspect local variables
    if(!(nMulti < nCount))
        return FALSE;
    if(!(GetIsObjectValid(GetLocalObject(oPC, "CMRC_SETSHOP_7")) == TRUE ))
        return FALSE;

    return TRUE;
}
