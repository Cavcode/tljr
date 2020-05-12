int StartingConditional()
{
    int iResult;

    object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);

    iResult = GetIsObjectValid(oItem);
    return iResult;
}
