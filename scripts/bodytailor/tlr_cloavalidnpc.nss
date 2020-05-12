// Check for Valid Cloak on NPC

int StartingConditional()
{
    object oModel = OBJECT_SELF;

    if(GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CLOAK, oModel)))
    return TRUE;

 return FALSE;
}
