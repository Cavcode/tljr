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
            int roll = d6();
            switch (roll){
                case 1:{
                    AssignCommand(oItemUser, ActionCastSpellAtLocation(753, lTarget, METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING,TRUE));
                    break;
                    }
                case 2:{
                    AssignCommand(oItemUser, ActionCastSpellAtLocation(754, lTarget, METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING,TRUE));
                    break;
                    }
                case 3:{
                    AssignCommand(oItemUser, ActionCastSpellAtLocation(755, lTarget, METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING,TRUE));
                    break;
                    }
                case 4:{
                    AssignCommand(oItemUser, ActionCastSpellAtLocation(765, lTarget, METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING,TRUE));
                    break;
                    }
                case 5:{
                    AssignCommand(oItemUser, ActionCastSpellAtLocation(766, lTarget, METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING,TRUE));
                    break;
                    }
                case 6:{
                    AssignCommand(oItemUser, ActionCastSpellAtLocation(753, lTarget, METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING,TRUE));
                    break;
                    }
            }
            // This is where you put your Unique power activation modifications.
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


