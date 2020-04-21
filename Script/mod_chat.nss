#include "nwnx_creature"
#include "qx_chat_cmds"
#include "qx_inc_db"
#include "pug_inc"
#include "nwnx_chat"
void main()
{
    object oPC      = NWNX_Chat_GetSender();
    string sMsg     = NWNX_Chat_GetMessage();
    object oSentTo  = NWNX_Chat_GetTarget();

    int nChannel    = NWNX_Chat_GetChannel();

    if (sMsg == "It's a trap!" && GetTag(GetArea(oPC)) == "TatooineMedicalFacility") AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetWaypointByTag("PL_L_2"))));
    else if (sMsg == "It's a trap!" && GetTag(GetArea(oPC)) == "CoruscantMedicalFacility") AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetWaypointByTag("PL_L_0"))));
    else if (sMsg == "It's a trap!" && GetTag(GetArea(oPC)) == "Yavin4MassassiStation") AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetWaypointByTag("PL_L_1"))));
    else if (sMsg == "snork" && GetName(oPC) == "Pugnius Divinius" && DB_GetIsDM(oPC) == TRUE) AssignCommand(oPC, ActionStartConversation(oPC, "pug_controller", TRUE, FALSE));

    //////////// Commands ////////////////////
    if(GetSubString(sMsg, 0, 1) == "!")
    {
        string sMsgL = GetStringLowerCase(sMsg);
        NWNX_Chat_SkipMessage();

        if(sMsgL == "!follow")
        {
            if(nChannel == NWNX_CHAT_CHANNEL_PLAYER_TELL || nChannel == NWNX_CHAT_CHANNEL_DM_TELL)
            {
                if(GetArea(oSentTo) == GetArea(oPC))
                {
                    if(GetDistanceBetween(oPC, oSentTo) < 10.0)
                    {
                        AssignCommand(oPC, ClearAllActions());
                        AssignCommand(oPC, ActionForceFollowObject(oSentTo));
                    }
                }
            }

            else
            {
                object oTarget = GetNearestObject(OBJECT_TYPE_CREATURE, oPC);
                if(GetArea(oTarget) == GetArea(oPC))
                {
                    if(GetDistanceBetween(oPC, oTarget) < 10.0)
                    {
                        AssignCommand(oPC, ClearAllActions());
                        AssignCommand(oPC, ActionForceFollowObject(oTarget));
                    }
                }
            }
        }

        else if(sMsgL =="!sit")
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, 5400.0));
        }

        else if(sMsgL == "!lay" || sMsgL == "!lie")
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0, 5400.0));
        }

        else if(sMsgL == "!fall")
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 5400.0));
        }

        else if(sMsgL == "!worship")
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 5400.0));
        }

        else if(sMsgL == "!kneel" || sMsg == "!pray")
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, 5400.0));
        }

        else if(sMsgL == "!cast")
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 5400.0));
        }

        else if(sMsgL == "!conjure")
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE2, 1.0, 5400.0));
        }

        else if(sMsgL == "!bow")
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW));
        }

        else if(sMsgL == "!taunt")
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT));
        }

        else if(sMsgL == "!laugh")
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING, 1.0, 2.0));
        }

        else if(sMsgL == "!drink")
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK));
        }

        else if(sMsgL == "!dodge")
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_SIDE));
        }

        else if(sMsgL == "!duck")
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK));
        }

        else if(sMsgL == "!greet" || sMsgL == "!wave")
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_GREETING));
        }

        else if(sMsgL == "!read")
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_READ));
        }

        else if(sMsgL == "!salute")
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_SALUTE));
        }

        else if(sMsgL == "!steal")
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_STEAL));
        }

        else if(sMsgL == "!cheer")
        {
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1));
        }

        else if(sMsgL == "!touch on")
        {
            RemoveEffect(oPC, EffectCutsceneGhost());
            SendMessageToPC(oPC, "<cÿÿ¡>Touching turned on!</c>");
            SetLocalInt(oPC, "TOUCHOFF", 0);
        }

        else if(sMsgL == "!touch off")
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneGhost(), oPC);
            SendMessageToPC(oPC, "<cÿÿ¡>Touching turned off!</c>");
            SetLocalInt(oPC, "TOUCHOFF", 1);
        }

        else if (sMsg == "!crawl") chat_togglecrawl(oPC);
        else if (sMsg == "!oocarea")
        {
            object oocwp = GetWaypointByTag("PUG_SPAWNDLES");
            AssignCommand(oPC, ActionJumpToObject(oocwp));
        }

        else if (GetSubString(sMsg,0,7) == "!givexp" && DB_GetIsDM(oPC)) chat_givexp(oPC, StringToInt(GetSubString(sMsg, FindSubString(sMsg, " "), GetStringLength(sMsg)-FindSubString(sMsg, " "))));
        else if (GetSubString(sMsg,0,9) == "!givegold" && DB_GetIsDM(oPC)) chat_givegold(oPC, StringToInt(GetSubString(sMsg, FindSubString(sMsg, " "), GetStringLength(sMsg)-FindSubString(sMsg, " "))));
        else if (GetSubString(sMsg,0,9) == "!giveitem" && DB_GetIsDM(oPC)) chat_giveitem(oPC, GetSubString(sMsg, FindSubString(sMsg, " "), GetStringLength(sMsg)-FindSubString(sMsg, " ")));
        else if (sMsg == "!controller" && DB_GetIsDM(oPC)) AssignCommand(oPC, ActionStartConversation(oPC, "pug_controller", TRUE, FALSE));
        else if (sMsg == "!uptime") chat_uptime(oPC);
        else if (sMsg == "!delayreset")
        {
            int nUptime = GetLocalInt(OBJECT_SELF, "uptime");
            int nResetTime = GetLocalInt(OBJECT_SELF, "reset_seconds");
            int bResetVoteResult;
            if ((nResetTime - nUptime) <= 1200) // 1200 seconds = 20 minutes
            {
                bResetVoteResult = EnterPlayerVote(oPC, "DELAYRESET", "DELAYRESET");
                NWNX_Chat_SkipMessage();

                if (bResetVoteResult) SendMessageToPC(oPC, "You have successfully voted to delay the reset.");
                else SendMessageToPC(oPC, "You have already voted for the reset or there has been an error.");
            }

            else SendMessageToPC(oPC, "Server Reset is not imminent, you cannot vote to delay right now.");
        }
    }
    //////////// End Commands /////////////////

    //////////// Holocom /////////////////
    else
    {
        int nRecord         = GetLocalInt(oPC, "DATA_RECORD");
        int nSpeaking       = GetLocalInt(oPC, "SPEAKING");
        int nHolocall       = GetLocalInt(oPC, "HOLOCOM_CHOOSE_CALL");
        int nHolo           = GetLocalInt(oPC, "HOLOCOM_CALL");
        int nDescription    = GetLocalInt(oPC, "DESCRIPTION_CHANGE");

        object oDevice      = GetLocalObject(oPC, "DATA_DEVICE");
        object oHolo        = GetItemPossessedBy(oPC, "pug_holocom");
        object oReceiver    = GetLocalObject(oPC, "HOLOCOM_RECEIVER");

        if (GetIsObjectValid(oHolo))
        {
            if(GetIsObjectValid(oReceiver))
            {
                if (nChannel == NWNX_CHAT_CHANNEL_PLAYER_TALK || nChannel == NWNX_CHAT_CHANNEL_DM_TALK || nChannel == NWNX_CHAT_CHANNEL_PLAYER_WHISPER || nChannel == NWNX_CHAT_CHANNEL_DM_WHISPER)
                {
                    AssignCommand(oReceiver, ActionSpeakString(sMsg, GetPCChatVolume()));
                }

                else if (nHolocall == TRUE && StringToInt(sMsg) <= GetLocalInt(oPC, "HOLOCOM_MAX") && StringToInt(sMsg) > 0 &&
                GetIsObjectValid(GetLocalObject(oPC, "HOLOCOM_CALL_" + sMsg))==TRUE)
                {
                    FloatingTextStringOnCreature("You have sent a transmission request to "+GetName(GetLocalObject(oPC, "HOLOCOM_CALL_"+sMsg)), oPC, FALSE);
                    oReceiver = GetLocalObject(oPC, "HOLOCOM_CALL_"+sMsg);
                    FloatingTextStringOnCreature("Incoming transmission from "+GetName(oPC)+", activate transmitter to accept or say deny to deny transmission", oReceiver, FALSE);
                    SetLocalInt(oReceiver, "HOLOCOM_REQUEST", TRUE);
                    SetLocalInt(oPC, "HOLOCOM_CHOOSE_CALL", FALSE);
                    SetLocalObject(oReceiver, "HOLOCOM_CALLER", oPC);
                }

                else if (GetStringUpperCase(sMsg) == "DENY" && GetLocalInt(oPC, "HOLOCOM_REQUEST") == TRUE)
                {
                    SetLocalInt(oPC, "HOLOCOM_REQUEST", FALSE);
                    FloatingTextStringOnCreature("Transmission Denied", GetLocalObject(oPC, "HOLOCOM_CALLER"),FALSE);
                    FloatingTextStringOnCreature("Transmission Denied", oPC,FALSE);
                    DeleteLocalObject(oPC, "HOLOCOM_CALLER");
                }


                if (GetLocalInt(oPC, "FAC_COMM") == TRUE && nChannel == NWNX_CHAT_CHANNEL_PLAYER_TALK || nChannel == NWNX_CHAT_CHANNEL_DM_TALK || nChannel == NWNX_CHAT_CHANNEL_PLAYER_WHISPER || nChannel == NWNX_CHAT_CHANNEL_DM_WHISPER)
                {
                    object oOther = GetFirstPC();
                    while (GetIsObjectValid(oOther))
                    {
                        if (GetFaction(oPC,FALSE) == GetFaction(oOther, FALSE) )
                        {
                            SendMessageToPC(oOther, "Radio <c0¡0>"+GetName(oPC)+": <cdd¡>"+sMsg);}
                            oOther = GetNextPC();
                        }
                    }
                }
            }
        }
        //////////// End Holocom /////////////////
    }


