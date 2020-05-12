// Increments appearances for an equipped weapon

#include "tlr_items_inc"

void main()
{
    object oNPC = OBJECT_SELF;
    object oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oNPC);
    if (oItem != OBJECT_INVALID) {
        RemakeShield(oNPC, oItem, PART_PREV);
    }
}
