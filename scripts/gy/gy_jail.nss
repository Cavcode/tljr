
#include "x2_inc_switches"

void main()
{
    int nEvent =GetUserDefinedItemEventNumber();
    object oPC;
    object oItem;
    // * This code runs when the Unique Power property of the item is used
    // * Note that this event fires PCs only
    if (nEvent ==X2_ITEM_EVENT_ACTIVATE)
    {
        oPC   = GetItemActivator();
        oItem = GetItemActivated();
        int bWasStunned = FALSE;
        object oTarget = GetItemActivatedTarget();
        object oJail = GetObjectByTag("Jail");
        AssignCommand(oTarget, JumpToObject(oJail));
        effect eStun = EffectStunned();
        effect eTest = GetFirstEffect(oTarget);
        while (GetIsEffectValid(eTest))
        {
            if  (GetEffectType(eTest) == 29)
            {
                RemoveEffect(oTarget,eTest);
                bWasStunned = TRUE;
            }
            eTest = GetNextEffect(oTarget);
        }
        if (!bWasStunned)
        {
            eStun = SupernaturalEffect(eStun);
            DelayCommand(2.0,ApplyEffectToObject(DURATION_TYPE_PERMANENT,eStun,oTarget));
        }
    }

    // * This code runs when the item is acquired
    // * Note that this event fires PCs only
    else if (nEvent == X2_ITEM_EVENT_ACQUIRE)
    {
        oPC = GetModuleItemAcquiredBy();
        oItem  = GetModuleItemAcquired();
        if (!GetIsDM(oPC))
            DestroyObject(oItem);
    }
}
