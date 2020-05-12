//::///////////////////////////////////////////////
//:: Example XP2 OnItemEquipped
//:: x2_mod_def_unequ
//:: (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Put into: OnUnEquip Event
*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-07-16
//:://////////////////////////////////////////////
//:: Modified By: Deva Winblood
//:: Modified On: April 15th, 2008
//:: Added Support for Mounted Archery Feat penalties
//:://////////////////////////////////////////////

#include "x2_inc_switches"
#include "x2_inc_intweapon"
#include "x3_inc_horse"
#include "qx_inc_lightsbr"
#include "nwnx_creature"
#include "pug_feats"
void main()
{
    object oItem = GetPCItemLastUnequipped();
    object oPC   = GetPCItemLastUnequippedBy();
    string sResRef;

    //If speederblaster then dismount speeder and destroy object
    if (GetTag(oItem) == "speederblaster1" && GetIsDead(oPC) == FALSE)
    {
        if ((GetPhenoType(oPC) == 22 || GetPhenoType(oPC) == 23) && GetHasEffect(EFFECT_TYPE_POLYMORPH,oPC) == FALSE && GetLocalInt(oPC, "SHIP_FLYING") == FALSE)
        {
        int nPheno = GetLocalInt(oPC, "PHENO");
        int nTail = GetCreatureTailType(oPC);

        if (nTail == 816) {sResRef = "swoopbike";}
        else if (nTail == 817) {sResRef = "pug_speederbike";}
        else if (nTail == 818) {sResRef = "landspeeder";}

        SetCreatureTailType(CREATURE_TAIL_TYPE_NONE, oPC);
        RestoreCameraFacing();
        SetPhenoType(nPheno, oPC);
        //DelayCommand(2.0,SetCreatureTailType(CREATURE_TAIL_TYPE_NONE));
        SetLocalInt(oPC,"BIKE", 0);

        NWNX_Creature_SetMovementRate(oPC, GetLocalInt(oPC,"SPEED"));

        effect ePolymorph = GetFirstEffect(oPC);
            while (GetIsEffectValid(ePolymorph))
            {
                if (GetEffectType(ePolymorph) == EFFECT_TYPE_MOVEMENT_SPEED_INCREASE)
                {
                RemoveEffect(oPC, ePolymorph);
                }
                if (GetEffectType(ePolymorph) == EFFECT_TYPE_HASTE)
                {
                    RemoveEffect(oPC, ePolymorph);
                }
                ePolymorph = GetNextEffect(oPC);
            }
        //SetCutsceneMode(oPC, FALSE);
        //if (GetPlotFlag(oPC) == TRUE)
        //{
        //SetPlotFlag(oPC, FALSE);
        //}
        //if (GetImmortal(oPC) == TRUE)
        //{
        //SetImmortal(oPC, FALSE);
        //}
        DestroyObject(oItem, 0.1);
        string sOwner = GetLocalString(oPC, "BIKE_OWNER");

        if (GetLocalInt(oPC, "BIKE_KILL")==FALSE)
            {
            //object oBike = CreateObject(OBJECT_TYPE_PLACEABLE, "pug_speederbike", GetLocation(oPC), FALSE);
            object oBike = CreateObject(OBJECT_TYPE_PLACEABLE, sResRef, GetLocation(oPC), FALSE);
            SetName(oBike, sOwner+"'s "+GetName(oBike));
            SetLocalString(oBike, "BIKE_OWNER", sOwner);
            }
        else{SetLocalInt(oPC, "BIKE_KILL", FALSE);}
        }
    }

if (GetTag(oItem) == "pug_disguise")
    {
    //DelayCommand(3.0, ExecuteScript("pug_fac_set", oPC));
    //Removed for default neutral reaction adjustment
    }
if (GetTag(oItem) == "pug_no_attack")
    {
    AssignCommand(oPC, ActionEquipItem(oItem, INVENTORY_SLOT_RIGHTHAND));
    }

   //If offhand blaster then destroy
    if (GetTag(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC)) == "DELETEME")
    {
        if(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC) != OBJECT_INVALID)
            AssignCommand(oPC, ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC)));
        DestroyObject(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC));
    }

    //If lightsaber then un-ignite
    if (!GetLocalInt(oItem, "UNIGNITING"))
    {
        UnIgnite(oItem, oPC, TRUE, FALSE);
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
    // Mounted benefits control
    // -------------------------------------------------------------------------
    if (GetWeaponRanged(oItem))
    {
        DeleteLocalInt(oPC,"bX3_M_ARCHERY");
        HORSE_SupportAdjustMountedArcheryPenalty(oPC);
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
