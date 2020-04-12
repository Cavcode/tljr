int StartingConditional()
{
    int iResult;

    object oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND);

    iResult = GetIsObjectValid(oItem);

    if(iResult)
    {
        int nBaseItemType = GetBaseItemType(oItem);
        if(nBaseItemType == BASE_ITEM_TORCH)
        {
            return iResult;
        }
        else
        {
            return FALSE;
        }
    }
    else
    {
        return iResult;
    }
}
