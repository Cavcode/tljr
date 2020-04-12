int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oItem = GetFirstItemInInventory(oPC);
    int nCount=0;

    while (GetIsObjectValid(oItem)==TRUE)
        {
        if (GetStringLeft(GetTag(oItem), 6) == "spice_")
            {
            nCount = nCount+1;
            }
        oItem = GetNextItemInInventory(oPC);
        }

    if (nCount > 0){return TRUE;}
    else {return FALSE;}

    /*if(!GetIsObjectValid(GetItemPossessedBy(oTarget, "spice_"+"**")) == TRUE ))
        return FALSE;

    return TRUE;*/
}
