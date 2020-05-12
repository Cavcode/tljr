int StartingConditional()
{
    int iResult;

    object oItem = GetItemInSlot(INVENTORY_SLOT_HEAD);


    iResult = GetIsObjectValid(oItem);
    return iResult;
}
