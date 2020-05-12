// Copy NPC Cloak To PC

object oPC = GetPCSpeaker();
object oNPC = OBJECT_SELF;
object CopyItemAppearance(object oSourceCloak, object oTarget);

void main()
{
    object oNPCItem = GetItemInSlot(INVENTORY_SLOT_CLOAK, oNPC);
    object oPCItem = GetItemInSlot(INVENTORY_SLOT_CLOAK, oPC);

    // Copy the appearance
    object oNew = CopyItemAppearance(oNPCItem, oPCItem);
    SetLocalInt(oNew, "mil_EditingItem", TRUE);

    // Copy the cloak back to the PC
    object oOnPC = CopyItem(oNew, oPC, TRUE);
    DestroyObject(oNew);

    // Equip the cloak
    DelayCommand(0.5f, AssignCommand(oPC, ActionEquipItem(oOnPC, INVENTORY_SLOT_CLOAK)));

    // Set cloak editable again
    DelayCommand(3.0f, DeleteLocalInt(oOnPC, "mil_EditingItem"));
}

object CopyItemAppearance(object oSourceCloak, object oTarget) {
    object oCloak = GetObjectByTag("ClothingBuilder");

    int iSourceCloakValue;
    object oCurrent, oNew;

////// Copy To Cloak
    oCurrent = oTarget;
    oNew = CopyItem(oCurrent, oCloak, TRUE);
    DestroyObject(oCurrent);

////// Copy Colors
    // Cloth 1
    iSourceCloakValue = GetItemAppearance(oSourceCloak, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH1);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH1, iSourceCloakValue, TRUE);
    DestroyObject(oCurrent);

    // Cloth 2
    iSourceCloakValue = GetItemAppearance(oSourceCloak, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH2);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH2, iSourceCloakValue, TRUE);
    DestroyObject(oCurrent);

    // Leather 1
    iSourceCloakValue = GetItemAppearance(oSourceCloak, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER1);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER1, iSourceCloakValue, TRUE);
    DestroyObject(oCurrent);

    // Leather 2
    iSourceCloakValue = GetItemAppearance(oSourceCloak, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER2);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER2, iSourceCloakValue, TRUE);
    DestroyObject(oCurrent);

    // Metal 1
    iSourceCloakValue = GetItemAppearance(oSourceCloak, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL1);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL1, iSourceCloakValue, TRUE);
    DestroyObject(oCurrent);

    // Metal 2
    iSourceCloakValue = GetItemAppearance(oSourceCloak, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL2);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL2, iSourceCloakValue, TRUE);
    DestroyObject(oCurrent);


////// Copy Design
    // Cloak
    iSourceCloakValue = GetItemAppearance(oSourceCloak, ITEM_APPR_TYPE_SIMPLE_MODEL, 0);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_SIMPLE_MODEL, 0, iSourceCloakValue, TRUE);
    DestroyObject(oCurrent);

    return oNew;
}
