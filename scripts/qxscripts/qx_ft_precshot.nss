
#include "X0_I0_SPELLS"
void main()
{
    object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);

    if ((GetBaseItemType(oItem) == BASE_ITEM_LONGBOW) || (GetBaseItemType(oItem) == BASE_ITEM_SHORTBOW) ||
            (GetBaseItemType(oItem) == BASE_ITEM_LIGHTCROSSBOW) || (GetBaseItemType(oItem) == BASE_ITEM_HEAVYCROSSBOW) ||
            (GetBaseItemType(oItem) == BASE_ITEM_SLING))
    {
        int nBonus = 0;
        //nBonus = ArcaneArcherCalculateBonus() ;

        object oTarget = GetSpellTargetObject();

        if (GetIsObjectValid(oTarget) == TRUE && (oTarget != OBJECT_SELF))
        {
            //int nDamage = ArcaneArcherDamageDoneByBow() *2;
            int nDamage = d10(4);
            if (nDamage > 0)
            {
                //effect ePhysical = EffectDamage(nDamage, DAMAGE_TYPE_PIERCING,IPGetDamagePowerConstantFromNumber(nBonus));
                effect eMagic = EffectDamage(nBonus+nDamage, DAMAGE_TYPE_MAGICAL);

                //Fire cast spell at event for the specified target
                //SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, 601));

                //ApplyEffectToObject(DURATION_TYPE_INSTANT, ePhysical, oTarget);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eMagic, oTarget);
            }
        }
    }
    else
    {
        SendMessageToPC(OBJECT_SELF, "You must have a blaster equipped to use this ability.");
    }
}
