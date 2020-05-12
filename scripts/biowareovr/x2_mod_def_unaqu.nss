//::///////////////////////////////////////////////
//:: Example XP2 OnItemUnAcquireScript
//:: x2_mod_def_unaqu
//:: (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Put into: OnItemUnAcquire Event

*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-07-16
//:://////////////////////////////////////////////
#include "x2_inc_switches"
void main()
{
     object oItem = GetModuleItemLost();
     object oPC = GetModuleItemLostBy();

     // * Generic Item Script Execution Code
     // * If MODULE_SWITCH_EXECUTE_TAGBASED_SCRIPTS is set to TRUE on the module,
     // * it will execute a script that has the same name as the item's tag
     // * inside this script you can manage scripts for all events by checking against
     // * GetUserDefinedItemEventNumber(). See x2_it_example.nss
     if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
     {
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_UNACQUIRE);
        int nRet =   ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem),OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
        {
           return;
        }

     }

if (GetStringLeft(GetTag(oItem),6) ==  "spice_")
    {
    string sBuyer = GetStringRight(GetStringLeft(GetTag(oItem),11), 5);
    int nRep = GetCampaignInt("starwars", "REPUTATION_"+sBuyer, oPC);
    if (nRep > -10 && GetIsObjectValid(oItem)==TRUE)
        {
        SetCampaignInt("starwars", "REPUTATION_"+sBuyer, nRep - 2, oPC);
        SendMessageToPC(oPC, "Your Reputation with this Buyer has Decreased");
        }
    DestroyObject(oItem);
    }

if (GetBaseItemType(oItem) == BASE_ITEM_GOLD)
    {
    int nGold = GetLocalInt(oPC, "CMRC_INITIAL_GOLD");
    SetLocalInt(oPC, "CMRC_INITIAL_GOLD", GetGold(oPC));
    }
else
    {
    if (GetGold(oPC)<GetLocalInt(oPC, "CMRC_INITIAL_GOLD"))
        {SetLocalInt(oPC, "CMRC_INITIAL_GOLD", GetGold(oPC));}
    }
}
