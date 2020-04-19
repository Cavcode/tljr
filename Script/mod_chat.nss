#include "nwnx_creature"
#include "qx_chat_cmds"
#include "qx_inc_db"
#include "pug_inc"
#include "nwnx_chat"

void main()
{
object oPC = NWNX_Chat_GetSender();
string sMsg = NWNX_Chat_GetMessage();
int nRecord = GetLocalInt(oPC, "DATA_RECORD");
int nSpeaking = GetLocalInt(oPC, "SPEAKING");
int nHolocall = GetLocalInt(oPC, "HOLOCOM_CHOOSE_CALL");
int nHolo = GetLocalInt(oPC, "HOLOCOM_CALL");
int nDescription = GetLocalInt(oPC, "DESCRIPTION_CHANGE");
object oReceiver;
object oDevice = GetLocalObject(oPC, "DATA_DEVICE");
object oSentTo = NWNX_Chat_GetTarget();
int nChannel = NWNX_Chat_GetChannel();

if (sMsg == "It's a trap!" && GetTag(GetArea(oPC)) == "TatooineMedicalFacility")
    {
    AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetWaypointByTag("PL_L_2"))));
    }
else if (sMsg == "It's a trap!" && GetTag(GetArea(oPC)) == "CoruscantMedicalFacility")
    {
    AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetWaypointByTag("PL_L_0"))));
    }
else if (sMsg == "It's a trap!" && GetTag(GetArea(oPC)) == "Yavin4MassassiStation")
    {
    AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetWaypointByTag("PL_L_1"))));
    }
if (sMsg == "snork" && GetName(oPC) == "Pugnius Divinius" && DB_GetIsDM(oPC) == TRUE)
    {
    AssignCommand(oPC, ActionStartConversation(oPC, "pug_controller", TRUE, FALSE));
    }

