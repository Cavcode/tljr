int StartingConditional()
{
    int nMulti = GetLocalInt(GetPCSpeaker(), "CMRC_MULTIPLIER");
    // Inspect local variables
    if(!(GetIsObjectValid(GetLocalObject(GetPCSpeaker(), "CMRC_SHOP_NUM_"+IntToString(7))) == TRUE))
        return FALSE;

    return TRUE;
}
