//::////////////////////////////////////////////////////////////////////////:://
//:: SIMTools V3.0 Speech Integration & Management Tools Version 3.0        :://
//:: Created By: FunkySwerve                                                :://
//:: Created On: April 4 2006                                               :://
//:: Last Updated: March 27 2007                                            :://
//:: With Thanks To:                                                        :://
//:: Dumbo - for his amazing plugin                                         :://
//:: Virusman - for Linux versions, and for the reset plugin, and for       :://
//::    his excellent events plugin, without which this update would not    :://
//::    be possible                                                         :://
//:: Dazzle - for his script samples                                        :://
//:: Butch - for the emote wand scripts                                     :://
//:: The DMFI project - for the languages conversions and many of the emotes:://
//:: Lanessar and the players of the Myth Drannor PW - for the new languages:://
//:: The players and DMs of Higher Ground for their input and playtesting   :://
//::////////////////////////////////////////////////////////////////////////:://

#include "fky_chat_inc"

const int NODE_TYPE_STARTING_NODE = 0;
const int NODE_TYPE_ENTRY_NODE    = 1;
const int NODE_TYPE_REPLY_NODE    = 2;

int GetCurrentNodeType();
int GetCurrentNodeID();
int GetCurrentAbsoluteNodeID();

int GetCurrentNodeType()
{
    SetLocalString(OBJECT_SELF, "NWNX!EVENTS!GETNODETYPE", "      ");
    return StringToInt(GetLocalString(OBJECT_SELF, "NWNX!EVENTS!GETNODETYPE"));
}

int GetCurrentNodeID()
{
    SetLocalString(OBJECT_SELF, "NWNX!EVENTS!GETNODEID", "      ");
    return StringToInt(GetLocalString(OBJECT_SELF, "NWNX!EVENTS!GETNODEID"));
}

int GetCurrentAbsoluteNodeID()
{
    SetLocalString(OBJECT_SELF, "NWNX!EVENTS!GETABSOLUTENODEID", "      ");
    return StringToInt(GetLocalString(OBJECT_SELF, "NWNX!EVENTS!GETABSOLUTENODEID"));
}


