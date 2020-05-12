int StartingConditional()
{
    int iResult;

    object oItem = GetItemInSlot(INVENTORY_SLOT_CHEST);


    iResult = GetIsObjectValid(oItem);
    return iResult;
}