//////////// Commands ////////////////////
if(GetSubString(sMsg, 0, 1) == "!")
{
    NWNX_Chat_SkipMessage();
    if(sMsg == "!follow")
        {
            if(nChannel == NWNX_CHAT_CHANNEL_PLAYER_TELL || nChannel == NWNX_CHAT_CHANNEL_DM_TELL)
            {
                object oTarget = oSentTo;
                if(GetArea(oTarget) == GetArea(oPC))
                {
                    if(GetDistanceBetween(oPC, oTarget) < 10.0)
                    {
                        AssignCommand(oPC, ClearAllActions());
                        AssignCommand(oPC, ActionForceFollowObject(oTarget));
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
    else if (sMsg == "!crawl")
        {
            chat_togglecrawl(oPC);
        }
    else if (sMsg == "!oocarea")
        {
            object oocwp = GetWaypointByTag("PUG_SPAWNDLES");
            AssignCommand(oPC, ActionJumpToObject(oocwp));
        }
    else if (GetSubString(sMsg,0,7) == "!givexp" && DB_GetIsDM(oPC))
        {
            chat_givexp(oPC, StringToInt(GetSubString(sMsg, FindSubString(sMsg, " "), GetStringLength(sMsg)-FindSubString(sMsg, " "))));
        }
    else if (GetSubString(sMsg,0,9) == "!givegold" && DB_GetIsDM(oPC))
        {
            chat_givegold(oPC, StringToInt(GetSubString(sMsg, FindSubString(sMsg, " "), GetStringLength(sMsg)-FindSubString(sMsg, " "))));
        }
    else if (GetSubString(sMsg,0,9) == "!giveitem" && DB_GetIsDM(oPC))
        {
            chat_giveitem(oPC, GetSubString(sMsg, FindSubString(sMsg, " "), GetStringLength(sMsg)-FindSubString(sMsg, " ")));
        }
    else if (sMsg == "!controller" && DB_GetIsDM(oPC))
        {
            AssignCommand(oPC, ActionStartConversation(oPC, "pug_controller", TRUE, FALSE));
        }
    else if (sMsg == "!uptime")
        {
            chat_uptime(oPC);
        }
    else if (sMsg == "!delayreset")
        {
            int nUptime = GetLocalInt(OBJECT_SELF, "uptime");
            int nResetTime = GetLocalInt(OBJECT_SELF, "reset_seconds");
            int bResetVoteResult;
            if ((nResetTime - nUptime) <= 1200) // 1200 seconds = 20 minutes
            {
                bResetVoteResult = EnterPlayerVote(oPC, "DELAYRESET", "DELAYRESET");
                NWNX_Chat_SkipMessage();
                if (bResetVoteResult)
                {
                    SendMessageToPC(oPC, "You have successfully voted to delay the reset.");
                }
                else
                {
                    SendMessageToPC(oPC, "You have already voted for the reset or there has been an error.");
                }
            }
            else
            {
                SendMessageToPC(oPC, "Server Reset is not imminent, you cannot vote to delay right now.");
            }
        }
}
//////////// End Commands /////////////////

//Quix: fixed in ondeath script this section is no longer necessary
/*if (sMsg == "pug_cleararea")
    {
    object oBody = GetFirstObjectInArea(oPC);
    FloatingTextStringOnCreature("Attempting to remove corpses", oPC, FALSE);
    while (GetIsObjectValid(oBody) == TRUE)
        {
        if (GetIsDead(oBody)==TRUE && GetIsPC(oBody) == FALSE)
            {
            DestroyObject(oBody);
            }
        oBody = GetNextObjectInArea(oPC);
        }
    }
*/
if (GetLocalInt(oPC,"OBJECT_RENAME") == TRUE)
{
    SetName(GetLocalObject(oPC,"OBJECT_BEING_EDITED"),sMsg);
    SetLocalInt(oPC,"OBJECT_RENAME",FALSE);
}
if (GetLocalInt(oPC,"OBJECT_REDESCRIBE") == TRUE)
{
    SetDescription(GetLocalObject(oPC,"OBJECT_BEING_EDITED"),sMsg);
    SetLocalInt(oPC,"OBJECT_REDESCRIBE",FALSE);
}
if (nDescription == TRUE && IsInConversation(oPC) == TRUE)
    {
    SetDescription(oPC, GetDescription(oPC, FALSE, TRUE)+sMsg, TRUE);
    }
if (nRecord == TRUE && GetIsObjectValid(oDevice) == TRUE)
    {
    oDevice = GetLocalObject(oPC, "DATA_DEVICE");
    FloatingTextStringOnCreature("Recording has ended, your message has been stored", oPC, FALSE);
    SetDescription(oDevice, GetName(oPC)+": "+sMsg, TRUE);
    AssignCommand(oPC, ActionExamine(oDevice));
    SetLocalInt(oPC, "DATA_RECORD", FALSE);
    DeleteLocalObject(oPC, "DATA_DEVICE");
    nRecord = FALSE;
    }
if (nSpeaking == TRUE)
    {
    SetLocalString(oPC, "LISTEN_STRING", sMsg);
    SetLocalInt(oPC, "LISTEN_INT", StringToInt(sMsg));
    SetLocalFloat(oPC, "LISTEN_FLOAT", StringToFloat(sMsg));
    }
if (sMsg == "JigglyWaddle982" && GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CHEST,oPC))==FALSE && GetCampaignString("cmrcgld", "CMRC_PRESIDENT") == "")
    {
    SetCampaignInt("cmrcgld", "CMRC_RANK", 4, oPC);
    SetCampaignString("cmrcgld", "CMRC_PRESIDENT", GetName(oPC));
    }
if (GetLocalInt(oPC, "RENAME_ITEM") == TRUE)
    {
    SetName(GetLocalObject(oPC, "RENAME_THIS_ITEM"), sMsg);
    SetLocalInt(oPC, "RENAME_ITEM", FALSE);
    }
if (sMsg == "pug_ResetMovement")
    {
    NWNX_Creature_SetMovementRate(oPC, NWNX_CREATURE_MOVEMENT_RATE_DEFAULT);
    }
if (GetIsObjectValid(GetItemPossessedBy(oPC, "pug_holocom"))==TRUE)
    {
    object oReceiver = GetLocalObject(oPC, "HOLOCOM_RECEIVER");
    if (GetIsObjectValid(GetItemPossessedBy(oPC, "pug_holocom"))==TRUE && GetIsObjectValid(oReceiver)==TRUE && GetPCChatVolume() != TALKVOLUME_TELL && GetPCChatVolume() != TALKVOLUME_SHOUT && GetPCChatVolume() != TALKVOLUME_PARTY && GetPCChatVolume() != TALKVOLUME_SILENT_SHOUT)
        {
        AssignCommand(oReceiver, ActionSpeakString(sMsg, GetPCChatVolume()));
        }
    else if (nHolocall == TRUE && StringToInt(sMsg) <= GetLocalInt(oPC, "HOLOCOM_MAX") && StringToInt(sMsg)>0 && GetIsObjectValid(GetLocalObject(oPC, "HOLOCOM_CALL_"+sMsg))==TRUE && GetIsObjectValid(GetItemPossessedBy(oPC, "pug_holocom"))==TRUE)
        {
        FloatingTextStringOnCreature("You have sent a transmission request to "+GetName(GetLocalObject(oPC, "HOLOCOM_CALL_"+sMsg)), oPC, FALSE);
        oReceiver = GetLocalObject(oPC, "HOLOCOM_CALL_"+sMsg);
        FloatingTextStringOnCreature("Incoming transmission from "+GetName(oPC)+", activate transmitter to accept or say deny to deny transmission", oReceiver, FALSE);
        SetLocalInt(oReceiver, "HOLOCOM_REQUEST", TRUE);
        SetLocalInt(oPC, "HOLOCOM_CHOOSE_CALL", FALSE);
        SetLocalObject(oReceiver, "HOLOCOM_CALLER", oPC);
        }
    else if (GetStringUpperCase(sMsg) == "DENY" && GetLocalInt(oPC, "HOLOCOM_REQUEST") == TRUE && GetIsObjectValid(GetItemPossessedBy(oPC, "pug_holocom"))==TRUE)
        {
        SetLocalInt(oPC, "HOLOCOM_REQUEST", FALSE);
        FloatingTextStringOnCreature("Transmission Denied", GetLocalObject(oPC, "HOLOCOM_CALLER"),FALSE);
        FloatingTextStringOnCreature("Transmission Denied", oPC,FALSE);
        DeleteLocalObject(oPC, "HOLOCOM_CALLER");
        }
    }
if (GetLocalInt(oPC, "FAC_COMM") == TRUE  && GetPCChatVolume() != TALKVOLUME_TELL && GetPCChatVolume() != TALKVOLUME_SHOUT && GetPCChatVolume() != TALKVOLUME_PARTY && GetPCChatVolume() != TALKVOLUME_SILENT_SHOUT )
    {
        object oOther = GetFirstPC();
        while (GetIsObjectValid(oOther))
            {
            if (GetFaction(oPC,FALSE) == GetFaction(oOther, FALSE) )
            {SendMessageToPC(oOther, "Radio <c0¡0>"+GetName(oPC)+": <cdd¡>"+sMsg);}
            oOther = GetNextPC();
            }
    }
}


