// This script removes all items from the inventory of the placeable

void main() {

    int bDestroyed;

    object oItem = GetFirstItemInInventory(OBJECT_SELF);
    while (GetIsObjectValid(oItem)) {
        DestroyObject(oItem);
        oItem = GetNextItemInInventory(OBJECT_SELF);
        bDestroyed = TRUE;
    }

    if (bDestroyed) {
        effect eDestruction = EffectVisualEffect(VFX_IMP_DESTRUCTION);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDestruction, OBJECT_SELF);
    }
}
