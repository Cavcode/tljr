//::///////////////////////////////////////////////
//:: FileName qx_convo_tool_c3
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/4/2008 3:38:46 AM
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    // Don't allow crawling if robe equipped.
    int iPassed = 0;
    //if(GetLevelByClass(CLASS_TYPE_MONK, GetPCSpeaker()) >= 6)
    if(GetItemAppearance(GetItemInSlot(INVENTORY_SLOT_CHEST, oPC), ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_ROBE) == 0 && GetPhenoType(oPC) != 22)
        iPassed = 1;
    if(iPassed == 0)
        return FALSE;

    return TRUE;
}
