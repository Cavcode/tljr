//#include "ship_stat_inc"
#include "nwnx_creature"
#include "nwnx_object"
#include "pug_inc"
#include "qx_ship_stat_fnc"
#include "qx_ship_stat_inc"
#include "qx_ship_funcs"

//#include "aps_include"
void MakeSureInSpace(object oPC, object oArea, string sWaypoint)
{
if (GetArea(oPC) == oArea)
    {
    AssignCommand(oPC, ActionJumpToObject(GetWaypointByTag(sWaypoint), TRUE));
    }
}
//when you use a shipdeed
// Tag-Based Item Script - Skeleton Template
//:://////////////////////////////////////////////////////////
#include "x2_inc_switches"

// This is the main function for the tag-based script.
void main()
{ switch( GetUserDefinedItemEventNumber())
   { case X2_ITEM_EVENT_EQUIP:
         { // The item was just equipped.
            object oEquipper = GetPCItemLastEquippedBy();
            object oItem         = GetPCItemLastEquipped();
            if( !GetIsObjectValid( oEquipper) || !GetIsObjectValid( oItem))
            { SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_CONTINUE);
               return;
            }

            // This is where you enter your item equipping customizations.
         }
         SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_END);
         return;

     case X2_ITEM_EVENT_UNEQUIP:
         { // The item was just un-equipped.
            object oUnequipper = GetPCItemLastUnequippedBy();
            object oItem              = GetPCItemLastUnequipped();
            if( !GetIsObjectValid( oUnequipper) || !GetIsObjectValid( oItem))
            { SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_CONTINUE);
               return;
            }

            // This is where you put the item un-equipping effects.
         }
         SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_END);
         return;

     case X2_ITEM_EVENT_ACQUIRE:
         { // The item was just acquired (picked up, purchased, stolen, etc).
            object oNewOwner = GetModuleItemAcquiredBy();
            object oItem             = GetModuleItemAcquired();
            object oOldOwner  = GetModuleItemAcquiredFrom();
            int       iStackSize   = GetModuleItemAcquiredStackSize();
            if( !GetIsObjectValid( oNewOwner) || !GetIsObjectValid( oItem) || (iStackSize <= 0))
            { SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_CONTINUE);
               return;
            }

            // This is where you add modifications done when the item is acquired.
         }
         SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_END);
         return;

     case X2_ITEM_EVENT_UNACQUIRE:
         { // The item was just unacquired (dropped, sold, lost, etc).
            object oOldOwner  = GetModuleItemLostBy();
            object oItem             = GetModuleItemLost();
            object oNewOwner = GetItemPossessor( oItem);
            if( !GetIsObjectValid( oOldOwner) || !GetIsObjectValid( oItem))
            { SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_CONTINUE);
               return;
            }

            // This is where you add modifications done when the item is un-acquired.
         }
         SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_END);
         return;

     case X2_ITEM_EVENT_ACTIVATE:
         { // The item's CastSpell Activate or CastSpell UniquePower was just activated.
            object     oItemUser  = GetItemActivator();
            object     oItem          = GetItemActivated();
            object     oTarget      = GetItemActivatedTarget();
            location  lTarget      = (GetIsObjectValid( oTarget) ? GetLocation( oTarget) : GetItemActivatedTargetLocation());
            if( !GetIsObjectValid( oItemUser) || !GetIsObjectValid( oItem))
            { SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_CONTINUE);
               return;
            }

            UpdateDeedShipStatDescription(oItem);
            struct ShipStatsBasicStruct myship;

            // This is where you put your Unique power activation modifications.
            object oPC = oItemUser;
            object oDeed = oItem;
            int nPilot = GetSkillRank( 27, oPC, FALSE);
            int nCount = 1;
            int nValidSpot;

            if (GetPhenoType(oPC) == 22 || GetPhenoType(oPC) == 23)
            {
                SendMessageToPC(oPC, "You cannot launch your ship while you are driving a speeder.");
                return;
            }

                object oLaunchPad = GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, nCount);
                string sLaunchTag = GetTag(oLaunchPad);
                object oArea = GetArea(oPC);

                if (GetStringRight(sLaunchTag, 6) == "_other")
                    {
                    sLaunchTag = GetStringLeft(sLaunchTag, GetStringLength(sLaunchTag)-6);
                    }
                else if (GetStringRight(sLaunchTag, 4) == "_ISD")
                    {
                    sLaunchTag = "PL_S_ISD";
                    }
                else if (GetStringRight(sLaunchTag, 4) == "_MCC")
                    {
                    sLaunchTag = "PL_S_MCC";
                    }
                else
                    {
                    sLaunchTag = "PL_S_"+GetStringRight(sLaunchTag, GetStringLength(sLaunchTag)-5);
                    }

                while(GetIsObjectValid(oLaunchPad) && GetDistanceToObject(oLaunchPad) < 16.0f && nValidSpot != TRUE)
                {

                    if (GetStringLeft(sLaunchTag, 5) == "PL_L_")
                    {
                        nValidSpot = TRUE;
                    }
                    nCount++;
                    oLaunchPad = GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, nCount);
                }

                if (nValidSpot = FALSE)
                {
                    // If it is self-targetting, tell them they can't lift off.
                    if (GetItemActivatedTarget() == oPC)
                    {
                        FloatingTextStringOnCreature("You are not close enough to a launch pad to take off from here.", oPC, FALSE);
                        return;
                    }
                    // Otherwise, tell them they can't load people / stuff.
                    else
                    {
                        FloatingTextStringOnCreature("You are not close enough to a launch pad to load your ship.", oPC, FALSE);
                        return;
                    }
                }
                // If they aren't targetting themselves, they are creating a loading portal.

                string sLoadDock = "ser_pl_shipdock";
                int nLoadingBays = GetLocalInt(GetModule(), "ser_pl_loadbay");

                nCount = 0;
                // Reusing the variable.. I shouldn't but I will anyways.
                nValidSpot = FALSE;



                if (GetItemActivatedTarget() != oPC)

                {
                    while(nValidSpot == FALSE && nCount < 32)
                    {
                        if(nCount^2 & nLoadingBays)
                        {
                            nCount++;
                        }
                        else
                        {
                            nValidSpot == TRUE;
                        }
                    }

                    object oMyPortal = CreateObject(OBJECT_TYPE_PLACEABLE, sLoadDock, GetItemActivatedTargetLocation(), FALSE);
                    SetLocalObject(oPC, "LoadPortal", oMyPortal);
                    SetName(oMyPortal, GetName(oPC) +"'s Transport Loading Bay");
                    SetLocalInt(oMyPortal, "ser_pl_baynum", nCount^2);
                    return;
                }

                object oMyPortal = GetLocalObject(oPC, "LoadPortal");

                if (oMyPortal != OBJECT_INVALID)
                {
                    SetLocalInt(GetModule(), "ser_pl_loadbay", nLoadingBays - GetLocalInt(oMyPortal, "ser_pl_baynum"));
                    SetPlotFlag(oMyPortal, FALSE);
                    DestroyObject(oMyPortal);
                }

                // Gets the variable from the deed.
                int nShipType = GetLocalInt(oDeed, "SHIP_TYPE");
                if (nShipType == 0)
                    {
                    nShipType=327;
                    }
                if (GetStringRight(sLaunchTag, 6) == "_other")
                    {
                    sLaunchTag = GetStringLeft(sLaunchTag, GetStringLength(sLaunchTag)-6);
                    }
                if (GetStringRight(sLaunchTag, 8) == "_mission")
                    {
                    sLaunchTag = GetStringLeft(sLaunchTag, GetStringLength(sLaunchTag)-8);
                    }
                // Gets the numbers, whether 1 or 2, to set it up properly.
                string sWaypoint = "PL_S_" + GetStringRight(sLaunchTag, GetStringLength(sLaunchTag) - 5);

                // Sets the Polymorph Effect based off a variable on the deed.

                SetCutsceneMode(oPC, TRUE);
                // store PC hitpoints for landing retrieval
                NWNX_Object_SetInt(oPC, SHIP_PLAYER_HP, GetCurrentHitPoints(oPC), 1);
                //SetCommandable(FALSE, oPC);
                myship = GetShipStatsBasicStruct(oItem);
                effect ePolymorph = EffectPolymorph(myship.nShipType, TRUE);
                object oWP = GetWaypointByTag(sWaypoint);
                /*if (GetStringRight(sWaypoint, 4) == "_ISD"){oWP = GetObjectByTag(sWaypoint);}
                else if (GetStringRight(sWaypoint, 4) == "_MCC"){oWP = GetObjectByTag(sWaypoint);}
                else*/
                if (GetIsObjectValid(GetObjectByTag(sWaypoint)) == TRUE)
                    {oWP = GetObjectByTag(sWaypoint);}

                if (GetPhenoType(oPC) == 22)
                    {
                    FloatingTextStringOnCreature("Dismount before entering your ship", oPC, FALSE);
                    }
                if (GetIsObjectValid(oWP) == TRUE && GetPhenoType(oPC) != 22)
                    {
                    // Create an Unremovable Polymorph.
                    SetLocalInt(oPC, "SHIP_FLYING", TRUE);
                    AssignCommand(oPC, ClearAllActions());
                    //ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePolymorph, oPC);

                    //SetShipStats(oPC, nShipType, nPilot);
                    DelayCommand(0.1, SetShipStatsBasic(oPC, myship));
                    DelayCommand(1.0, SetShipStats(oPC,myship));
                    DelayCommand(2.0,ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePolymorph, oPC));
                    DelayCommand(2.1, SetIsShip(oPC, TRUE));
                    int nFacShip;
                    if (GetIsObjectValid(GetItemPossessedBy(oPC, "RebelAllianceID"))==TRUE){nFacShip = 329;}
                    else if (GetIsObjectValid(GetItemPossessedBy(oPC, "GalaticEmpireID"))==TRUE){nFacShip = 324;}
                    else if (GetIsObjectValid(GetItemPossessedBy(oPC, "FringeID"))==TRUE){nFacShip = 327;}
                    int z = 1;
                    object oHench = GetHenchman(oPC, 1);
                    while (GetIsObjectValid(oHench) == TRUE)
                        {
                        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectPolymorph(nFacShip, TRUE), oHench);
                        AssignCommand(oHench, ActionJumpToObject(oWP, TRUE));
                        SetShipStatsOld(oHench, nFacShip);
                        z = z+1;
                        oHench = GetHenchman(oPC, z);
                        }
                    // Handle Summoned help
                    oHench = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC, 1);
                    if(GetIsObjectValid(oHench) == TRUE)
                    {
                        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectPolymorph(nFacShip, TRUE), oHench);
                        AssignCommand(oHench, ActionJumpToObject(oWP, TRUE));
                        SetShipStatsOld(oHench, nFacShip);
                    }
                    oHench = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC, 1);
                    if(GetIsObjectValid(oHench) == TRUE)
                    {
                        DestroyObject(oHench);
                    }
                    oHench = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC, 1);
                    if(GetIsObjectValid(oHench) == TRUE)
                    {
                        DestroyObject(oHench);
                    }
                    oHench = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC, 1);
                    if(GetIsObjectValid(oHench) == TRUE)
                    {
                        DestroyObject(oHench);
                    }
                    // Remove Monk and Barbarian Speed
                    if(NWNX_Creature_GetKnowsFeat(oPC,FEAT_MONK_ENDURANCE))
                    {
                        NWNX_Creature_RemoveFeat(oPC,FEAT_MONK_ENDURANCE);
                    }
                    if (NWNX_Creature_GetKnowsFeat(oPC,FEAT_BARBARIAN_ENDURANCE))
                    {
                        NWNX_Creature_RemoveFeat(oPC,FEAT_BARBARIAN_ENDURANCE);
                    }
                    // Jump to Space.
                    AssignCommand(oPC, ActionJumpToObject(oWP, TRUE));

                    //SetLocalInt(oPC, "SHIP_POWER", 12);
                    //SetLocalInt(oPC, "SHIP_BOMB", 6);

                    //This will set any opposite faction members to hate you and vice versa
                    PCFactions(oPC, GetFaction(oPC, TRUE), "");

                    if (GetStandardFactionReputation(STANDARD_FACTION_DEFENDER, oPC) != 50)
                        {
                        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 50,oPC);
                        }
                    if (GetStandardFactionReputation(STANDARD_FACTION_COMMONER, oPC) != 80)
                        {
                        SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 80,oPC);
                        }
                    if (GetReputation(GetObjectByTag("faction_animal"), oPC) < 50)
                        {
                        AdjustReputation(GetObjectByTag("faction_animal"), oPC, 50);
                        }
                    DelayCommand(3.0, MakeSureInSpace(oPC, oArea, sWaypoint));
                    }
                DelayCommand(4.0,SetCutsceneMode(oPC, FALSE));
                //DelayCommand(4.0,SetCommandable(TRUE, oPC));
                SendMessageToPC(oPC, "ShipType: " + IntToString(myship.nShipType));

         }

         SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_END);
         return;

      case X2_ITEM_EVENT_ONHITCAST:
         { // The item's OnHitCastSpell Unique OnHit power was just triggerred.
            object oWielder = OBJECT_SELF;             // weapon wielder/armor wearer
            object oTarget    = GetSpellTargetObject(); // weapon target/armor attacker
            object oItem        = GetSpellCastItem();             // the item with the OnHitCast property on it.
            if( !GetIsObjectValid( oTarget) || !GetIsObjectValid( oItem))
            { SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_CONTINUE);
               return;
            }

            // This is where you process OnHitCastSpell-UniquePower(OnHit) activation
            // due to a weapon scoring a hit or equipment getting hit.
         }
         SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_END);
         return;
   }
   SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_CONTINUE);
}