int StartingConditional()
{
    int nNodeType = GetCurrentNodeType();
    int nNodeID = GetCurrentNodeID();
    int nAbsNodeID = GetCurrentAbsoluteNodeID();
    object oPC = GetPCSpeaker();
    int nConvoID = GetLocalInt(oPC, "FKY_CHAT_CONVONUMBER");
    string sMenuTrack = GetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU");
    //SendMessageToPC(oPC, "Conditional script for node #"+IntToString(nNodeID)+"/"+IntToString(nAbsNodeID)+" (type "+IntToString(nNodeType)+")");
    switch(nConvoID)
    {
        case 1:
        switch(nNodeID)
        {
            case 2: if ((!ENABLE_WEAPON_VISUALS) && ((!ENABLE_PLAYER_SETNAME) && (!VerifyDMKey(oPC)) && (!VerifyAdminKey(oPC)))) return FALSE; break;
            case 3: if (!ENABLE_LANGUAGES) return FALSE; break;
            case 5: if (!ENABLE_METACHANNELS) return FALSE; break;
        }
        break;
        case 2:
        switch(nNodeID)
        {
            case 0: if (GetLocalInt(oPC, "FKY_CHAT_ANON")) return FALSE; break;
            case 1: if (!GetLocalInt(oPC, "FKY_CHAT_ANON")) return FALSE; break;
            case 3: if ((!(PLAYERS_CAN_DELETE)) && (!(DMS_CAN_DELETE && VerifyDMKey(oPC))) && (!VerifyAdminKey(oPC))) return FALSE; break;
            case 4: if ((!ENABLE_PLAYER_SETTAILWINGS) && (!VerifyDMKey(oPC)) && (!VerifyAdminKey(oPC))) return FALSE; break;
            case 5: if ((!ENABLE_PLAYER_SETTAILWINGS) && (!VerifyDMKey(oPC)) && (!VerifyAdminKey(oPC))) return FALSE; break;
        }
        break;
        case 3:
        switch(nNodeID)
        {
            case 7: if (oPC != GetFactionLeader(oPC)) return FALSE; break;
        }
        break;
        case 4:
        switch(nNodeID)
        {
            case 0: if (!ENABLE_WEAPON_VISUALS) return FALSE; break;
            case 1: if (!ENABLE_WEAPON_VISUALS) return FALSE; break;
            case 2: if (!ENABLE_WEAPON_VISUALS) return FALSE; break;
            case 3: if (!ENABLE_WEAPON_VISUALS) return FALSE; break;
            case 4: if (!ENABLE_WEAPON_VISUALS) return FALSE; break;
            case 5: if (!ENABLE_WEAPON_VISUALS) return FALSE; break;
            case 6: if (!ENABLE_WEAPON_VISUALS) return FALSE; break;
            case 7: if ((!ENABLE_PLAYER_SETNAME) && (!VerifyDMKey(oPC)) && (!VerifyAdminKey(oPC))) return FALSE; break;
            case 8: if ((!ENABLE_PLAYER_SETNAME) && (!VerifyDMKey(oPC)) && (!VerifyAdminKey(oPC))) return FALSE; break;
        }
        break;
        case 5:
        switch(nNodeID)
        {
            case 0: if (!ENABLE_LANGUAGES) return FALSE; break;
            case 1: if (!ENABLE_LANGUAGES) return FALSE; break;
            case 2: if (!ENABLE_LANGUAGES) return FALSE; break;
            case 3: if (!ENABLE_LANGUAGES) return FALSE; break;
        }
        break;
        case 6:
        switch(nNodeID)
        {
            case 4: if (!ENABLE_LANGUAGES) return FALSE; break;
            case 5: if (!ENABLE_LANGUAGES) return FALSE; break;;
        }
        break;
        case 7:
        switch(nNodeID)
        {
            case 0: if (!ENABLE_METACHANNELS) return FALSE; break;
            case 1: if (!ENABLE_METACHANNELS) return FALSE; break;
            case 2: if (!ENABLE_METACHANNELS) return FALSE; break;
            case 3: if (!ENABLE_METACHANNELS) return FALSE; break;
            case 4: if (!ENABLE_METACHANNELS) return FALSE; break;
            case 5: if (!ENABLE_METACHANNELS) return FALSE; break;
            case 6: if (!ENABLE_METACHANNELS) return FALSE; break;
            case 7: if (!ENABLE_METACHANNELS) return FALSE; break;
        }
        break;
        /*case 8: //no conditionals
        break;*/
        case 9:

        switch(nNodeID)
        {
            case 0:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            else if (!GetSpeaksAnyRacialPlanarLanguages(oPC)) return FALSE;
            break;
            case 1:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            else if (!GetSpeaksAnyRegionalLanguages(oPC)) return FALSE;
            break;
            case 2:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            else if (!GetSpeaksAnyClassLanguages(oPC)) return FALSE;
            break;
            case 3: if (sMenuTrack != "!speak ") return FALSE; break;//other language commands can't be used with common
            case 4: if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return FALSE; break;
            case 5: if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return FALSE; break;
            case 6: if (!(((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) && (VerifyDMKey(oPC) || VerifyAdminKey(oPC)))) return FALSE; break;
            case 7: if (!(((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) && (VerifyDMKey(oPC) || VerifyAdminKey(oPC)))) return FALSE; break;
        }
        break;/*
        case 11:
        break;
        case 12:
        break;*/
        case 13:
        if (LETO_FOR_ADMINS_ONLY && (!VerifyAdminKey(oPC))) return FALSE;
        break;
        /*case 14:
        break;
        case 15:
        break;
        case 16:
        break;
        case 17:
        break;
        case 18:
        break;
        case 19:
        break;*/
        case 20:
        if (!VerifyAdminKey(oPC)) return FALSE;//node 5 (reletive)
        break;
        /*case 21:
        break;
        case 22:
        break;
        case 23:
        break;
        case 24:
        break;
        case 25:
        break;*/
        case 26:
        switch(nNodeID)
        {
            case 1: if ( ((DM_PLAYERS_HEAR_DM && VerifyDMKey(oPC) && (!GetIsDM(oPC))) || (ADMIN_PLAYERS_HEAR_DM && VerifyAdminKey(oPC) && (!GetIsDM(oPC)))) ||
                         ((DMS_HEAR_META && VerifyDMKey(oPC) && GetIsDM(oPC)) || (DM_PLAYERS_HEAR_META && VerifyDMKey(oPC) && (!GetIsDM(oPC))) || (ADMIN_DMS_HEAR_META && VerifyAdminKey(oPC) && GetIsDM(oPC)) || (ADMIN_PLAYERS_HEAR_META && VerifyAdminKey(oPC) && (!GetIsDM(oPC)))) ||
                         ((DMS_HEAR_TELLS && VerifyDMKey(oPC) && GetIsDM(oPC)) || (DM_PLAYERS_HEAR_TELLS && VerifyDMKey(oPC) && (!GetIsDM(oPC))) || (ADMIN_DMS_HEAR_TELLS && VerifyAdminKey(oPC) && GetIsDM(oPC)) || (ADMIN_PLAYERS_HEAR_TELLS && VerifyAdminKey(oPC) && (!GetIsDM(oPC)))) ) return TRUE;
                         else return FALSE;
                         break;
            case 5: if (!ENABLE_LANGUAGES) return FALSE; break;
            case 6: if (!ENABLE_LANGUAGES) return FALSE; break;
        }
        break;
        case 27:
        switch(nNodeID)
        {
            case 0: if ((DM_PLAYERS_HEAR_DM && VerifyDMKey(oPC) && (!GetIsDM(oPC))) || (ADMIN_PLAYERS_HEAR_DM && VerifyAdminKey(oPC) && (!GetIsDM(oPC)))) return TRUE;
            else return FALSE;
            break;
            case 1: if ((DMS_HEAR_META && VerifyDMKey(oPC) && GetIsDM(oPC)) || (DM_PLAYERS_HEAR_META && VerifyDMKey(oPC) && (!GetIsDM(oPC))) || (ADMIN_DMS_HEAR_META && VerifyAdminKey(oPC) && GetIsDM(oPC)) || (ADMIN_PLAYERS_HEAR_META && VerifyAdminKey(oPC) && (!GetIsDM(oPC)))) return TRUE;
            else return FALSE;
            break;
            case 2: if ((DMS_HEAR_TELLS && VerifyDMKey(oPC) && GetIsDM(oPC)) || (DM_PLAYERS_HEAR_TELLS && VerifyDMKey(oPC) && (!GetIsDM(oPC))) || (ADMIN_DMS_HEAR_TELLS && VerifyAdminKey(oPC) && GetIsDM(oPC)) || (ADMIN_PLAYERS_HEAR_TELLS && VerifyAdminKey(oPC) && (!GetIsDM(oPC))))return TRUE;
            else return FALSE;
            break;
            case 3: if ((DM_PLAYERS_HEAR_DM && VerifyDMKey(oPC) && (!GetIsDM(oPC))) || (ADMIN_PLAYERS_HEAR_DM && VerifyAdminKey(oPC) && (!GetIsDM(oPC)))) return TRUE;
            return FALSE;
            break;
            case 4: if ((DMS_HEAR_META && VerifyDMKey(oPC) && GetIsDM(oPC)) || (DM_PLAYERS_HEAR_META && VerifyDMKey(oPC) && (!GetIsDM(oPC))) || (ADMIN_DMS_HEAR_META && VerifyAdminKey(oPC) && GetIsDM(oPC)) || (ADMIN_PLAYERS_HEAR_META && VerifyAdminKey(oPC) && (!GetIsDM(oPC)))) return TRUE;
            return FALSE;
            break;
            case 5: if ((DMS_HEAR_TELLS && VerifyDMKey(oPC) && GetIsDM(oPC)) || (DM_PLAYERS_HEAR_TELLS && VerifyDMKey(oPC) && (!GetIsDM(oPC))) || (ADMIN_DMS_HEAR_TELLS && VerifyAdminKey(oPC) && GetIsDM(oPC)) || (ADMIN_PLAYERS_HEAR_TELLS && VerifyAdminKey(oPC) && (!GetIsDM(oPC)))) return TRUE;
            return FALSE;
            break;
        }
        break;
        case 34: if (LETO_FOR_ADMINS_ONLY && (!VerifyAdminKey(oPC))) return FALSE;//nodes 0-5 (relative)
        break;
        case 36: if (LETO_FOR_ADMINS_ONLY && (!VerifyAdminKey(oPC))) return FALSE;//nodes 0-2 (relative)
        break;
        case 50:
        switch(nNodeID)
        {
            case 0:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetSpeaksAToDRacialPlanarLanguages(oPC)) return FALSE;
            break;
            case 1:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetSpeaksEToHRacialPlanarLanguages(oPC)) return FALSE;
            break;
            case 2:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetSpeaksIToORacialPlanarLanguages(oPC)) return FALSE;
            break;
            case 3:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetSpeaksPToZRacialPlanarLanguages(oPC)) return FALSE;
            break;
        }
        break;
        case 51:
        switch(nNodeID)
        {
            case 0:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG81")) return FALSE;
            break;
            case 1:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG37")) return FALSE;
            break;
            case 2:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG4")) return FALSE;
            break;
            case 3:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG6")) return FALSE;
            break;
            case 4:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG78")) return FALSE;
            break;
            case 5:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG65")) return FALSE;
            break;
            case 6:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG89")) return FALSE;
            break;
            case 7:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG63")) return FALSE;
            break;
            case 8:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG32")) return FALSE;
            break;
            case 9:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG13")) return FALSE;
            break;
            case 10:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG64")) return FALSE;
            break;
            case 11:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG1")) return FALSE;
            break;
        }
        break;
        case 52:
        switch(nNodeID)
        {
            case 0:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG9")) return FALSE;
            break;
            case 1:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG17")) return FALSE;
            break;
            case 2:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG66")) return FALSE;
            break;
            case 3:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG18")) return FALSE;
            break;
            case 4:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG15")) return FALSE;
            break;
            case 5:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG49")) return FALSE;
            break;
            case 6:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG52")) return FALSE;
            break;
            case 7:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG23")) return FALSE;
            break;
            case 8:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG53")) return FALSE;
            break;
            case 9:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG74")) return FALSE;
            break;
            case 10:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG62")) return FALSE;
            break;
        }
        break;
        case 53:
        switch(nNodeID)
        {
            case 0:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG21")) return FALSE;
            break;
            case 1:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG61")) return FALSE;
            break;
            case 2:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG72")) return FALSE;
            break;
            case 3:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG79")) return FALSE;
            break;
            case 4:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG67")) return FALSE;
            break;
            case 5:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG54")) return FALSE;
            break;
            case 6:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG55")) return FALSE;
            break;
            case 7:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG99")) return FALSE;
            break;
            case 8:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG60")) return FALSE;
            break;
            case 9:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG57")) return FALSE;
            break;
            case 10:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG82")) return FALSE;
            break;
            case 11:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG56")) return FALSE;
            break;
        }
        break;
        case 54:
        switch(nNodeID)
        {
            case 0:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG70")) return FALSE;
            break;
            case 1:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG58")) return FALSE;
            break;
            case 2:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG68")) return FALSE;
            break;
            case 3:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG73")) return FALSE;
            break;
            case 4:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG59")) return FALSE;
            break;
            case 5:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG75")) return FALSE;
            break;
            case 6:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG36")) return FALSE;
            break;
            case 7:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG40")) return FALSE;
            break;
            case 8:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG51")) return FALSE;
            break;
            case 9:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG41")) return FALSE;
            break;
            case 10:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG50")) return FALSE;
            break;
            case 11:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG46")) return FALSE;
            break;
            case 12:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG69")) return FALSE;
            break;
        }
        break;
        case 60:
        switch(nNodeID)
        {
            case 0:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetSpeaksAToHRegionalLanguages(oPC)) return FALSE;
            break;
            case 1:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetSpeaksIToRRegionalLanguages(oPC)) return FALSE;
            break;
            case 2:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetSpeaksSToZRegionalLanguages(oPC)) return FALSE;
            break;
        }
        break;
        case 61:
        switch(nNodeID)
        {
            case 0:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG2")) return FALSE;
            break;
            case 1:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG3")) return FALSE;
            break;
            case 2:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG7")) return FALSE;
            break;
            case 3:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG8")) return FALSE;
            break;
            case 4:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG10")) return FALSE;
            break;
            case 5:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG11")) return FALSE;
            break;
            case 6:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG12")) return FALSE;
            break;
            case 7:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG16")) return FALSE;
            break;
            case 8:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG19")) return FALSE;
            break;
            case 9:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG20")) return FALSE;
            break;
            case 10:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG76")) return FALSE;
            break;
            }
        break;
        case 62:
        switch(nNodeID)
        {
            case 0:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG22")) return FALSE;
            break;
            case 1:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG24")) return FALSE;
            break;
            case 2:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG25")) return FALSE;
            break;
            case 3:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG26")) return FALSE;
            break;
            case 4:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG27")) return FALSE;
            break;
            case 5:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG28")) return FALSE;
            break;
            case 6:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG29")) return FALSE;
            break;
            case 7:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG30")) return FALSE;
            break;
            case 8:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG31")) return FALSE;
            break;
        }
        break;
        case 63:
        switch(nNodeID)
        {
            case 0:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG33")) return FALSE;
            break;
            case 1:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG34")) return FALSE;
            break;
            case 2:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG35")) return FALSE;
            break;
            case 3:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG38")) return FALSE;
            break;
            case 4:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG39")) return FALSE;
            break;
            case 5:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG42")) return FALSE;
            break;
            case 6:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG43")) return FALSE;
            break;
            case 7:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG45")) return FALSE;
            break;
            case 8:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG47")) return FALSE;
            break;
            case 9:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG48")) return FALSE;
            break;
        }
        break;
        case 70:
        switch(nNodeID)
        {
            case 0:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG5")) return FALSE;
            break;
            case 1:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG14")) return FALSE;
            break;
            case 2:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG71")) return FALSE;
            break;
            case 3:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG80")) return FALSE;
            break;
            case 4:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG77")) return FALSE;
            break;
            case 5:
            if ((sMenuTrack == "dm_learn ") || (sMenuTrack == "dm_unlearn ")) return TRUE;
            if (!GetLocalInt(oPC, "FKY_CHAT_LANG44")) return FALSE;
            break;
        }
        break;
        case 80:
        switch(nAbsNodeID)
        {
            case 22:
            case 24:
            case 25:
            case 127: if (GetGender(oPC) == GENDER_FEMALE) return FALSE; break;
            case 63: if (GetGender(oPC) == GENDER_MALE) return FALSE; break;
        }
        break;
    }
    return TRUE;
}
