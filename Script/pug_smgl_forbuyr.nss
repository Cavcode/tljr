int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oItem = GetFirstItemInInventory(oPC);
    int nCount=0;
    string sBuyer = GetStringRight(GetTag(OBJECT_SELF), 5);

    while (GetIsObjectValid(oItem)==TRUE)
        {
        if (GetStringLeft(GetTag(oItem), 11) == "spice_"+sBuyer)
            {
            nCount = nCount+1;
            }
        oItem = GetNextItemInInventory(oPC);
        }

    if (nCount > 0){return TRUE;}
    else {return FALSE;}

   /* if(!HasItem(GetPCSpeaker(), "spice_Jabba**"))
        return FALSE;

    return TRUE;  */
}
