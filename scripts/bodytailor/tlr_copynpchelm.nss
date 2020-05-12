// Copy NPC Helmet to the PC

object oPC = GetPCSpeaker();
object oNPC = OBJECT_SELF;
object CopyItemAppearance(object oSourceHelm, object oTarget);

void main()
{
    object oNPCItem = GetItemInSlot(INVENTORY_SLOT_HEAD, oNPC);
    object oPCItem = GetItemInSlot(INVENTORY_SLOT_HEAD, oPC);

    // Copy the appearance
    object oNew = CopyItemAppearance(oNPCItem, oPCItem);
    SetLocalInt(oNew, "mil_EditingItem", TRUE);

    // Copy the helmet back to the PC
    object oOnPC = CopyItem(oNew, oPC, TRUE);
    DestroyObject(oNew);

    // Equip the helmet
    DelayCommand(0.5f, AssignCommand(oPC, ActionEquipItem(oOnPC, INVENTORY_SLOT_HEAD)));

    // Set helmet editable again
    DelayCommand(3.0f, DeleteLocalInt(oOnPC, "mil_EditingItem"));
}

object CopyItemAppearance(object oSourceHelm, object oTarget) {
    object oHead = GetObjectByTag("ClothingBuilder");

    int iSourceHelmValue;
    object oCurrent, oNew;

////// Copy To Helmet
    oCurrent = oTarget;
    oNew = CopyItem(oCurrent, oHead, TRUE);
    DestroyObject(oCurrent);

////// Copy Colors
    // Cloth 1
    iSourceHelmValue = GetItemAppearance(oSourceHelm, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH1);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH1, iSourceHelmValue, TRUE);
    DestroyObject(oCurrent);

    // Cloth 2
    iSourceHelmValue = GetItemAppearance(oSourceHelm, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH2);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH2, iSourceHelmValue, TRUE);
    DestroyObject(oCurrent);

    // Leather 1
    iSourceHelmValue = GetItemAppearance(oSourceHelm, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER1);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER1, iSourceHelmValue, TRUE);
    DestroyObject(oCurrent);

    // Leather 2
    iSourceHelmValue = GetItemAppearance(oSourceHelm, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER2);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER2, iSourceHelmValue, TRUE);
    DestroyObject(oCurrent);

    // Metal 1
    iSourceHelmValue = GetItemAppearance(oSourceHelm, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL1);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL1, iSourceHelmValue, TRUE);
    DestroyObject(oCurrent);

    // Metal 2
    iSourceHelmValue = GetItemAppearance(oSourceHelm, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL2);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL2, iSourceHelmValue, TRUE);
    DestroyObject(oCurrent);


////// Copy Design
    // Helmet
    iSourceHelmValue = GetItemAppearance(oSourceHelm, ITEM_APPR_TYPE_ARMOR_MODEL, 0);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_MODEL, 0, iSourceHelmValue, TRUE);
    DestroyObject(oCurrent);

    return oNew;
}
