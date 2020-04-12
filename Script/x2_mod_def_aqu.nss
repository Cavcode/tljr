//::///////////////////////////////////////////////
//:: Example XP2 OnItemAcquireScript
//:: x2_mod_def_aqu
//:: (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Put into: OnItemAcquire Event

*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-07-16
//:://////////////////////////////////////////////

#include "gy_base_inc"
#include "pug_inc"
#include "x2_inc_switches"
#include "qx_inc_spells"
void main()
{
     object oItem = GetModuleItemAcquired();
     object oPC = GetModuleItemAcquiredBy();
     object oRebels = GetObjectByTag("faction_rebels", 1);
     object oFringe = GetObjectByTag("faction_fringe", 1);
     object oEmpire = GetObjectByTag("faction_empire", 1);

     ConvertTrap(oItem, oPC);

     // * Generic Item Script Execution Code
     // * If MODULE_SWITCH_EXECUTE_TAGBASED_SCRIPTS is set to TRUE on the module,
     // * it will execute a script that has the same name as the item's tag
     // * inside this script you can manage scripts for all events by checking against
     // * GetUserDefinedItemEventNumber(). See x2_it_example.nss
     if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
     {
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_ACQUIRE);
        int nRet =   ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem),OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
        {
           return;
        }

     }
if (GetResRef(oItem)=="pug_spice")
    {
    float fTimer = IntToFloat(Random(90));
    //DelayCommand(250.0+fTimer, AttackTime(oPC, oItem));
    }
}
