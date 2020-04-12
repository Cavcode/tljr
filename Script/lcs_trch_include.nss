int lcs_GetNextValidTorchModel(object oItem)
{
    int nCurrentAppearance = GetItemAppearance(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0);
    if(nCurrentAppearance == 6)
    {
        return 9;
    }
    else if(nCurrentAppearance == 10)
    {
        return 20;
    }
    else if(nCurrentAppearance == 20)
    {
        return 0;
    }
    else
    {
        return nCurrentAppearance + 1;
    }
}

int lcs_GetPreviousValidTorchModel(object oItem)
{
    int nCurrentAppearance = GetItemAppearance(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0);
    if(nCurrentAppearance == 9)
    {
        return 6;
    }
    else if(nCurrentAppearance == 20)
    {
        return 10;
    }
    else if(nCurrentAppearance == 0)
    {
        return 20;
    }
    else
    {
        return nCurrentAppearance - 1;
    }
}

void lcs_ModifyandEquipNewTorch(object oItem, int nAppearance)
{
    object oPC = GetItemPossessor(oItem);
    object oNewItem = CopyItemAndModify(oItem, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, nAppearance);
    DestroyObject(oItem);
    SetCommandable(TRUE, oPC);
    AssignCommand(oPC, ActionEquipItem(oNewItem, INVENTORY_SLOT_LEFTHAND));
}
