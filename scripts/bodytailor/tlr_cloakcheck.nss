int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if(GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CLOAK, oPC))
        && GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CLOAK, OBJECT_SELF)))
    return TRUE;

 return FALSE;
}
