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


//1REQUIRES_INPUT !settail           int
//2//REQUIRES_INPUT !setwings          int
//3//REQUIRES_INPUT_2 !skillcheck      int//, int - menu?
//4//REQUIRES_INPUT dm_align_chaos     int
//5//REQUIRES_INPUT dm_align_evil      int
//6//REQUIRES_INPUT dm_align_good      int
//7//REQUIRES_INPUT dm_align_law       int
//8//REQUIRES_INPUT 3-4 dm_fx          int //int int (string/int)
//9//REQUIRES_INPUT 3-4 dm_fx_loc      int //int int (string/int)
//10//REQUIRES_INPUT dm_setcha          int
//11//REQUIRES_INPUT dm_setcon          int
//12//REQUIRES_INPUT dm_setdex          int
//13//REQUIRES_INPUT dm_setint          int
//14//REQUIRES_INPUT dm_setstr          int
//15//REQUIRES_INPUT dm_setwis          int
//16//REQUIRES_INPUT dm_setfort         int
//17//REQUIRES_INPUT dm_setreflex       int
//18//REQUIRES_INPUT dm_setwill         int
//19//REQUIRES_INPUT dm_change_appear   int
//20//REQUIRES_INPUT dm_givexp          int
//21//REQUIRES_INPUT dm_takexp          int
//22//REQUIRES_INPUT dm_givepartyxp     int
//23//REQUIRES_INPUT dm_takepartyxp     int
//24//REQUIRES_INPUT dm_givelevel       int
//25//REQUIRES_INPUT dm_takelevel       int
//26//REQUIRES_INPUT dm_givepartylevel  int
//27//REQUIRES_INPUT dm_takepartylevel  int
//28//REQUIRES_INPUT /l               string//, string - language menu
//29//REQUIRES_INPUT /m                string
//30//REQUIRES_INPUT /v                 string
//31//REQUIRES_INPUT !setname         string
//32//REQUIRES_INPUT !setnameall      string
//33//REQUIRES_INPUT dm_create          string
//34//REQUIRES_INPUT dm_spawn           string
//35//REQUIRES_INPUT dm_sql             string
//36//REQUIRES_INPUT dm_getvarint       string
//37//REQUIRES_INPUT dm_getvarfloat     string
//38//REQUIRES_INPUT dm_getvarstring    string
//39//REQUIRES_INPUT dm_getvarmodint    string
//40//REQUIRES_INPUT dm_getvarmodfloat  string
//41//REQUIRES_INPUT dm_getvarmodstring string
//42//REQUIRES_INPUT dm_settime         int
//43//REQUIRES_INPUT dm_portway         string
//44//REQUIRES_INPUT dm_portpartyway    string
//70//REQUIRES_INPUT 2 dm_setvarint     string, int
//71//REQUIRES_INPUT 2 dm_setvarfloat   string, float
//72//REQUIRES_INPUT 2 dm_setvarstring  string, string
//73//REQUIRES_INPUT 2 dm_setvarmodint      string, int
//74//REQUIRES_INPUT 2 dm_setvarmodfloat    string, float
//75//REQUIRES_INPUT 2 dm_setvarmodstring   string, string
void CommandCompletionStart(object oPlayer, int nCommandNumber, string sMessage = "", string sColor = COLOR_GOLD);

string GetFistPhaseMessage(int nCommand, object oPlayer)
{
    int nBreak = nCommand/10;
    string sReturn;
    switch (nBreak)
    {
        case 0:
        switch(nCommand)
        {
            case 1: sReturn = COMCOM1; break;
            case 2: sReturn = COMCOM2; break;
            case 3: sReturn = COMCOM3; break;
            case 4:
            case 5:
            case 6:
            case 7: sReturn = COMCOM4; break;
            case 8:
            case 9:
            if (GetLocalInt(oPlayer, "FKY_CHAT_COMMAND_COM_STAGE") == 1) sReturn = COMCOM5;
            else sReturn = COMCOM5b;
            break;
        }
        break;
        case 1:
        switch(nCommand)
        {
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15: sReturn = COMCOM6; break;
            case 16:
            case 17:
            case 18: sReturn = COMCOM7; break;
            case 19: sReturn = COMCOM8; break;
        }
        break;
        case 2:
        switch(nCommand)
        {
            case 20:
            case 21:
            case 22:
            case 23: sReturn = COMCOM9; break;
            case 24:
            case 25:
            case 26:
            case 27: sReturn = COMCOM10; break;
            case 28:
            case 29: sReturn = COMCOM11; break;
        }
        break;
        case 3:
        switch(nCommand)
        {
            case 30: sReturn = COMCOM11; break;
            case 31:
            case 32: sReturn = COMCOM12; break;
            case 33:
            case 34: sReturn = COMCOM13; break;
            case 35: sReturn = COMCOM14; break;
            case 36:
            case 37:
            case 38:
            case 39: sReturn = COMCOM15; break;
        }
        break;
        case 4:
        switch(nCommand)
        {
            case 40:
            case 41: sReturn = COMCOM15; break;
            case 42: sReturn = COMCOM18; break;
            case 43:
            case 44: sReturn = COMCOM19; break;
        }
        break;
        /*case 5:
        break;
        case 6:
        break;*/
        case 7:
        /*switch(nCommand)
        {
            case 70:
            case 71:
            case 72:
            case 73:
            case 74:
            case 75:*/ sReturn = COMCOM16;/* break;
        }*/
        break;
    }
    string sFinal = COLOR_GOLD+sReturn+COLOR_END;
    return sFinal;
}



void CommandCompletionStart(object oPlayer, int nCommandNumber, string sMessage = "", string sColor = COLOR_GOLD)
{
    SetLocalInt(oPlayer, "FKY_CHAT_COMMAND_COMPLETE", nCommandNumber);
    if ((nCommandNumber > 69) || (GetLocalString(oPlayer, "FKY_CHAT_COMMAND_COM_FX_TYPE") == "1"))SetLocalInt(oPlayer, "FKY_CHAT_COMMAND_COM_STAGE", 2);
    else SetLocalInt(oPlayer, "FKY_CHAT_COMMAND_COM_STAGE", 1);
    string sTrack = "";
    //pickup command additions already entered from menu
    //menu var -> tracking string "FKY_CHAT_COMMAND_COM_TRACKING"
    string sAdd = GetLocalString(oPlayer, "FKY_CHAT_COMMAND_COM_MENU");
    //delete menu var, set tracking string
    sTrack = sAdd;
    DeleteLocalString(oPlayer, "FKY_CHAT_COMMAND_COM_MENU");
    SetLocalString(oPlayer, "FKY_CHAT_COMMAND_COM_TRACKING", sTrack); //will be name of language, number of skill - no spaces
    if (sMessage == "") sMessage = GetFistPhaseMessage(nCommandNumber, oPlayer);
    else sMessage = sColor+sMessage+COLOR_END;
    FloatingTextStringOnCreature(sMessage,oPlayer,FALSE);
}

