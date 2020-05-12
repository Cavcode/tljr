int StartingConditional()
{
    int iResult;

    object oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND);

    iResult = GetIsObjectValid(oItem);

    if(iResult)
    {
        int nBaseItemType = GetBaseItemType(oItem);
        if(((nBaseItemType == BASE_ITEM_SMALLSHIELD) || (nBaseItemType == BASE_ITEM_LARGESHIELD)) || (nBaseItemType == BASE_ITEM_TOWERSHIELD))
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
