int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int nMulti = GetLocalInt(oPC, "CMRC_SETSHOP_PAGE");
    // Inspect local variables
    if(!(GetIsObjectValid(GetLocalObject(oPC, "CMRC_SETSHOP_"+IntToString(2+nMulti))) == TRUE))
        return FALSE;

    return TRUE;
}
