// Copy the model's main weapon to PC

object CopyItemAppearance(object oSourceWeap, object oTarget);

void main()
{
    object oNPC = OBJECT_SELF;
    object oPC = GetPCSpeaker();
    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    object oNPCItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oNPC);

    int iTop = GetItemAppearance(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oNPC), ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_TOP);
    int iMiddle = GetItemAppearance(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oNPC), ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_MIDDLE);
    int iBottom  = GetItemAppearance(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oNPC), ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_BOTTOM);

    //Copy the appearance
    object oNew = CopyItemAppearance(oNPCItem, oWeapon);
    SetLocalInt(oNew, "mil_EditingItem", TRUE);

    //Copy the item back to the PC
    object oOnPC = CopyItem(oNew, oPC, TRUE);
    DestroyObject(oNew);

    //Equip the item
       DelayCommand(0.5f, AssignCommand(oPC, ActionEquipItem(oOnPC, INVENTORY_SLOT_RIGHTHAND)));

    //Set item editable again
    DelayCommand(3.0f, DeleteLocalInt(oOnPC, "mil_EditingItem"));
}

object CopyItemAppearance(object oSourceWeap, object oCurrent)
{
    int iSourceWeapValue;
    object oNew;

////// Copy To Item
    oNew = CopyItem(oCurrent, GetPCSpeaker(), TRUE);
    DestroyObject(oCurrent);

////// Copy Colors
    // Top
    iSourceWeapValue = GetItemAppearance(oSourceWeap, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_TOP);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_TOP, iSourceWeapValue, TRUE);
    DestroyObject(oCurrent);

    // Middle
    iSourceWeapValue = GetItemAppearance(oSourceWeap, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_MIDDLE);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_MIDDLE, iSourceWeapValue, TRUE);
    DestroyObject(oCurrent);

    // Bottom
    iSourceWeapValue = GetItemAppearance(oSourceWeap, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_BOTTOM);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_BOTTOM, iSourceWeapValue, TRUE);
    DestroyObject(oCurrent);

////// Copy Design
    // Top
    iSourceWeapValue = GetItemAppearance(oSourceWeap, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_TOP);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_TOP, iSourceWeapValue, TRUE);
    DestroyObject(oCurrent);

    // Middle
    iSourceWeapValue = GetItemAppearance(oSourceWeap, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_MIDDLE);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_MIDDLE, iSourceWeapValue, TRUE);
    DestroyObject(oCurrent);

    // Bottom
    iSourceWeapValue = GetItemAppearance(oSourceWeap, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_BOTTOM);
    oCurrent = oNew;
    oNew = CopyItemAndModify(oCurrent, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_BOTTOM, iSourceWeapValue, TRUE);
    DestroyObject(oCurrent);

    return oNew;
}