void LanguageCompletion(object oPlayer, string sLang)
{
    string sString = GetLocalString(oPlayer, "FKY_CHAT_COMMAND_COM_MENU");
    if (sString == "/l ")
    {
        SetLocalString(oPlayer, "FKY_CHAT_COMMAND_COM_MENU", sLang);
        CommandCompletionStart(oPlayer, 28);
    }
    else //"!speak ", "dm_learn ", "dm_unlearn "
    {
        DeleteLocalString(oPlayer, "FKY_CHAT_COMMAND_COM_MENU");
        AssignCommand(oPlayer, SpeakString(sString+sLang));
    }
}

int GetSelectedAbsoluteNodeID()
{
    SetLocalString(OBJECT_SELF, "NWNX!EVENTS!GETABSOLUTENODEID", "      ");
    return StringToInt(GetLocalString(OBJECT_SELF, "NWNX!EVENTS!GETABSOLUTENODEID"));
}

void main()
{
    object oPC = GetPCSpeaker();
    string sLang;
    int nConvoID = GetLocalInt(oPC, "FKY_CHAT_CONVONUMBER");
    DeleteLocalInt(oPC, "FKY_CHAT_CONVONUMBER");
    int nSelectedNode = StringToInt(GetLocalString(oPC, "NWNX!EVENTS!SELECTEDNODE"));
    int nAbsolute = GetSelectedAbsoluteNodeID();
    int nSwitch, nSwitch2;

    switch(nConvoID)
    {
        case 1:
        switch(nSelectedNode)
        {
            case 0: CommandRedirect(oPC, 2, ""); break;
            case 1: CommandRedirect(oPC, 3, ""); break;
            case 2: CommandRedirect(oPC, 4, ""); break;
            case 3: CommandRedirect(oPC, 5, ""); break;
            case 4: CommandRedirect(oPC, 6, ""); break;
            case 5: CommandRedirect(oPC, 7, ""); break;
            case 6: CommandRedirect(oPC, 8, ""); break;
        }
        break;
        case 2:
        switch(nSelectedNode)
        {
            case 0: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "anon")); break;
            case 1: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "unanon")); break;
            case 2: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "playerinfo")); break;
            case 3: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "delete")); break;
            case 4: CommandCompletionStart(oPC, 1); break;//REQUIRES_INPUT !settail
            case 5: CommandCompletionStart(oPC, 2); break;//REQUIRES_INPUT !setwings
            case 6: CommandRedirect(oPC, 1, ""); break;
        }
        break;
        case 3:
        switch(nSelectedNode)
        {
            case 0: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "d4")); break;
            case 1: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "d6")); break;
            case 2: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "d8")); break;
            case 3: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "d10")); break;
            case 4: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "d12")); break;
            case 5: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "d20")); break;
            case 6: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "d100")); break;
            case 7: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "partyroll")); break;
            case 8: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 75); break;//REQUIRES_INPUT !skillcheck
            case 9: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "skillslist")); break;
            case 10: CommandRedirect(oPC, 1, ""); break;
        }
        break;
        case 4:
        switch(nSelectedNode)
        {
            case 0: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "wpac")); break;
            case 1: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "wpco")); break;
            case 2: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "wpel")); break;
            case 3: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "wpev")); break;
            case 4: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "wpfi")); break;
            case 5: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "wpho")); break;
            case 6: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "wpnone")); break;
            case 7: CommandCompletionStart(oPC, 31); break;//REQUIRES_INPUT !setname
            case 8: CommandCompletionStart(oPC, 32); break;//REQUIRES_INPUT !setnameall
            case 9: CommandRedirect(oPC, 1, ""); break;
        }
        break;
        case 5:
        switch(nSelectedNode)
        {
            case 0: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "list languages")); break;
            case 1: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "list alllanguages")); break;
            case 2: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "/l ");CommandRedirect(oPC, 9, ""); break;//REQUIRES_INPUT 2 /l - redirect to lang menu when complete, add to tracking var
            case 3: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", COMMAND_SYMBOL + "speak "); CommandRedirect(oPC, 9, ""); break;//REQUIRES_INPUT !speak - redirect to lang menu when complete, add to tracking var
            case 4: CommandRedirect(oPC, 1, ""); break;
        }
        break;
        case 6:
        switch(nSelectedNode)
        {
            case 0: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "help")); break;
            case 1: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "list emotes")); break;
            case 2: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "list commands")); break;
            case 3: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "list ignored")); break;
            case 4: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "list languages")); break;
            case 5: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "list alllanguages")); break;
            case 6: CommandRedirect(oPC, 1, ""); break;
        }
        break;
        case 7:
        switch(nSelectedNode)
        {
            case 0: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "metaaccept")); break;
            case 1: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "metadecline")); break;
            case 2: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "metadisband")); break;
            case 3: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "metainvite")); break;
            case 4: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "metakick")); break;
            case 5: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "metaleave")); break;
            case 6: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "metalist")); break;
            case 7: CommandCompletionStart(oPC, 29); break;//REQUIRES_INPUT  /m
            case 8: CommandRedirect(oPC, 1, ""); break;
        }
        break;
        case 8:
        switch(nSelectedNode)
        {
            case 0: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "ignore")); break;
            case 1: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "unignore")); break;
            case 2: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "list ignored")); break;
            case 3: AssignCommand(oPC, SpeakString(COMMAND_SYMBOL + "lfg")); break;
            case 4: CommandRedirect(oPC, 1, ""); break;
        }
        break;
        case 9:
        switch(nSelectedNode)
        {
            case 0: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 50); break;
            case 1: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 60); break;
            case 2: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 70); break;
            case 3: sLang = "common"; LanguageCompletion(oPC, sLang); break;//REQUIRES_INPUT lang common
            case 4: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 5, ""); break;
            case 5: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 1, ""); break;
            case 6: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 26, ""); break;
            case 7: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 11, ""); break;
            case 8: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); break;
        }
        break;
        /*case 10:
        break;*/
        case 11:
        switch(nSelectedNode)
        {
            case 0: CommandRedirect(oPC, 12, ""); break;
            case 1: CommandRedirect(oPC, 20, ""); break;
            case 2: CommandRedirect(oPC, 23, ""); break;
            case 3: CommandRedirect(oPC, 25, ""); break;
            case 4: CommandRedirect(oPC, 26, ""); break;
        }
        break;
        case 12:
        switch(nSelectedNode)
        {
            case 0: CommandRedirect(oPC, 13, ""); break;
            case 1: CommandRedirect(oPC, 14, ""); break;
            case 2: CommandRedirect(oPC, 15, ""); break;
            case 3: CommandRedirect(oPC, 16, ""); break;
            case 4: CommandRedirect(oPC, 19, ""); break;
            case 5: CommandRedirect(oPC, 17, ""); break;
            case 6: CommandRedirect(oPC, 18, ""); break;
            case 7: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 13:
        switch(nSelectedNode)
        {
            case 0: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 34); break;
            case 1: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 35); break;
            case 2: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 36); break;
            case 3: CommandRedirect(oPC, 12, ""); break;
            case 4: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 14:
        switch(nSelectedNode)
        {
            case 0: CommandCompletionStart(oPC, 4); break;//REQUIRES_INPUT dm_align_chaos
            case 1: CommandCompletionStart(oPC, 5); break;//REQUIRES_INPUT dm_align_evil
            case 2: CommandCompletionStart(oPC, 6); break;//REQUIRES_INPUT dm_align_good
            case 3: CommandCompletionStart(oPC, 7); break;//REQUIRES_INPUT dm_align_law
            case 4: CommandRedirect(oPC, 12, ""); break;
            case 5: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 15:
        switch(nSelectedNode)
        {
            case 0: AssignCommand(oPC, SpeakString("dm_invis")); break;
            case 1: AssignCommand(oPC, SpeakString("dm_uninvis")); break;
            case 2: AssignCommand(oPC, SpeakString("dm_invuln")); break;
            case 3: AssignCommand(oPC, SpeakString("dm_uninvuln")); break;
            case 4: AssignCommand(oPC, SpeakString("dm_rest")); break;
            case 5: AssignCommand(oPC, SpeakString("dm_kill")); break;
            case 6: AssignCommand(oPC, SpeakString("dm_rez")); break;
            case 7: AssignCommand(oPC, SpeakString("dm_boot")); break;
            case 8: AssignCommand(oPC, SpeakString("dm_freeze")); break;
            case 9: AssignCommand(oPC, SpeakString("dm_unfreeze")); break;
            case 10: CommandRedirect(oPC, 12, ""); break;
            case 11: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 16:
        switch(nSelectedNode)
        {
            case 0: AssignCommand(oPC, SpeakString("dm_boot")); break;
            case 1: AssignCommand(oPC, SpeakString("dm_bandm")); break;
            case 2: AssignCommand(oPC, SpeakString("dm_banplayer_perm")); break;
            case 3: AssignCommand(oPC, SpeakString("dm_banplayer_temp")); break;
            case 4: AssignCommand(oPC, SpeakString("dm_banshout_perm")); break;
            case 5: AssignCommand(oPC, SpeakString("dm_banshout_temp")); break;
            case 6: AssignCommand(oPC, SpeakString("dm_getbanlist")); break;
            case 7: AssignCommand(oPC, SpeakString("dm_getbanreason")); break;
            case 8: AssignCommand(oPC, SpeakString("dm_unbandm")); break;
            case 9: AssignCommand(oPC, SpeakString("dm_unbanshout")); break;
            case 10: CommandRedirect(oPC, 12, ""); break;
            case 11: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 17:
        switch(nSelectedNode)
        {
            case 0: CommandCompletionStart(oPC, 33); break;//REQUIRES_INPUT dm_create
            case 1: AssignCommand(oPC, SpeakString("dm_item_id")); break;
            case 2: AssignCommand(oPC, SpeakString("dm_item_destroy_all")); break;
            case 3: AssignCommand(oPC, SpeakString("dm_item_destroy_equip")); break;
            case 4: AssignCommand(oPC, SpeakString("dm_item_destroy_inv")); break;
            case 5: CommandRedirect(oPC, 12, ""); break;
            case 6: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 18:
        switch(nSelectedNode)
        {
            case 0: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 37); break;
            case 1: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 38); break;
            case 2: AssignCommand(oPC, SpeakString("dm_jump")); break;
            case 3: CommandRedirect(oPC, 12, ""); break;
            case 4: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 19:
        switch(nSelectedNode)
        {
            case 0: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 39); break;
            case 1: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 40); break;
            case 2: CommandRedirect(oPC, 12, ""); break;
            case 3: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 20:
        switch(nSelectedNode)
        {
            case 0: CommandRedirect(oPC, 21, ""); break;
            case 1: CommandRedirect(oPC, 22, ""); break;
            case 2: AssignCommand(oPC, SpeakString("dm_reveal")); break;
            case 3: AssignCommand(oPC, SpeakString("dm_hide")); break;
            case 4: AssignCommand(oPC, SpeakString("dm_reset_mod")); break;
            case 5: CommandCompletionStart(oPC, 35); break;//REQUIRES_INPUT dm_sql
            case 6: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 21:
        switch(nSelectedNode)
        {
            case 0: CommandCompletionStart(oPC, 42); break; //REQUIRES_INPUT dm_settime
            case 1: AssignCommand(oPC, SpeakString("dm_setweather_a_clear")); break;
            case 2: AssignCommand(oPC, SpeakString("dm_setweather_a_rain")); break;
            case 3: AssignCommand(oPC, SpeakString("dm_setweather_a_reset")); break;
            case 4: AssignCommand(oPC, SpeakString("dm_setweather_a_snow")); break;
            case 5: AssignCommand(oPC, SpeakString("dm_setweather_m_clear")); break;
            case 6: AssignCommand(oPC, SpeakString("dm_setweather_m_rain")); break;
            case 7: AssignCommand(oPC, SpeakString("dm_setweather_m_reset")); break;
            case 8: AssignCommand(oPC, SpeakString("dm_setweather_m_snow")); break;
            case 9: CommandRedirect(oPC, 20, ""); break;
            case 10: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 22:
        switch(nSelectedNode)
        {
            case 0: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 41); break;
            case 1: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 42); break;
            case 2: CommandRedirect(oPC, 20, ""); break;
            case 3: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 23:
        switch(nSelectedNode)
        {
            case 0: CommandRedirect(oPC, 24, ""); break;
            case 1: CommandCompletionStart(oPC, 34); break;//REQUIRES_INPUT dm_spawn
            case 2: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 24:
        switch(nSelectedNode)
        {
            case 0: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 29); break;
            case 1: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 30); break;
            case 2: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 31); break;
            case 3: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 32); break;
            case 4: CommandRedirect(oPC, 23, ""); break;
            case 5: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 25:
        switch(nSelectedNode)
        {
            case 0: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 33); break;
            case 1: SetLocalInt(oPC, "FKY_CHAT_COMMAND_COM_FX_FUNC", 1); CommandRedirect(oPC, 43, ""); break;//REQUIRES_INPUT 3-4 dm_fx
            case 2: SetLocalInt(oPC, "FKY_CHAT_COMMAND_COM_FX_FUNC", 2); CommandRedirect(oPC, 43, ""); break;//REQUIRES_INPUT 3-4 dm_fx_loc
            case 3: AssignCommand(oPC, SpeakString("dm_fx_rem")); break;
            case 4: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 26:
        switch(nSelectedNode)
        {
            case 0: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 28); break;
            case 1: CommandRedirect(oPC, 27, ""); break;
            case 2: AssignCommand(oPC, SpeakString("dm_help")); break;
            case 3: AssignCommand(oPC, SpeakString("dm_stealth")); break;
            case 4: AssignCommand(oPC, SpeakString("dm_listcommands")); break;
            case 5: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "dm_learn "); CommandRedirect(oPC, 9, ""); break;//REQUIRES_INPUT dm_learn
            case 6: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "dm_unlearn "); CommandRedirect(oPC, 9, ""); break;//REQUIRES_INPUT dm_unlearn
            case 7: CommandCompletionStart(oPC, 30); break;//REQUIRES_INPUT /v
            case 8: AssignCommand(oPC, SpeakString("dm_vent")); break;
            case 9: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 27:
        switch(nSelectedNode)
        {
            case 0: AssignCommand(oPC, SpeakString("dm_ignoredm")); break;
            case 1: AssignCommand(oPC, SpeakString("dm_ignoremeta")); break;
            case 2: AssignCommand(oPC, SpeakString("dm_ignoretells")); break;
            case 3: AssignCommand(oPC, SpeakString("dm_unignoredm")); break;
            case 4: AssignCommand(oPC, SpeakString("dm_unignoremeta")); break;
            case 5: AssignCommand(oPC, SpeakString("dm_unignoretells")); break;
            case 6: CommandRedirect(oPC, 26, ""); break;
            case 7: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 28:
        switch(nSelectedNode)
        {
            case 0: AssignCommand(oPC, SpeakString("dm_bandm")); break;
            case 1: AssignCommand(oPC, SpeakString("dm_banshout_temp")); break;
            case 2: AssignCommand(oPC, SpeakString("dm_banshout_perm")); break;
            case 3: AssignCommand(oPC, SpeakString("dm_unbandm")); break;
            case 4: AssignCommand(oPC, SpeakString("dm_unbanshout")); break;
            case 5: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 26); break;
            case 6: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 29:
        switch(nSelectedNode)
        {
            case 0: AssignCommand(oPC, SpeakString("dm_fac_c_allally")); break;
            case 1: AssignCommand(oPC, SpeakString("dm_fac_c_allfoe")); break;
            case 2: AssignCommand(oPC, SpeakString("dm_fac_c_peace")); break;
            case 3: AssignCommand(oPC, SpeakString("dm_fac_c_reset")); break;
            case 4: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 24); break;
            case 5: CommandRedirect(oPC, 23, ""); break;
            case 6: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 30:
        switch(nSelectedNode)
        {
            case 0: AssignCommand(oPC, SpeakString("dm_fac_p_allally")); break;
            case 1: AssignCommand(oPC, SpeakString("dm_fac_p_allfoe")); break;
            case 2: AssignCommand(oPC, SpeakString("dm_fac_p_peace")); break;
            case 3: AssignCommand(oPC, SpeakString("dm_fac_p_reset")); break;
            case 4: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 24); break;
            case 5: CommandRedirect(oPC, 23, ""); break;
            case 6: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 31:
        switch(nSelectedNode)
        {
            case 0: AssignCommand(oPC, SpeakString("dm_fac_a_allally")); break;
            case 1: AssignCommand(oPC, SpeakString("dm_fac_a_allfoe")); break;
            case 2: AssignCommand(oPC, SpeakString("dm_fac_a_peace")); break;
            case 3: AssignCommand(oPC, SpeakString("dm_fac_a_reset")); break;
            case 4: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 24); break;
            case 5: CommandRedirect(oPC, 23, ""); break;
            case 6: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 32:
        switch(nSelectedNode)
        {
            case 0: AssignCommand(oPC, SpeakString("dm_fac_m_allally")); break;
            case 1: AssignCommand(oPC, SpeakString("dm_fac_m_allfoe")); break;
            case 2: AssignCommand(oPC, SpeakString("dm_fac_m_peace")); break;
            case 3: AssignCommand(oPC, SpeakString("dm_fac_m_reset")); break;
            case 4: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 24); break;
            case 5: CommandRedirect(oPC, 23, ""); break;
            case 6: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 33:
        switch(nSelectedNode)
        {
            case 0: AssignCommand(oPC, SpeakString("dm_fx_list_bea")); break;
            case 1: AssignCommand(oPC, SpeakString("dm_fx_list_com")); break;
            case 2: AssignCommand(oPC, SpeakString("dm_fx_list_dur")); break;
            case 3: AssignCommand(oPC, SpeakString("dm_fx_list_eye")); break;
            case 4: AssignCommand(oPC, SpeakString("dm_fx_list_fnf")); break;
            case 5: AssignCommand(oPC, SpeakString("dm_fx_list_imp")); break;
            case 6: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 25); break;
            case 7: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 34:
        switch(nSelectedNode)
        {
            case 0: CommandCompletionStart(oPC, 10); break;//REQUIRES_INPUT dm_setcha
            case 1: CommandCompletionStart(oPC, 11); break;//REQUIRES_INPUT dm_setcon
            case 2: CommandCompletionStart(oPC, 12); break;//REQUIRES_INPUT dm_setdex
            case 3: CommandCompletionStart(oPC, 13); break;//REQUIRES_INPUT dm_setint
            case 4: CommandCompletionStart(oPC, 14); break;//REQUIRES_INPUT dm_setstr
            case 5: CommandCompletionStart(oPC, 15); break;//REQUIRES_INPUT dm_setwis
            case 6: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 13); break;
            case 7: CommandRedirect(oPC, 12, ""); break;
            case 8: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 35:
        switch(nSelectedNode)
        {
            case 0: CommandCompletionStart(oPC, 19); break;//REQUIRES_INPUT dm_change_appear
            case 1: AssignCommand(oPC, SpeakString("dm_change_appear base")); break;
            case 2: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 13); break;
            case 3: CommandRedirect(oPC, 12, ""); break;
            case 4: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 36:
        switch(nSelectedNode)
        {
            case 0: CommandCompletionStart(oPC, 16); break;//REQUIRES_INPUT dm_setfort
            case 1: CommandCompletionStart(oPC, 17); break;//REQUIRES_INPUT dm_setreflex
            case 2: CommandCompletionStart(oPC, 18); break;//REQUIRES_INPUT dm_setwill
            case 3: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 13); break;
            case 4: CommandRedirect(oPC, 12, ""); break;
            case 5: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 37:
        switch(nSelectedNode)
        {
            case 0: AssignCommand(oPC, SpeakString("dm_porthere")); break;
            case 1: AssignCommand(oPC, SpeakString("dm_porthell")); break;
            case 2: AssignCommand(oPC, SpeakString("dm_portjail")); break;
            case 3: AssignCommand(oPC, SpeakString("dm_portleader")); break;
            case 4: AssignCommand(oPC, SpeakString("dm_portthere")); break;
            case 5: AssignCommand(oPC, SpeakString("dm_porttown")); break;
            case 6: CommandCompletionStart(oPC, 43); break;//REQUIRES_INPUT dm_portway
            case 7: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 18); break;
            case 8: CommandRedirect(oPC, 12, ""); break;
            case 9: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 38:
        switch(nSelectedNode)
        {
            case 0: AssignCommand(oPC, SpeakString("dm_portpartyhere")); break;
            case 1: AssignCommand(oPC, SpeakString("dm_portpartyhell")); break;
            case 2: AssignCommand(oPC, SpeakString("dm_portpartyjail")); break;
            case 3: AssignCommand(oPC, SpeakString("dm_portpartyleader")); break;
            case 4: AssignCommand(oPC, SpeakString("dm_portpartythere")); break;
            case 5: AssignCommand(oPC, SpeakString("dm_portpartytown")); break;
            case 6: CommandCompletionStart(oPC, 44); break;//REQUIRES_INPUT dm_portpartyway
            case 7: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 18); break;
            case 8: CommandRedirect(oPC, 12, ""); break;
            case 9: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 39:
        switch(nSelectedNode)
        {
            case 0: CommandCompletionStart(oPC, 20); break;//REQUIRES_INPUT dm_givexp
            case 1: CommandCompletionStart(oPC, 24); break;//REQUIRES_INPUT dm_givelevel
            case 2: CommandCompletionStart(oPC, 21); break;//REQUIRES_INPUT dm_takexp
            case 3: CommandCompletionStart(oPC, 25); break;//REQUIRES_INPUT dm_takelevel
            case 4: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 19); break;
            case 5: CommandRedirect(oPC, 12, ""); break;
            case 6: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 40:
        switch(nSelectedNode)
        {
            case 0: CommandCompletionStart(oPC, 22); break;//REQUIRES_INPUT dm_givepartyxp
            case 1: CommandCompletionStart(oPC, 26); break;//REQUIRES_INPUT dm_givepartylevel
            case 2: CommandCompletionStart(oPC, 23); break;//REQUIRES_INPUT dm_takepartyxp
            case 3: CommandCompletionStart(oPC, 27); break;//REQUIRES_INPUT dm_takepartylevel
            case 4: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 19); break;
            case 5: CommandRedirect(oPC, 12, ""); break;
            case 6: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 41:
        switch(nSelectedNode)
        {
            case 0: CommandCompletionStart(oPC, 36); break;//REQUIRES_INPUT dm_getvarint
            case 1: CommandCompletionStart(oPC, 37); break;//REQUIRES_INPUT dm_getvarfloat
            case 2: CommandCompletionStart(oPC, 38); break;//REQUIRES_INPUT dm_getvarstring
            case 3: CommandCompletionStart(oPC, 39); break;//REQUIRES_INPUT dm_getvarmodint
            case 4: CommandCompletionStart(oPC, 40); break;//REQUIRES_INPUT dm_getvarmodfloat
            case 5: CommandCompletionStart(oPC, 41); break;//REQUIRES_INPUT dm_getvarmodstring
            case 6: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 22); break;
            case 7: CommandRedirect(oPC, 20, ""); break;
            case 8: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 42:
        switch(nSelectedNode)
        {
            case 0: CommandCompletionStart(oPC, 70); break;//REQUIRES_INPUT 2 dm_setvarint
            case 1: CommandCompletionStart(oPC, 71); break;//REQUIRES_INPUT 2 dm_setvarfloat
            case 2: CommandCompletionStart(oPC, 72); break;//REQUIRES_INPUT 2 dm_setvarstring
            case 3: CommandCompletionStart(oPC, 73); break;//REQUIRES_INPUT 2 dm_setvarmodint
            case 4: CommandCompletionStart(oPC, 74); break;//REQUIRES_INPUT 2 dm_setvarmodfloat
            case 5: CommandCompletionStart(oPC, 75); break;//REQUIRES_INPUT 2 dm_setvarmodstring
            case 6: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 22); break;
            case 7: CommandRedirect(oPC, 20, ""); break;
            case 8: CommandRedirect(oPC, 11, ""); break;
        }
        break;
        case 43:
        switch(nSelectedNode)
        {
            case 0:
            SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_FX_TYPE", "0 0");
            //no E/S subtype so go to completion - 1 stage, vfx #
            if (GetLocalInt(oPC, "FKY_CHAT_COMMAND_COM_FX_FUNC") == 2) CommandCompletionStart(oPC, 9);
            else CommandCompletionStart(oPC, 8);
            DeleteLocalInt(oPC, "FKY_CHAT_COMMAND_COM_FX_FUNC");
            break;
            case 1: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_FX_TYPE", "1"); CommandRedirect(oPC, 44, ""); break;//check E/S subtype
            case 2: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_FX_TYPE", "2 0"); CommandRedirect(oPC, 44, ""); break;//check E/S subtype
            case 3: DeleteLocalInt(oPC, "FKY_CHAT_COMMAND_COM_FX_FUNC"); CommandRedirect(oPC, 25, ""); break;
            case 4: DeleteLocalInt(oPC, "FKY_CHAT_COMMAND_COM_FX_FUNC"); CommandRedirect(oPC, 11, ""); break;
            case 5: DeleteLocalInt(oPC, "FKY_CHAT_COMMAND_COM_FX_FUNC"); break;
        }
        break;
        case 44:
        switch(nSelectedNode)
        {
            case 0:
            SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_FX_SUB", "E");
            if (GetLocalInt(oPC, "FKY_CHAT_COMMAND_COM_FX_FUNC") == 2) CommandCompletionStart(oPC, 9);
            else CommandCompletionStart(oPC, 8);
            DeleteLocalInt(oPC, "FKY_CHAT_COMMAND_COM_FX_FUNC");
            break;
            case 1:
             SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_FX_SUB", "S");
            if (GetLocalInt(oPC, "FKY_CHAT_COMMAND_COM_FX_FUNC") == 2) CommandCompletionStart(oPC, 9);
            else CommandCompletionStart(oPC, 8);
            DeleteLocalInt(oPC, "FKY_CHAT_COMMAND_COM_FX_FUNC");
            break;
            case 2:
            if (GetLocalInt(oPC, "FKY_CHAT_COMMAND_COM_FX_FUNC") == 2) CommandCompletionStart(oPC, 9);
            else CommandCompletionStart(oPC, 8);
            DeleteLocalInt(oPC, "FKY_CHAT_COMMAND_COM_FX_FUNC");
            break;
            case 3: DeleteLocalInt(oPC, "FKY_CHAT_COMMAND_COM_FX_FUNC"); DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_FX_TYPE"); CommandRedirect(oPC, 25, ""); break;
            case 4: DeleteLocalInt(oPC, "FKY_CHAT_COMMAND_COM_FX_FUNC"); DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_FX_TYPE"); CommandRedirect(oPC, 11, ""); break;
            case 5: DeleteLocalInt(oPC, "FKY_CHAT_COMMAND_COM_FX_FUNC"); DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_FX_TYPE"); break;
        }
        break;
        case 50:
        switch(nSelectedNode)
        {
            case 0: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 51); break;
            case 1: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 52); break;
            case 2: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 53); break;
            case 3: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 54); break;
            case 4: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 9); break;
            case 5: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 5, ""); break;
            case 6: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 1, ""); break;
            case 7: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); break;
        }
        break;
        case 51:
        switch(nSelectedNode)
        {
            case 0: sLang = GetNameOfLanguage(81); LanguageCompletion(oPC, sLang); break;
            case 1: sLang = GetNameOfLanguage(37); LanguageCompletion(oPC, sLang); break;
            case 2: sLang = GetNameOfLanguage(4); LanguageCompletion(oPC, sLang); break;
            case 3: sLang = GetNameOfLanguage(6); LanguageCompletion(oPC, sLang); break;
            case 4: sLang = GetNameOfLanguage(78); LanguageCompletion(oPC, sLang); break;
            case 5: sLang = GetNameOfLanguage(65); LanguageCompletion(oPC, sLang); break;
            case 6: sLang = GetNameOfLanguage(89); LanguageCompletion(oPC, sLang); break;
            case 7: sLang = GetNameOfLanguage(63); LanguageCompletion(oPC, sLang); break;
            case 8: sLang = GetNameOfLanguage(32); LanguageCompletion(oPC, sLang); break;
            case 9: sLang = GetNameOfLanguage(13); LanguageCompletion(oPC, sLang); break;
            case 10: sLang = GetNameOfLanguage(64); LanguageCompletion(oPC, sLang); break;
            case 11: sLang = GetNameOfLanguage(1); LanguageCompletion(oPC, sLang); break;
            case 12: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 9); break;
            case 13: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 5, ""); break;
            case 14: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 1, ""); break;
            case 15: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); break;
        }
        break;
        case 52:
        switch(nSelectedNode)
        {
            case 0: sLang = GetNameOfLanguage(9); LanguageCompletion(oPC, sLang); break;
            case 1: sLang = GetNameOfLanguage(17); LanguageCompletion(oPC, sLang); break;
            case 2: sLang = GetNameOfLanguage(66); LanguageCompletion(oPC, sLang); break;
            case 3: sLang = GetNameOfLanguage(18); LanguageCompletion(oPC, sLang); break;
            case 4: sLang = GetNameOfLanguage(15); LanguageCompletion(oPC, sLang); break;
            case 5: sLang = GetNameOfLanguage(49); LanguageCompletion(oPC, sLang); break;
            case 6: sLang = GetNameOfLanguage(52); LanguageCompletion(oPC, sLang); break;
            case 7: sLang = GetNameOfLanguage(23); LanguageCompletion(oPC, sLang); break;
            case 8: sLang = GetNameOfLanguage(53); LanguageCompletion(oPC, sLang); break;
            case 9: sLang = GetNameOfLanguage(74); LanguageCompletion(oPC, sLang); break;
            case 10: sLang = GetNameOfLanguage(62); LanguageCompletion(oPC, sLang); break;
            case 11: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 9); break;
            case 12: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 5, ""); break;
            case 13: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 1, ""); break;
            case 14: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); break;
        }
        break;
        case 53:
        switch(nSelectedNode)
        {
            case 0: sLang = GetNameOfLanguage(21); LanguageCompletion(oPC, sLang); break;
            case 1: sLang = GetNameOfLanguage(61); LanguageCompletion(oPC, sLang); break;
            case 2: sLang = GetNameOfLanguage(72); LanguageCompletion(oPC, sLang); break;
            case 3: sLang = GetNameOfLanguage(79); LanguageCompletion(oPC, sLang); break;
            case 4: sLang = GetNameOfLanguage(67); LanguageCompletion(oPC, sLang); break;
            case 5: sLang = GetNameOfLanguage(54); LanguageCompletion(oPC, sLang); break;
            case 6: sLang = GetNameOfLanguage(55); LanguageCompletion(oPC, sLang); break;
            case 7: sLang = GetNameOfLanguage(99); LanguageCompletion(oPC, sLang); break;
            case 8: sLang = GetNameOfLanguage(60); LanguageCompletion(oPC, sLang); break;
            case 9: sLang = GetNameOfLanguage(57); LanguageCompletion(oPC, sLang); break;
            case 10: sLang = GetNameOfLanguage(82); LanguageCompletion(oPC, sLang); break;
            case 11: sLang = GetNameOfLanguage(56); LanguageCompletion(oPC, sLang); break;
            case 12: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 9); break;
            case 13: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 5, ""); break;
            case 14: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 1, ""); break;
            case 15: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); break;
        }
        break;
        case 54:
        switch(nSelectedNode)
        {
            case 0: sLang = GetNameOfLanguage(70); LanguageCompletion(oPC, sLang); break;
            case 1: sLang = GetNameOfLanguage(58); LanguageCompletion(oPC, sLang); break;
            case 2: sLang = GetNameOfLanguage(68); LanguageCompletion(oPC, sLang); break;
            case 3: sLang = GetNameOfLanguage(73); LanguageCompletion(oPC, sLang); break;
            case 4: sLang = GetNameOfLanguage(59); LanguageCompletion(oPC, sLang); break;
            case 5: sLang = GetNameOfLanguage(75); LanguageCompletion(oPC, sLang); break;
            case 6: sLang = GetNameOfLanguage(36); LanguageCompletion(oPC, sLang); break;
            case 7: sLang = GetNameOfLanguage(40); LanguageCompletion(oPC, sLang); break;
            case 8: sLang = GetNameOfLanguage(51); LanguageCompletion(oPC, sLang); break;
            case 9: sLang = GetNameOfLanguage(41); LanguageCompletion(oPC, sLang); break;
            case 10: sLang = GetNameOfLanguage(50); LanguageCompletion(oPC, sLang); break;
            case 11: sLang = GetNameOfLanguage(46); LanguageCompletion(oPC, sLang); break;
            case 12: sLang = GetNameOfLanguage(69); LanguageCompletion(oPC, sLang); break;
            case 13: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 9); break;
            case 14: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 5, ""); break;
            case 15: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 1, ""); break;
            case 16: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); break;
        }
        break;
        case 60:
        switch(nSelectedNode)
        {
            case 0: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 61); break;
            case 1: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 62); break;
            case 2: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 63); break;
            case 3: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 9); break;
            case 4: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 5, ""); break;
            case 5: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 1, ""); break;
            case 6: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); break;
        }
        break;
        case 61:
        switch(nSelectedNode)
        {
            case 0: sLang = GetNameOfLanguage(2); LanguageCompletion(oPC, sLang); break;
            case 1: sLang = GetNameOfLanguage(3); LanguageCompletion(oPC, sLang); break;
            case 2: sLang = GetNameOfLanguage(7); LanguageCompletion(oPC, sLang); break;
            case 3: sLang = GetNameOfLanguage(8); LanguageCompletion(oPC, sLang); break;
            case 4: sLang = GetNameOfLanguage(10); LanguageCompletion(oPC, sLang); break;
            case 5: sLang = GetNameOfLanguage(11); LanguageCompletion(oPC, sLang); break;
            case 6: sLang = GetNameOfLanguage(12); LanguageCompletion(oPC, sLang); break;
            case 7: sLang = GetNameOfLanguage(16); LanguageCompletion(oPC, sLang); break;
            case 8: sLang = GetNameOfLanguage(19); LanguageCompletion(oPC, sLang); break;
            case 9: sLang = GetNameOfLanguage(20); LanguageCompletion(oPC, sLang); break;
            case 10: sLang = GetNameOfLanguage(76); LanguageCompletion(oPC, sLang); break;
            case 11: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 9); break;
            case 12: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 5, ""); break;
            case 13: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 1, ""); break;
            case 14: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); break;
        }
        break;
        case 62:
        switch(nSelectedNode)
        {
            case 0: sLang = GetNameOfLanguage(22); LanguageCompletion(oPC, sLang); break;
            case 1: sLang = GetNameOfLanguage(24); LanguageCompletion(oPC, sLang); break;
            case 2: sLang = GetNameOfLanguage(25); LanguageCompletion(oPC, sLang); break;
            case 3: sLang = GetNameOfLanguage(26); LanguageCompletion(oPC, sLang); break;
            case 4: sLang = GetNameOfLanguage(27); LanguageCompletion(oPC, sLang); break;
            case 5: sLang = GetNameOfLanguage(28); LanguageCompletion(oPC, sLang); break;
            case 6: sLang = GetNameOfLanguage(29); LanguageCompletion(oPC, sLang); break;
            case 7: sLang = GetNameOfLanguage(30); LanguageCompletion(oPC, sLang); break;
            case 8: sLang = GetNameOfLanguage(31); LanguageCompletion(oPC, sLang); break;
            case 9: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 9); break;
            case 10: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 5, ""); break;
            case 11: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 1, ""); break;
            case 12: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); break;
        }
        break;
        case 63:
        switch(nSelectedNode)
        {
            case 0: sLang = GetNameOfLanguage(33); LanguageCompletion(oPC, sLang); break;
            case 1: sLang = GetNameOfLanguage(34); LanguageCompletion(oPC, sLang); break;
            case 2: sLang = GetNameOfLanguage(35); LanguageCompletion(oPC, sLang); break;
            case 3: sLang = GetNameOfLanguage(38); LanguageCompletion(oPC, sLang); break;
            case 4: sLang = GetNameOfLanguage(39); LanguageCompletion(oPC, sLang); break;
            case 5: sLang = GetNameOfLanguage(42); LanguageCompletion(oPC, sLang); break;
            case 6: sLang = GetNameOfLanguage(43); LanguageCompletion(oPC, sLang); break;
            case 7: sLang = GetNameOfLanguage(45); LanguageCompletion(oPC, sLang); break;
            case 8: sLang = GetNameOfLanguage(47); LanguageCompletion(oPC, sLang); break;
            case 9: sLang = GetNameOfLanguage(48); LanguageCompletion(oPC, sLang); break;
            case 10: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 9); break;
            case 11: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 5, ""); break;
            case 12: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 1, ""); break;
            case 13: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); break;
        }
        break;
        case 70:
        switch(nSelectedNode)
        {
            case 0: sLang = GetNameOfLanguage(5); LanguageCompletion(oPC, sLang); break;
            case 1: sLang = GetNameOfLanguage(14); LanguageCompletion(oPC, sLang); break;
            case 2: sLang = GetNameOfLanguage(71); LanguageCompletion(oPC, sLang); break;
            case 3: sLang = GetNameOfLanguage(80); LanguageCompletion(oPC, sLang); break;
            case 4: sLang = GetNameOfLanguage(77); LanguageCompletion(oPC, sLang); break;
            case 5: sLang = GetNameOfLanguage(44); LanguageCompletion(oPC, sLang); break;
            case 6: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 9); break;
            case 7: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 5, ""); break;
            case 8: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); CommandRedirect(oPC, 1, ""); break;
            case 9: DeleteLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU"); break;
        }
        break;
        case 75:
        switch(nSelectedNode)
        {
            case 0: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "0"); CommandCompletionStart(oPC, 3); break;
            case 1: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "20"); CommandCompletionStart(oPC, 3); break;
            case 2: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "23"); CommandCompletionStart(oPC, 3); break;
            case 3: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "1"); CommandCompletionStart(oPC, 3); break;
            case 4: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "25"); CommandCompletionStart(oPC, 3); break;
            case 5: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "22"); CommandCompletionStart(oPC, 3); break;
            case 6: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "26"); CommandCompletionStart(oPC, 3); break;
            case 7: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "2"); CommandCompletionStart(oPC, 3); break;
            case 8: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "3"); CommandCompletionStart(oPC, 3); break;
            case 9: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "4"); CommandCompletionStart(oPC, 3); break;
            case 10: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "5"); CommandCompletionStart(oPC, 3); break;
            case 11: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "24"); CommandCompletionStart(oPC, 3); break;
            case 12: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "6"); CommandCompletionStart(oPC, 3); break;
            case 13: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "7"); CommandCompletionStart(oPC, 3); break;
            case 14: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "8"); CommandCompletionStart(oPC, 3); break;
            case 15: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "9"); CommandCompletionStart(oPC, 3); break;
            case 16: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "10"); CommandCompletionStart(oPC, 3); break;
            case 17: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "11"); CommandCompletionStart(oPC, 3); break;
            case 18: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "12"); CommandCompletionStart(oPC, 3); break;
            case 19: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "13"); CommandCompletionStart(oPC, 3); break;
            case 20: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "14"); CommandCompletionStart(oPC, 3); break;
            case 21: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "15"); CommandCompletionStart(oPC, 3); break;
            case 22: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "16"); CommandCompletionStart(oPC, 3); break;
            case 23: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "17"); CommandCompletionStart(oPC, 3); break;
            case 24: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "18"); CommandCompletionStart(oPC, 3); break;
            case 25: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "21"); CommandCompletionStart(oPC, 3); break;
            case 26: SetLocalString(oPC, "FKY_CHAT_COMMAND_COM_MENU", "19"); CommandCompletionStart(oPC, 3); break;
            case 27: CommandRedirect(oPC, 3, ""); break;
            case 28: CommandRedirect(oPC, 1, ""); break;
        }
        break;
        case 80:
        nSwitch = nAbsolute/20;
        nSwitch2 = nAbsolute-(20*nSwitch);
        switch(nSwitch)
        {
            case 0://0-19
            switch(nSwitch2)
            {
                case 0: break; //NEVERMIND main
                case 1: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //BIOLOGICAL menu
                case 2: break; //nevermind biologic
                case 3: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return noises
                case 4: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //altered state menu
                case 5: break; //nevermind altered mentation
                case 6: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return altered mentation
                case 7: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "woozy")); break;
                case 8: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "sway")); break;
                case 9: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "drunk")); break;
                case 10: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //sick menu
                case 11: break; //nevermind sick
                case 12: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return sick
                case 13: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "vomit")); break;
                case 14: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "spasm")); break;
                case 15: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "puke")); break;
                case 16: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "die")); break;
                case 17: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "dead")); break;
                case 18: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //noises menu
                case 19: break; //nevermind noises
            }
            break;
            case 1://20-39
            switch(nSwitch2)
            {
                case 0: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return noises
                case 1: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "sneeze")); break;
                case 2: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "hiccup")); break;
                case 3: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "cough")); break;
                case 4: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "burp")); break;
                case 5: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "belch")); break;
                case 6: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //oral menu
                case 7: break; //nevermind oral
                case 8: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return oral
                case 9: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "smoke")); break;
                case 10: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "sip")); break;
                case 11: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "drunk")); break;
                case 12: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "drink")); break;
                case 13: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //NOISES menu
                case 14: break; //nevermind noises
                case 15: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return noises
                case 16: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //animal menu
                case 17: break; //nevermind animal
                case 18: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return animal
                case 19: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "snarl")); break;
            }
            break;
            case 2://40-59
            switch(nSwitch2)
            {
                case 0: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "roar")); break;
                case 1: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "moo")); break;
                case 2: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "meow")); break;
                case 3: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "howl")); break;
                case 4: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "hoot")); break;
                case 5: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "bark")); break;
                case 6: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //loud menu
                case 7: break; //nevermind loud
                case 8: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return loud
                case 9: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "scream")); break;
                case 10: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "screech")); break;
                case 11: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //sad menu
                case 12: break; //nevermind sad
                case 13: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return sad
                case 14: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "weep")); break;
                case 15: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "wail")); break;
                case 16: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "sob")); break;
                case 17: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "cry")); break;
                case 18: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //happy menu
                case 19: break; //nevermind happy
            }
            break;
            case 3://60-79
            switch(nSwitch2)
            {
                case 0: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return happy
                case 1: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "laugh")); break;
                case 2: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "guffaw")); break;
                case 3: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "giggle")); break;
                case 4: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "chuckle")); break;
                case 5: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "chortle")); break;
                case 6: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //musical menu
                case 7: break; //nevermind musical
                case 8: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return musical
                case 9: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "whistle")); break;
                case 10: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "sing")); break;
                case 11: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "hum")); break;
                case 12: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //pain menu
                case 13: break; //nevermind pain
                case 14: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return pain
                case 15: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "ouch")); break;
                case 16: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "moan")); break;
                case 17: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "groan")); break;
                case 18: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; break;//MOVEMENT menu
                case 19: break; //nevermind movement
            }
            break;
            case 4://80-99
            switch(nSwitch2)
            {
                case 0: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return movement
                case 1: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //waiting menu
                case 2: break; //nevermind waiting
                case 3: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return waiting
                case 4: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "stretch")); break;
                case 5: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "scratch")); break;
                case 6: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "fidget")); break;
                case 7: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "fiddle")); break;
                case 8: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "bored")); break;
                case 9: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //visual menu
                case 10: break; //nevermind visual
                case 11: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return visual
                case 12: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "scan")); break;
                case 13: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "read")); break;
                case 14: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "peer")); break;
                case 15: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "look")); break;
                case 16: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //sleep menu
                case 17: break; //nevermind sleep
                case 18: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return sleep
                case 19: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "yawn")); break;
            }
            break;
            case 5://100-119
            switch(nSwitch2)
            {
                case 0: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "stretch")); break;
                case 1: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "snore")); break;
                case 2: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "sleep")); break;
                case 3: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "nap")); break;
                case 4: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //tired menu
                case 5: break; //nevermind tired
                case 6: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return tired
                case 7: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "tired")); break;
                case 8: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "stretch")); break;
                case 9: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "stoop")); break;
                case 10: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "sit")); break;
                case 11: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "scratch")); break;
                case 12: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "rest")); break;
                case 13: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //fatigue menu
                case 14: break; //nevermind fatigue
                case 15: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return fatigue
                case 16: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "stoop")); break;
                case 17: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "prone")); break;
                case 18: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "lie")); break;
                case 19: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "flop")); break;
            }
            break;
            case 6://120-139
            switch(nSwitch2)
            {
                case 0: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "fall")); break;
                case 1: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "fatigue")); break;
                case 2: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "exhausted")); break;
                case 3: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "collapse")); break;
                case 4: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //happy menu
                case 5: break; //nevermind happy
                case 6: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return happy
                case 7: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "toast")); break;
                case 8: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "hooray")); break;
                case 9: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "dance")); break;
                case 10: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "cheer")); break;
                case 11: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "celebrate")); break;
                case 12: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //arcane/religious menu
                case 13: break; //nevermind arcane/religious
                case 14: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return arcane/religious
                case 15: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "worship")); break;
                case 16: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "pray")); break;
                case 17: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "meditate")); break;
                case 18: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "kneel")); break;
                case 19: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "chant")); break;
            }
            break;
            case 7://140-159
            switch(nSwitch2)
            {
                case 0: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "cast")); break;
                case 1: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "cantrip")); break;
                case 2: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //combat menu
                case 3: break; //nevermind combat
                case 4: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return combat
                case 5: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "trip")); break;
                case 6: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "swipe")); break;
                case 7: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "steal")); break;
                case 8: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "shift")); break;
                case 9: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "duck")); break;
                case 10: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "dodge")); break;
                case 11: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "choke")); break;
                case 12: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //SOCIAL menu
                case 13: break; //nevermind social
                case 14: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return social
                case 15: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //needy menu
                case 16: break; //nevermind needy
                case 17: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return needy
                case 18: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "steal")); break;
                case 19: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "plead")); break;
            }
            break;
            case 8://160-179
            switch(nSwitch2)
            {
                case 0: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "demand")); break;
                case 1: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "beg")); break;
                case 2: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //no menu
                case 3: break; //nevermind no
                case 4: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return no
                case 5: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "nope")); break;
                case 6: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "no")); break;
                case 7: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //yes menu
                case 8: break; //nevermind yes
                case 9: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return yes
                case 10: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "nod")); break;
                case 11: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "cheer")); break;
                case 12: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "agree")); break;
                case 13: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //hostile menu
                case 14: break; //nevermind hostile
                case 15: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return hostile
                case 16: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "threaten")); break;
                case 17: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "taunt")); break;
                case 18: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "spit")); break;
                case 19: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "mock")); break;
            }
            break;
            case 9://180-199
            switch(nSwitch2)
            {
                case 0: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //talk menu
                case 1: break; //nevermind talk
                case 2: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return talk
                case 3: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "talk")); break;
                case 4: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "chat")); break;
                case 5: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //leaving menu
                case 6: break; //nevermind leaving
                case 7: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return leaving
                case 8: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "wave")); break;
                case 9: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "salute")); break;
                case 10: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "goodnight")); break;
                case 11: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "goodbye")); break;
                case 12: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "curtsy")); break;
                case 13: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "bye")); break;
                case 14: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "bow")); break;
                case 15: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "bend")); break;
                case 16: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //greetings menu
                case 17: break; //nevermind greetings
                case 18: SetLocalInt(oPC, "FKY_CHAT_CONVONUMBER", 80); break; //return greetings
                case 19: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "wave")); break;
            }
            break;
            case 10://200-219
            switch(nSwitch2)
            {
                case 0: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "salute")); break;
                case 1: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "hello")); break;
                case 2: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "greet")); break;
                case 3: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "curtsy")); break;
                case 4: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "bow")); break;
                case 5: AssignCommand(oPC, SpeakString(EMOTE_SYMBOL + "bend")); break;
            }
            break;
        }
        break;
    }
}
