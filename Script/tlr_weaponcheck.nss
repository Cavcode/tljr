int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if(GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC))
        && GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF)))
    return TRUE;

 return FALSE;
}
