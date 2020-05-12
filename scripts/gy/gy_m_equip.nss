//::///////////////////////////////////////////////
//:: zep_onequip
//:: based pm functions (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Put into: OnEquip Event
*/
//:://////////////////////////////////////////////
//:: Original Bioware functions Created By: Georg Zoeller
//:: Created On: 2003-07-16
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Modified by: Loki Hakanin, CEP Anatomy
//:://////////////////////////////////////////////
#include "x2_inc_switches"
#include "x2_inc_intweapon"
//Following includes Added by Loki of CEP
//First is for advanced Itemprop functions of hordes
//Second is my own CEP Include file.
#include "x2_inc_itemprop"
#include "zep_inc_main2"
#include "pug_feats"

void CheckShield (object oPC);

void main()
{

    object oItem = GetPCItemLastEquipped();
    object oPC   = GetPCItemLastEquippedBy();
    // -------------------------------------------------------------------------
    // Intelligent Weapon System
    // -------------------------------------------------------------------------

    //if (GetStringLeft(GetTag(oItem), 4) == "Dual" && GetBaseItemType(oItem) == BASE_ITEM_SLING)
    //    {
    //    object oOther = CreateItemOnObject("secondweapon", oPC, 1);
    //    AssignCommand(oPC, ActionEquipItem(oOther, INVENTORY_SLOT_LEFTHAND));
    //    }

    //If lightsaber then play ignite sound
    //if ((GetBaseItemType(oItem) == BASE_ITEM_SHORTSWORD) || (GetBaseItemType(oItem) == BASE_ITEM_GREATSWORD) || (GetBaseItemType(oItem) == BASE_ITEM_TWOBLADEDSWORD))
    //{
    //    SendMessageToPC(oPC, "Lightsaber ignited.");
    //    AssignCommand(oPC, PlaySound("saberon"));
    //}


    // Speederbikes, do not allow bolt ammunition to be equipped while on a speederbike.
    /*if (GetPhenoType(oPC) == 22)
    {
        if (GetBaseItemType(oItem) == BASE_ITEM_BOLT)
        {
            AssignCommand(oPC,ActionUnequipItem(oItem));
        }
    }*/

    // Dual blaster - create offhand blaster
    if (GetBaseItemType(oItem) == BASE_ITEM_SLING)
    {
        // loop through changing all 3 parts and all 3 colors to match equipped item
        if (GetTag(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC)) == "DELETEME")
        {
            DestroyObject(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC));
        }
        int i;
        object oOther2;
        object oOther = CreateItemOnObject("offhandblaster", oPC, 1, "DELETEME");
        for (i = 0; i < 6; i++)
        {
            switch (i)
            {
                case 0:
                    oOther2 = CopyItemAndModify(oOther, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_TOP,
                                        GetItemAppearance( oItem, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_TOP));
                    DestroyObject(oOther);
                    break;
                case 1:
                    oOther = CopyItemAndModify(oOther2, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_MIDDLE,
                                        GetItemAppearance( oItem, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_MIDDLE));
                    DestroyObject(oOther2);
                    break;
                case 2:
                    oOther2 = CopyItemAndModify(oOther, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_BOTTOM,
                                        GetItemAppearance( oItem, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_BOTTOM));
                    DestroyObject(oOther);
                    break;
                case 3:
                    oOther = CopyItemAndModify(oOther2, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_TOP,
                                        GetItemAppearance( oItem, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_TOP));
                    DestroyObject(oOther2);
                    break;
                case 4:
                    oOther2 = CopyItemAndModify(oOther, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_MIDDLE,
                                        GetItemAppearance( oItem, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_MIDDLE));
                    DestroyObject(oOther);
                    break;
                case 5:
                    oOther = CopyItemAndModify(oOther2, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_BOTTOM,
                                        GetItemAppearance( oItem, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_BOTTOM));
                    DestroyObject(oOther2);
                    break;
                default:
                    SendMessageToPC(oPC, "Error in creating offhand blaster, please post this message on the forums.");
                    break;
            }
        }
        //SendMessageToPC(oPC,"Tag on oOther final is: " + GetTag(oOther));
        AssignCommand(oPC, ActionEquipItem(oOther, INVENTORY_SLOT_LEFTHAND));
    }
//if (GetBaseItemType(oItem) == BASE_ITEM_TOWERSHIELD && GetAbilityScore(oPC, ABILITY_STRENGTH, FALSE)<20)
  //  {
    //AssignCommand(oPC, ActionUnequipItem(oItem));
    //SendMessageToPC(oPC, "You require 20 strength to use this shield.");
    //}
//if (GetBaseItemType(oItem) == BASE_ITEM_LARGESHIELD && GetAbilityScore(oPC, ABILITY_STRENGTH, FALSE)<18)
   // {
    //AssignCommand(oPC, ActionUnequipItem(oItem));
    //SendMessageToPC(oPC, "You require 18 strength to use this shield.");
    //}
if (GetTag(oItem) == "pug_disguise")
    {
    DelayCommand(2.0,ExecuteScript("pug_fac_set", oPC));
    }
    if (IPGetIsIntelligentWeapon(oItem))
    {
        IWSetIntelligentWeaponEquipped(oPC,oItem);
        // prevent players from reequipping their weapon in
        if (IWGetIsInIntelligentWeaponConversation(oPC))
        {
                object oConv =   GetLocalObject(oPC,"X2_O_INTWEAPON_SPIRIT");
                IWEndIntelligentWeaponConversation(oConv, oPC);
        }
        else
        {
            //------------------------------------------------------------------
            // Trigger Drain Health Event
            //------------------------------------------------------------------
            if (GetLocalInt(oPC,"X2_L_ENSERRIC_ASKED_Q3")==1)
            {
                ExecuteScript ("x2_ens_dodrain",oPC);
            }
            else
            {
                IWPlayRandomEquipComment(oPC,oItem);
            }
        }
    }

    ZEPGenderRestrict(oItem,oPC);

     // -------------------------------------------------------------------------
     // Generic Item Script Execution Code
     // If MODULE_SWITCH_EXECUTE_TAGBASED_SCRIPTS is set to TRUE on the module,
     // it will execute a script that has the same name as the item's tag
     // inside this script you can manage scripts for all events by checking against
     // GetUserDefinedItemEventNumber(). See x2_it_example.nss
     // -------------------------------------------------------------------------
     if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
     {
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_EQUIP);
        int nRet =   ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem),OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
        {
           return;
        }
     }
     CheckFeats(oPC);
     //DelayCommand(5.0, CheckShield(oPC));
     //DelayCommand(10.0, CheckShield(oPC));
}



void CheckShield (object oPC)
{
    //object oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
    //if (GetBaseItemType(oItem) == BASE_ITEM_TOWERSHIELD && GetAbilityScore(oPC, ABILITY_STRENGTH, FALSE)<20)
    //{
    //AssignCommand(oPC, ActionUnequipItem(oItem));
    //SendMessageToPC(oPC, "You require 20 strength to use this shield.");
    //}
    //if (GetBaseItemType(oItem) == BASE_ITEM_LARGESHIELD && GetAbilityScore(oPC, ABILITY_STRENGTH, FALSE)<18)
    //{
    //AssignCommand(oPC, ActionUnequipItem(oItem));
    //SendMessageToPC(oPC, "You require 18 strength to use this shield.");
    //}
}
