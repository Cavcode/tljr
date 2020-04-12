#include "x2_inc_switches"
#include "x2_inc_intweapon"
#include "pug_feats"
void main()
{
     object oItem = GetPCItemLastUnequipped();
     object oPC = GetPCItemLastUnequippedBy();


    if (GetStringLeft(GetTag(oItem), 4) == "Dual" && GetBaseItemType(oItem) == BASE_ITEM_SLING)
        {
        object oOther = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
        DestroyObject(oOther);
        }
    else if (GetTag(oItem) == "secondweapon")
        {
        object oOther = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
        AssignCommand(oPC, ActionUnequipItem(oOther));
        DestroyObject(oItem);
        }

    // -------------------------------------------------------------------------
    //  Intelligent Weapon System
    // -------------------------------------------------------------------------
    if (IPGetIsIntelligentWeapon(oItem))
    {
            IWSetIntelligentWeaponEquipped(oPC,OBJECT_INVALID);
            IWPlayRandomUnequipComment(oPC,oItem);
    }

     // -------------------------------------------------------------------------
     // Generic Item Script Execution Code
     // If MODULE_SWITCH_EXECUTE_TAGBASED_SCRIPTS is set to TRUE on the module,
     // it will execute a script that has the same name as the item's tag
     // inside this script you can manage scripts for all events by checking against
     // GetUserDefinedItemEventNumber(). See x2_it_example.nss
     // -------------------------------------------------------------------------
     if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
     {
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_UNEQUIP);
        int nRet =   ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem),OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
        {
           return;
        }

     }
CheckFeats(oPC);
}
