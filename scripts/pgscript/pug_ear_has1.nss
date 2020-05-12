int StartingConditional()
{

    if(!GetIsObjectValid(GetLocalObject(GetPCSpeaker(), "EAR_TRADE_1")) == TRUE)
        return FALSE;

    return TRUE;
}
