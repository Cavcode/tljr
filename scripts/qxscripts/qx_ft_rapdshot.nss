void main()
{
    object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);

    if ((GetBaseItemType(oItem) == BASE_ITEM_LONGBOW) || (GetBaseItemType(oItem) == BASE_ITEM_SHORTBOW) ||
            (GetBaseItemType(oItem) == BASE_ITEM_SLING) || (GetBaseItemType(oItem) == BASE_ITEM_LIGHTCROSSBOW))
    {
        if (GetLocalInt(OBJECT_SELF, "IMPRAPID_SHOT") != TRUE)
        {
            SetLocalInt(OBJECT_SELF, "IMPRAPID_SHOT", TRUE);
            FloatingTextStringOnCreature("Improved Rapid Shot Activated", OBJECT_SELF);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectModifyAttacks(2), OBJECT_SELF);
        }
        else
        {
            SetLocalInt(OBJECT_SELF, "IMPRAPID_SHOT", FALSE);
            RemoveEffect(OBJECT_SELF,EffectModifyAttacks(2));
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectModifyAttacks(-2), OBJECT_SELF);
            FloatingTextStringOnCreature("Improved Rapid Shot Deactivated", OBJECT_SELF);
        }
    }
    else
    {
        SendMessageToPC(OBJECT_SELF, "You must have a blaster pistol or light blaster rifle equipped to use this ability.");
    }
}
