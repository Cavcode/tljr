#include "nwnx_events"
#include "qx_inc_lightsbr"
#include "fky_chat_instant"
#include "nwnx_creature"
#include "qx_ship_stat_fnc"
#include "nwnx_object"
//#include "pug_feats"

void main()
{
    string nEventType = NWNX_Events_GetCurrentEvent();

    WriteTimestampedLogEntry("NWNX Event fired: " + nEventType + " " + GetName(OBJECT_SELF));
    object oPC, oTarget, oItem;
    vector vTarget;
    int nSubID;
    float fDuration = 18.0;

        if (nEventType == "NWNX_ON_USE_SKILL_BEFORE")
        {
            oPC = OBJECT_SELF;
            oTarget = NWNX_Object_StringToObject(NWNX_Events_GetEventData("TARGET_OBJECT_ID"));
            WriteTimestampedLogEntry(GetName(oPC)+" tried to steal from "+GetName(oTarget));
            //FloatingTextStringOnCreature("You're trying to steal from "+GetName(oTarget), oPC, FALSE);
            if(GetIsPC(oTarget) || GetIsDM(oTarget) || GetLocalInt(oTarget,"PPDISABLED"))
            {
                NWNX_Events_SkipEvent();
                WriteTimestampedLogEntry(GetName(oPC)+" tried to steal from "+GetName(oTarget));
                FloatingTextStringOnCreature("PickPocketing PC's and Plot NPC's Disabled.", oPC, FALSE);
            }
        }

        else if (nEventType == "NWNX_ON_INPUT_ATTACK_OBJECT_BEFORE")
        {
            oPC = OBJECT_SELF;
            oTarget = NWNX_Object_StringToObject(NWNX_Events_GetEventData("TARGET"));
            WriteTimestampedLogEntry(GetName(oPC)+" attacked "+GetName(oTarget));
            //FloatingTextStringOnCreature("Attacking "+GetName(oTarget), oPC, FALSE);
            int bIsShip = GetLocalInt(oPC, "PILOTING_SHIP");

            if(bIsShip)
            {
                NWNX_Events_SkipEvent();
            }
            else
            {
                object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
                if (!GetLightsaberIgnited(oItem))
                {
                    NWNX_Events_SkipEvent();
                    DelayCommand(0.2,Ignite(oItem, oPC, TRUE, TRUE));
                    DelayCommand(0.6,AssignCommand(oPC,ActionAttack(oTarget)));
                }
                //if ((GetBaseItemType(oItem) == BASE_ITEM_HEAVYCROSSBOW) || (GetBaseItemType(oItem) == BASE_ITEM_LIGHTCROSSBOW))
                //{
                //    DelayCommand(0.1,AssignCommand(oPC,ClearAllActions(TRUE)));
                //    DelayCommand(0.2,AssignCommand(oPC,ActionAttack(oTarget)));
                //    BypassEvent();
                //}
            }
         }

        else if (nEventType == "NWNX_ON_USE_FEAT_BEFORE")
        {
            oPC = OBJECT_SELF;
            nSubID =  StringToInt(NWNX_Events_GetEventData("FEAT_ID"));   //FEAT_*
            oTarget = NWNX_Object_StringToObject(NWNX_Events_GetEventData("TARGET_OBJECT_ID"));
            int nAB;
            int nStrMod;
            int nDexMod;
            int bIsShip = FALSE;
            WriteTimestampedLogEntry(GetName(oPC)+" used feat  #"+IntToString(nSubID)+" on "+GetName(oTarget));
            //FloatingTextStringOnCreature(GetName(oPC)+" used feat  #"+IntToString(nSubID)+" on "+GetName(oTarget), oPC, FALSE);

            //SendMessageToPC(oPC, "FEAT USED: " + IntToString(nSubID));
            //SendMessageToPC(oPC, "FEAT REF (Improved Knockdown): " + IntToString(FEAT_IMPROVED_KNOCKDOWN));

            effect ePolymorph = GetFirstEffect(oPC);
            while (GetIsEffectValid(ePolymorph))
            {
                if (GetEffectType(ePolymorph) == EFFECT_TYPE_POLYMORPH)
                {
                    bIsShip = TRUE;
                }
                ePolymorph = GetNextEffect(oPC);
            }

            if (!bIsShip && (nSubID == 65 || nSubID == 66 || nSubID == 67 || nSubID == 68))
            {
                  NWNX_Events_SkipEvent();

            }
            else if (bIsShip && (nSubID == 65 || nSubID == 66 || nSubID == 67 || nSubID == 68))
            {
                  return;
            }

            if (bIsShip)
            {
                NWNX_Events_SkipEvent();
                SendMessageToPC(oPC, "You cannot use that ability while piloting your ship.");
                WriteTimestampedLogEntry(GetName(oPC)+" FEAT FAILURE #"+IntToString(nSubID)+" due to being a ship.");
            }
            else
            {
                if (nSubID == FEAT_KNOCKDOWN || nSubID == FEAT_IMPROVED_KNOCKDOWN || nSubID == FEAT_DISARM || nSubID == FEAT_IMPROVED_DISARM)
                {
                    if(oPC != oTarget)
                    {
                        int nDisc = GetSkillRank(SKILL_DISCIPLINE, oTarget);
                        SendMessageToPC(oTarget, "1:Discipline = " + IntToString(nDisc));
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillIncrease(SKILL_DISCIPLINE, 4), oTarget, fDuration);
                        SendMessageToPC(oTarget, "1:Discipline = " + IntToString(nDisc));
                        //nStrMod = GetAbilityModifier(ABILITY_STRENGTH, oPC);
                        //nAB = GetBaseAttackBonus(oPC);
                        //SendMessageToPC(oPC, "1: AB = " + IntToString(nAB));
                        //ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAttackDecrease(4 - nStrMod/3), oPC, fDuration);
                        //SendMessageToPC(oPC, "2: AB = " + IntToString(nAB));
                    }
                }
             }
                //else if (nSubID == FEAT_DISARM || nSubID == FEAT_IMPROVED_DISARM)
                //{

                //nDexMod = GetAbilityModifier(ABILITY_DEXTERITY, oPC);
                //nAB = GetBaseAttackBonus(oPC);
                //SendMessageToPC(oPC, "1: AB = " + IntToString(nAB));
                //ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAttackDecrease(4 - nDexMod/3), oPC, fDuration);
                //SendMessageToPC(oPC, "2: AB = " + IntToString(nAB));
            //}
        }

           else if (nEventType == "NWNX_ON_ENTER_STEALTH_BEFORE")
           {
            oPC = OBJECT_SELF;
            int bIsSpeeder = GetLocalInt(oPC, "SPEEDER_BIKE");
            WriteTimestampedLogEntry(GetName(oPC)+" toggled mode  #"+IntToString(nSubID));
            //FloatingTextStringOnCreature(GetName(oPC)+" toggled mode  #"+IntToString(nSubID), oPC, FALSE);

            // stealth field generator check here

                // Check speeder
                if(bIsSpeeder == 1)
                {
                    NWNX_Events_SkipEvent();
                }

                if(GetHasFeat(FEAT_HIDE_IN_PLAIN_SIGHT, oPC))
                {
                    int nHide = GetSkillRank(SKILL_HIDE, oPC);
                    int nMS =   GetSkillRank(SKILL_MOVE_SILENTLY, oPC);
                    SendMessageToPC(oPC, "Stealth Field Generator Activated");
                    SendMessageToPC(oPC, "1:Hide = " + IntToString(nHide));
                    SendMessageToPC(oPC, "1:MoveSilently = " + IntToString(nMS));
                    //DelayCommand(1.0, SetActionMode(oPC, ACTION_MODE_STEALTH, TRUE));
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillDecrease(SKILL_HIDE, 4), oPC, fDuration);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillDecrease(SKILL_MOVE_SILENTLY, 4), oPC, fDuration);
                    SendMessageToPC(oPC, "2:Hide = " + IntToString(nHide));
                    SendMessageToPC(oPC, "2:MoveSilently = " + IntToString(nMS));
                }
           }


        //case EVENT_USE_ITEM:
            //oPC = OBJECT_SELF;
            //oTarget = GetActionTarget();
            //oItem = GetEventItem();
            //vTarget = GetEventPosition();
            //WriteTimestampedLogEntry(GetName(oPC)+" used item '"+GetName(oItem)+"' on "+GetName(oTarget));
            //FloatingTextStringOnCreature("Using item '"+GetName(oItem)+"' on "+GetName(oTarget), oPC, FALSE);
            //SendMessageToPC(oPC, "Location: "+FloatToString(vTarget.x)+"/"+FloatToString(vTarget.y)+"/"+FloatToString(vTarget.z));
            //if(d2()==1)
            //{
            //    BypassEvent();
            //    WriteTimestampedLogEntry("The action was cancelled");
            //    FloatingTextStringOnCreature("The action was cancelled", oPC, FALSE);
            //}
            //break;

            else if (nEventType == "NWNX_ON_EXAMINE_OBJECT_BEFORE")
            {
                oPC = OBJECT_SELF;
                oTarget = NWNX_Object_StringToObject(NWNX_Events_GetEventData("EXAMINEE_OBJECT_ID"));
                WriteTimestampedLogEntry(GetName(oPC)+" examined "+GetName(oTarget));

                if(GetStringUpperCase(GetTag(oTarget)) == "SER_PL_SHIPDEED")
                {
                    UpdateDeedShipStatDescription(oTarget);
                }
            }

            //FloatingTextStringOnCreature(GetName(oPC)+" examined "+GetName(oTarget), oPC, FALSE);
            //if(d2()==1)
            //{
            //    BypassEvent();
            //    WriteTimestampedLogEntry("The action was cancelled");
            //    FloatingTextStringOnCreature("The action was cancelled", oPC, FALSE);
            //}
          //  break;
        //case EVENT_USE_SKILL:
            //oPC = OBJECT_SELF;
            //nSubID = GetEventSubType();    //SKILL_*
            //oTarget = GetActionTarget();
            //WriteTimestampedLogEntry(GetName(oPC)+" used skill  #"+IntToString(nSubID)+" on "+GetName(oTarget));
            //FloatingTextStringOnCreature(GetName(oPC)+" used skill  #"+IntToString(nSubID)+" on "+GetName(oTarget), oPC, FALSE);
            //RandomBypass(oPC);
            //CheckCustomSkills(oPC, 1.0, nSubID);
           // break;
}

