
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
        object oTarget = GetItemActivatedTarget();
        SetLocalObject(oPC,"gy_dmwandTarget",oTarget);
        AssignCommand (oPC, ActionStartConversation (oPC, "gy_dmwand", TRUE,FALSE));
    }

    // * This code runs when the item is acquired
    // * Note that this event fires PCs only
    else if (nEvent == X2_ITEM_EVENT_ACQUIRE)
    {
        oPC = GetModuleItemAcquiredBy();
        oItem  = GetModuleItemAcquired();
     //   if (!GetIsDM(oPC))
      //      DestroyObject(oItem);
    }
}
