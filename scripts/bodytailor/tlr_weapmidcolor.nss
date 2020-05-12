// Changes the color on an equipped weapon

#include "tlr_items_inc"

void main()
{
    object oNPC = OBJECT_SELF;
    object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oNPC);
    if (oItem != OBJECT_INVALID) {
        ColorItem(oNPC, oItem, ITEM_APPR_WEAPON_MODEL_MIDDLE, COLOR_NEXT);
    }
}