/*#include "ship_stat_inc"
#include "nwnx_funcs"
#include "pug_inc"
//void main (){}
void MakeSureInSpace(object oPC, object oArea, string sWaypoint)
{
if (GetArea(oPC) == oArea)
    {
    AssignCommand(oPC, ActionJumpToObject(GetWaypointByTag(sWaypoint), TRUE));
    }
}
//when you use a shipdeed
// Tag-Based Item Script - Skeleton Template
//:://////////////////////////////////////////////////////////
#include "x2_inc_switches"

// This is the main function for the tag-based script.
void main()
{ switch( GetUserDefinedItemEventNumber())
   { case X2_ITEM_EVENT_EQUIP:
         { // The item was just equipped.
            object oEquipper = GetPCItemLastEquippedBy();
            object oItem         = GetPCItemLastEquipped();
            if( !GetIsObjectValid( oEquipper) || !GetIsObjectValid( oItem))
            { SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_CONTINUE);
               return;
            }

            // This is where you enter your item equipping customizations.
         }
         SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_END);
         return;

     case X2_ITEM_EVENT_UNEQUIP:
         { // The item was just un-equipped.
            object oUnequipper = GetPCItemLastUnequippedBy();
            object oItem              = GetPCItemLastUnequipped();
            if( !GetIsObjectValid( oUnequipper) || !GetIsObjectValid( oItem))
            { SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_CONTINUE);
               return;
            }

            // This is where you put the item un-equipping effects.
         }
         SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_END);
         return;

     case X2_ITEM_EVENT_ACQUIRE:
         { // The item was just acquired (picked up, purchased, stolen, etc).
            object oNewOwner = GetModuleItemAcquiredBy();
            object oItem             = GetModuleItemAcquired();
            object oOldOwner  = GetModuleItemAcquiredFrom();
            int       iStackSize   = GetModuleItemAcquiredStackSize();
            if( !GetIsObjectValid( oNewOwner) || !GetIsObjectValid( oItem) || (iStackSize <= 0))
            { SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_CONTINUE);
               return;
            }

            // This is where you add modifications done when the item is acquired.
         }
         SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_END);
         return;

     case X2_ITEM_EVENT_UNACQUIRE:
         { // The item was just unacquired (dropped, sold, lost, etc).
            object oOldOwner  = GetModuleItemLostBy();
            object oItem             = GetModuleItemLost();
            object oNewOwner = GetItemPossessor( oItem);
            if( !GetIsObjectValid( oOldOwner) || !GetIsObjectValid( oItem))
            { SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_CONTINUE);
               return;
            }

            // This is where you add modifications done when the item is un-acquired.
         }
         SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_END);
         return;

     case X2_ITEM_EVENT_ACTIVATE:
         { // The item's CastSpell Activate or CastSpell UniquePower was just activated.
            object     oItemUser  = GetItemActivator();
            object     oItem          = GetItemActivated();
            object     oTarget      = GetItemActivatedTarget();
            location  lTarget      = (GetIsObjectValid( oTarget) ? GetLocation( oTarget) : GetItemActivatedTargetLocation());
            if( !GetIsObjectValid( oItemUser) || !GetIsObjectValid( oItem))
            { SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_CONTINUE);
               return;
            }

            // This is where you put your Unique power activation modifications.
            object oPC = oItemUser;
            object oDeed = oItem;
            int nPilot = GetSkillRank( 27, oPC, FALSE);
            int nCount = 1;
            int nValidSpot;

            // prevent launch when mounted on a speeder
            if (GetPhenoType(oPC) == 22 || GetPhenoType(oPC) == 23)
            {
                SendMessageToPC(oPC, "You cannot launch your ship while you are driving a speeder.");
                return;
            }

                object oLaunchPad = GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, nCount);
                string sLaunchTag = GetTag(oLaunchPad);
                object oArea = GetArea(oPC);

                if (GetStringRight(sLaunchTag, 6) == "_other")
                    {
                    sLaunchTag = GetStringLeft(sLaunchTag, GetStringLength(sLaunchTag)-6);
                    }
                if (GetStringRight(sLaunchTag, 4) == "_ISD")
                    {
                    sLaunchTag = "PL_S_ISD";
                    }
                if (GetStringRight(sLaunchTag, 4) == "_MCC")
                    {
                    sLaunchTag = "PL_S_MCC";
                    }
                while(GetIsObjectValid(oLaunchPad) && GetDistanceToObject(oLaunchPad) < 16.0f && nValidSpot != TRUE)
                {

                    if (GetStringLeft(sLaunchTag, 5) == "PL_L_")
                    {
                        nValidSpot = TRUE;
                    }
                    nCount++;
                    oLaunchPad = GetNearestObject(OBJECT_TYPE_WAYPOINT, oPC, nCount);
                }

                if (nValidSpot = FALSE)
                {
                    // If it is self-targetting, tell them they can't lift off.
                    if (GetItemActivatedTarget() == oPC)
                    {
                        FloatingTextStringOnCreature("You are not close enough to a launch pad to take off from here.", oPC, FALSE);
                        return;
                    }
                    // Otherwise, tell them they can't load people / stuff.
                    else
                    {
                        FloatingTextStringOnCreature("You are not close enough to a launch pad to load your ship.", oPC, FALSE);
                        return;
                    }
                }
                // If they aren't targetting themselves, they are creating a loading portal.

                string sLoadDock = "ser_pl_shipdock";
                int nLoadingBays = GetLocalInt(GetModule(), "ser_pl_loadbay");

                nCount = 0;
                // Reusing the variable.. I shouldn't but I will anyways.
                nValidSpot = FALSE;



                if (GetItemActivatedTarget() != oPC)

                {
                    while(nValidSpot == FALSE && nCount < 32)
                    {
                        if(nCount^2 & nLoadingBays)
                        {
                            nCount++;
                        }
                        else
                        {
                            nValidSpot == TRUE;
                        }
                    }

                    object oMyPortal = CreateObject(OBJECT_TYPE_PLACEABLE, sLoadDock, GetItemActivatedTargetLocation(), FALSE);
                    SetLocalObject(oPC, "LoadPortal", oMyPortal);
                    SetName(oMyPortal, GetName(oPC) +"'s Transport Loading Bay");
                    SetLocalInt(oMyPortal, "ser_pl_baynum", nCount^2);
                    return;
                }

                object oMyPortal = GetLocalObject(oPC, "LoadPortal");

                if (oMyPortal != OBJECT_INVALID)
                {
                    SetLocalInt(GetModule(), "ser_pl_loadbay", nLoadingBays - GetLocalInt(oMyPortal, "ser_pl_baynum"));
                    SetPlotFlag(oMyPortal, FALSE);
                    DestroyObject(oMyPortal);
                }

                // Gets the variable from the deed.
                int nShipType = GetLocalInt(oDeed, "SHIP_TYPE");
                if (nShipType == 0)
                    {
                    nShipType=327;
                    }
                if (GetStringRight(sLaunchTag, 6) == "_other")
                    {
                    sLaunchTag = GetStringLeft(sLaunchTag, GetStringLength(sLaunchTag)-6);
                    }
                if (GetStringRight(sLaunchTag, 8) == "_mission")
                    {
                    sLaunchTag = GetStringLeft(sLaunchTag, GetStringLength(sLaunchTag)-8);
                    }
                // Gets the numbers, whether 1 or 2, to set it up properly.
                string sWaypoint = "PL_S_" + GetStringRight(sLaunchTag, GetStringLength(sLaunchTag) - 5);

                // Sets the Polymorph Effect based off a variable on the deed.

                SetCutsceneMode(oPC, TRUE);

                effect ePolymorph = EffectPolymorph(nShipType, TRUE);
                object oWP = GetWaypointByTag(sWaypoint);
                if (GetStringRight(sWaypoint, 4) == "_ISD"){oWP = GetObjectByTag(sWaypoint);}
                else if (GetStringRight(sWaypoint, 4) == "_MCC"){oWP = GetObjectByTag(sWaypoint);}
                if (GetPhenoType(oPC) == 22)
                    {
                    FloatingTextStringOnCreature("Dismount before entering your ship", oPC, FALSE);
                    }
                if (GetIsObjectValid(oWP) == TRUE && GetPhenoType(oPC) != 22)
                    {
                    // Create an Unremovable Polymorph.
                    SetLocalInt(oPC, "SHIP_FLYING", TRUE);
                    AssignCommand(oPC, ClearAllActions());
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePolymorph, oPC);
                    SetShipStats(oPC, nShipType, nPilot);

                    //This is just a temp fix for duplicating offhand weapons, remove when the real problem is fixed
                    object oOffHand = GetFirstItemInInventory(oPC);
                    while (GetIsObjectValid(oOffHand))
                        {
                        if (GetTag(oOffHand) == "OffhandBlaster")
                            {
                            DestroyObject(oOffHand);
                            }
                        oOffHand = GetNextItemInInventory(oPC);
                        }

                    int nFacShip;
                    if (GetIsObjectValid(GetItemPossessedBy(oPC, "RebelAllianceID"))==TRUE){nFacShip = 329;}
                    else if (GetIsObjectValid(GetItemPossessedBy(oPC, "GalaticEmpireID"))==TRUE){nFacShip = 324;}
                    else if (GetIsObjectValid(GetItemPossessedBy(oPC, "FringeID"))==TRUE){nFacShip = 327;}
                    int z = 1;
                    object oHench = GetHenchman(oPC, 1);
                    while (GetIsObjectValid(oHench) == TRUE)
                        {
                        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectPolymorph(nFacShip, TRUE), oHench);
                        AssignCommand(oHench, ActionJumpToObject(oWP, TRUE));
                        SetShipStats(oHench, nFacShip, nPilot);
                        z = z+1;
                        oHench = GetHenchman(oPC, z);
                        }
                    // Handle Summoned help
                    oHench = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC, 1);
                    if(GetIsObjectValid(oHench) == TRUE)
                    {
                        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectPolymorph(nFacShip, TRUE), oHench);
                        AssignCommand(oHench, ActionJumpToObject(oWP, TRUE));
                        SetShipStats(oHench, nFacShip, nPilot);
                    }
                    oHench = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC, 1);
                    if(GetIsObjectValid(oHench) == TRUE)
                    {
                        DestroyObject(oHench);
                    }
                    oHench = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC, 1);
                    if(GetIsObjectValid(oHench) == TRUE)
                    {
                        DestroyObject(oHench);
                    }
                    oHench = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC, 1);
                    if(GetIsObjectValid(oHench) == TRUE)
                    {
                        DestroyObject(oHench);
                    }
                    // Remove Monk and Barbarian Speed
                    if(GetKnowsFeat(FEAT_MONK_ENDURANCE,oPC))
                    {
                        RemoveKnownFeat(oPC,FEAT_MONK_ENDURANCE);
                    }
                    if (GetKnowsFeat(FEAT_BARBARIAN_ENDURANCE,oPC))
                    {
                        RemoveKnownFeat(oPC,FEAT_BARBARIAN_ENDURANCE);
                    }
                    // Jump to Space.
                    AssignCommand(oPC, ActionJumpToObject(oWP, TRUE));
                    SetLocalInt(oPC, "PILOTING_SHIP", TRUE);
                    if (GetKnowsFeat(1345, oPC) == FALSE)
                    {
                        AddKnownFeat(oPC, 1345);
                    }
                    SetLocalInt(oPC, "SHIP_POWER", 99);
                    SetLocalInt(oPC, "SHIP_BOMB", 6);

                    //This will set any opposite faction members to hate you and vice versa
                    PCFactions(oPC, GetFaction(oPC, TRUE), "");

                    if (GetStandardFactionReputation(STANDARD_FACTION_DEFENDER, oPC) != 50)
                        {
                        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 50,oPC);
                        }
                    if (GetStandardFactionReputation(STANDARD_FACTION_COMMONER, oPC) != 80)
                        {
                        SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 80,oPC);
                        }
                    if (GetReputation(GetObjectByTag("faction_animal"), oPC) < 50)
                        {
                        AdjustReputation(GetObjectByTag("faction_animal"), oPC, 50);
                        }
                    DelayCommand(3.0, MakeSureInSpace(oPC, oArea, sWaypoint));
                    }
                DelayCommand(4.0,SetCutsceneMode(oPC, FALSE));
         }
         SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_END);
         return;

      case X2_ITEM_EVENT_ONHITCAST:
         { // The item's OnHitCastSpell Unique OnHit power was just triggerred.
            object oWielder = OBJECT_SELF;             // weapon wielder/armor wearer
            object oTarget    = GetSpellTargetObject(); // weapon target/armor attacker
            object oItem        = GetSpellCastItem();             // the item with the OnHitCast property on it.
            if( !GetIsObjectValid( oTarget) || !GetIsObjectValid( oItem))
            { SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_CONTINUE);
               return;
            }

            // This is where you process OnHitCastSpell-UniquePower(OnHit) activation
            // due to a weapon scoring a hit or equipment getting hit.
         }
         SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_END);
         return;
   }
   SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_CONTINUE);
}

     */
