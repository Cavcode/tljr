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

#include "aps_include"
#include "fky_chat_const"
#include "fky_chat_config"
#include "fky_chat_misc"
#include "fky_chat_dmfi"
#include "fky_chat_fr_lang"
#include "fky_chat_vfx"
#include "fky_chat_newlang"

const string sSpeech_SpeechList = "SpeechList_";
const string sSpeech_PlayerID = "SpeechPlayerID_";

//Shunts the player to the appropriate conversation, sending the message specified in sColor.
//1 = main command
//2 = character
//3 = dice
//4 = items
//5 = language commands
//6 = listing commands
//7 = metachannels
//8 = social
//9 = languages
//11 = main dm command
//12 = dm player management
//13 = dm player management ability and appearance
//14 = dm player management alignment
//15 = dm player management avatar powers
//16 = dm player management banning
//17 = dm player management items
//18 = dm player management teleportation
//19 = dm player management experience
//20 = dm server management
//21 = dm server management time and weather
//22 = dm server management variables
//23 = dm creature management
//24 = dm creature management factions
//25 = dm visual effects
//26 = dm chat commands
//27 = dm chat commands ignore
//43 = dm visual effects duration type
//44 = dm visual effects subtype
void CommandRedirect(object oSpeaker, int nMenu, string sMessage = BADCOMMAND, string sColor = COLOR_RED);

//Applys a cutscene invisible and cutscene ghost effect to the target.
void DoDMInvis(object oPlayer);

void SendChatLogMessage(object oRecipient, string sMessage, object oSender = OBJECT_INVALID, int nChannel = 4)
{
    if (!GetIsObjectValid(oSender)) return;
    if (FindSubString(sMessage, "¬")!=-1) return;
    if (nChannel == 4 && !GetIsObjectValid(oRecipient)) return;
    SetLocalString(oSender, "NWNX!CHAT!SPEAK", ObjectToString(oSender)+"¬"+ObjectToString(oRecipient)+"¬"+IntToString(nChannel)+"¬"+sMessage);
}

void InitSpeech()
{
    int nCount;
    object oMod = GetModule();
    // Allocate Memory
    string sMemory;
    for( nCount = 0; nCount < 8; nCount++ ) // Reserve 8*128 bytes
        sMemory += "................................................................................................................................";
    SetLocalString(oMod, "NWNX!CHAT!SPACER", sMemory);
    if (PROCESS_NPC_SPEECH) SetLocalString(oMod, "NWNX!CHAT!LOGNPC", "1");
    if (PROCESS_NPC_SPEECH && IGNORE_SILENT_CHANNELS) SetLocalString(oMod,"NWNX!CHAT!IGNORESILENT","1");
    if (SEND_CHANNELS_TO_CHAT_LOG)
    {
        location lSpawn = GetStartingLocation();
        object oMessenger = CreateObject(OBJECT_TYPE_CREATURE, "fky_chat_sender", lSpawn);
        SetLocalObject(oMod, "FKY_CHT_MESSENGER", oMessenger);
        DoDMInvis(oMessenger);
    }
    SetCustomToken(1701, COLOR_END);
    SetCustomToken(1702, COLOR_GREEN);
    SetCustomToken(1703, COLOR_RED);
    SetCustomToken(1704, COLOR_RED2);
    SetCustomToken(1705, COLOR_WHITE);
    SetCustomToken(1706, COLOR_BLUE);
    SetCustomToken(1707, COLOR_PURPLE);
    SetCustomToken(1708, COLOR_LT_PURPLE);
    SetCustomToken(1709, COLOR_LT_GREEN);
    SetCustomToken(1710, COLOR_ORANGE);
    SetCustomToken(1711, COLOR_GOLD);
    SetCustomToken(1712, COLOR_YELLOW);
    SetCustomToken(1713, COLOR_LT_BLUE);
    SetCustomToken(1714, COLOR_LT_BLUE2);
    SetCustomToken(1715, EMOTE_SYMBOL);
    SetCustomToken(1716, COMMAND_SYMBOL);
}

string Speech_GetSpacer()
{
    return GetLocalString(GetModule(), "NWNX!CHAT!SPACER");
}

void Speech_OnClientEnter(object oPlayer)
{
  if( !GetIsObjectValid(oPlayer) ) return;

  object oMod = GetModule();
  SetLocalString(oPlayer, "NWNX!CHAT!GETID", ObjectToString(oPlayer) + "        ");
  string sID = GetLocalString(oPlayer, "NWNX!CHAT!GETID");
  int nID = StringToInt(sID);
  if( nID != -1)
  {
    SetLocalObject(oMod, sSpeech_SpeechList + sID, oPlayer);
    SetLocalInt(oPlayer, sSpeech_PlayerID, nID);
  }
  DeleteLocalString(oPlayer, "NWNX!CHAT!GETID");
}

void Speech_OnClientExit(object oPlayer)
{
  if( !GetIsObjectValid(oPlayer) ) return;

  int nID = GetLocalInt(oPlayer, sSpeech_PlayerID);
  DeleteLocalInt(oPlayer, sSpeech_PlayerID);
  DeleteLocalObject(GetModule(), sSpeech_SpeechList + IntToString(nID));
}

object Speech_GetPlayer(int nID)
{
  return GetLocalObject(GetModule(), sSpeech_SpeechList + IntToString(nID));
}

string Speech_GetChannel(int nChannel)
{
    string sChannel;

    switch(nChannel)
    {
        case 1: sChannel = TALK; break;
        case 2: sChannel = SHOUT; break;
        case 3: sChannel = WHISPER; break;
        case 4: sChannel = TELL; break;
        case 5: sChannel = SERVER; break;
        case 6: sChannel = PARTY; break;
        case 14: sChannel = DM; break;
        case 17: sChannel = TALK; break;
        case 18: sChannel = SHOUT; break;
        case 19: sChannel = WHISPER; break;
        case 20: sChannel = TELL; break;
        case 21: sChannel = SERVER; break;
        case 22: sChannel = PARTY; break;
        case 30: sChannel = DM; break;
        default: sChannel = UNKNOWN; break;
    }
    return sChannel;
}

object GetMessenger()
{
    return GetLocalObject(GetModule(), "FKY_CHT_MESSENGER");
}

void DoLogging(object oSender, string sTarget, int nChan, string sLogText)
{
    string sLogMessage = GetName(oSender) + "(" + GetPCPlayerName(oSender) + ")" + sTarget + "[" + Speech_GetChannel(nChan) + "] " + sLogText + "\n";
    SetLocalString(oSender, "NWNX!CHAT!LOG", sLogMessage);
}

void DoCleanup(object oSender)
{
    DeleteLocalString(oSender, "NWNX!CHAT!TEXT");
    DeleteLocalString(oSender, "NWNX!CHAT!SUPRESS");
    DeleteLocalString(oSender, "NWNX!CHAT!LOG");
}

string GetSkillName(int nSkill)
{
string sSkill;
switch (nSkill)
    {
    case 0: sSkill = SKILL0; break;
    case 1: sSkill = SKILL1; break;
    case 2: sSkill = SKILL2; break;
    case 3: sSkill = SKILL3; break;
    case 4: sSkill = SKILL4; break;
    case 5: sSkill = SKILL5; break;
    case 6: sSkill = SKILL6; break;
    case 7: sSkill = SKILL7; break;
    case 8: sSkill = SKILL8; break;
    case 9: sSkill = SKILL9; break;
    case 10: sSkill = SKILL10; break;
    case 11: sSkill = SKILL11; break;
    case 12: sSkill = SKILL12; break;
    case 13: sSkill = SKILL13; break;
    case 14: sSkill = SKILL14; break;
    case 15: sSkill = SKILL15; break;
    case 16: sSkill = SKILL16; break;
    case 17: sSkill = SKILL17; break;
    case 18: sSkill = SKILL18; break;
    case 19: sSkill = SKILL19; break;
    case 20: sSkill = SKILL20; break;
    case 21: sSkill = SKILL21; break;
    case 22: sSkill = SKILL22; break;
    case 23: sSkill = SKILL23; break;
    case 24: sSkill = SKILL24; break;
    case 25: sSkill = SKILL25; break;
    case 26: sSkill = SKILL26; break;
    default: sSkill = ""; break;
    }
return sSkill;
}

string GetClassName(int nClass)
{
string sClass;
switch (nClass)
    {
    case 0: sClass = CLASS0; break;
    case 1: sClass = CLASS1; break;
    case 2: sClass = CLASS2; break;
    case 3: sClass = CLASS3; break;
    case 4: sClass = CLASS4; break;
    case 5: sClass = CLASS5; break;
    case 6: sClass = CLASS6; break;
    case 7: sClass = CLASS7; break;
    case 8: sClass = CLASS8; break;
    case 9: sClass = CLASS9; break;
    case 10: sClass = CLASS10; break;
    case 27: sClass = CLASS27; break;
    case 28: sClass = CLASS28; break;
    case 29: sClass = CLASS29; break;
    case 30: sClass = CLASS30; break;
    case 31: sClass = CLASS31; break;
    case 32: sClass = CLASS32; break;
    case 33: sClass = CLASS33; break;
    case 34: sClass = CLASS34; break;
    case 35: sClass = CLASS35; break;
    case 36: sClass = CLASS36; break;
    case 37: sClass = CLASS37; break;
    default: sClass = ""; break;
    }
return sClass;
}

int ModifiedGetIsSkillSuccessful(object oPC, int nSkill, int nDC)
{
    int nReturn;
    int nRank = GetSkillRank(nSkill, oPC);
    int nRoll = d20();
    if (SILENT_LORE_CHECKS)
    {
        if ((nRank + nRoll) < nDC) return FALSE;
        else return TRUE;
    }
    else
    {
        string sSign;
        if (nRank >= 0) sSign = "+";
        else sSign = "-";
        string sSuccess;
        if ((nRank + 20)< nDC)
        {
            sSuccess = IMPOSSIBLE;
            nReturn = FALSE;
        }
        else if ((nRank + nRoll) < nDC)
        {
            sSuccess = FAILED;
            nReturn = FALSE;
        }
        else
        {
            sSuccess = SUCCESS;
            nReturn = TRUE;
        }
        FloatingTextStringOnCreature(COLOR_PURPLE+GetName(oPC)+COLOR_END+" : "+GetSkillName(nSkill)+" : "+sSuccess+" : ("+IntToString(nRoll)+sSign+IntToString(abs(nRank))+" = "+IntToString(nRoll+nRank)+VERSUS+IntToString(nDC)+")", oPC, FALSE);
        return nReturn;
    }
}

void DoSkillCheck(object oPC, int nSkill, int nDC)
{
    int nRank = GetSkillRank(nSkill, oPC);
    int nRoll = d20();
    string sSign;
    if (nRank >= 0) sSign = "+";
    else sSign = "-";
    string sSuccess;
    if ((nRank + 20) < nDC) sSuccess = COLOR_RED+IMPOSSIBLE+COLOR_END;
    else if ((nRank + nRoll) < nDC) sSuccess = COLOR_RED+FAILED+COLOR_END;
    else sSuccess = COLOR_GREEN+SUCCESS+COLOR_END;
    AssignCommand(oPC, SpeakString(ESCAPE_STRING+COLOR_PURPLE+GetName(oPC)+COLOR_END+" : "+GetSkillName(nSkill)+" : "+sSuccess+" : ("+IntToString(nRoll)+sSign+IntToString(abs(nRank))+" = "+IntToString(nRoll+nRank)+VERSUS+IntToString(nDC)+")"));
}

void ListEmotes(object oPlayer)
{   string sMessage;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"agree "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"ag"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"bark "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"bk"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"beg "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"bg"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"belch "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"bh"+COLOR_END+COLOR_WHITE+") (male only)"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"bend "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"bn"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"bored "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"bo"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"bow "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"bw"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"burp "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"bp"+COLOR_END+COLOR_WHITE+") (male only)"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"bye "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"cantrip "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"ca"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"cast "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"cs"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"celebrate "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"cl"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"chat "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"ct"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"chant "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"cn"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"cheer "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"ch"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"choke "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"chortle "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"cr"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"chuckle "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"ck"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"collapse "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"co"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"cough "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"cg"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"cry "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"curtsy "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"cy"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"dance "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"da"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"dead "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"dd"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"demand "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"dm"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"die "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"di"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"dodge "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"dg"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"drink "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"dr"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"drunk "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"dn"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"duck "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"dk"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"exhausted "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"ex"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"fall "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"fl"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"fatigue "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"fa"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"fiddle "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"fi"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"fidget "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"fg"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"flop "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"fp"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"giggle "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"gi"+COLOR_END+COLOR_WHITE+") (female only)"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"goodbye "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"gb"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"goodnight "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"gt"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"greet "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"gr"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"groan "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"gn"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"guffaw "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"gw"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"hello "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"hl"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"hiccup "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"hp"+COLOR_END+COLOR_WHITE+") (male only)"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"hooray "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"hy"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"hoot "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"ht"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"howl "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"hw"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"hum "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"hm"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"kneel "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"kn"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"laugh "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"la"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"lie "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"look "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"lk"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"meditate "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"md"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"meow "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"mw"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"moan "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"mn"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"mock "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"mk"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"moo "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"mo"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"nap "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"np"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"no "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"nod "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"nd"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"nope "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"ouch "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"ow"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"peer "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"pe"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"plead "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"pl"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"pray "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"pr"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"prone "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"pn"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"puke "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"pu"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"read "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"re"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"rest "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"rt"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"roar "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"rr"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"salute "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"sa"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"scan "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"sn"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"scratch "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"sc"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"scream "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"sm"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"screech "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"shift "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"sh"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"sing "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"sg"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"sip "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"sit "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"si"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"sleep "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"sl"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"smoke "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"sk"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"snarl "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"sneeze "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"sz"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"snore "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"sob "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"sb"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"spasm "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"sp"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"spit "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"steal "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"st"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"stoop "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"so"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"stretch "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"sr"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"sway "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"sy"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"swipe "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"sw"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"talk "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"tl"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"taunt "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"ta"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"threaten "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"th"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"tired "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"ti"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"toast "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"tt"+COLOR_END+COLOR_WHITE+") (male only)"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"trip "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"tp"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"vomit "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"vm"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"wail "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"wl"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"wave "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"wa"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"weep "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"wp"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"whistle "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"wh"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"woozy "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"wz"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"worship "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"wo"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+EMOTE_SYMBOL+"yawn "+COLOR_END+COLOR_WHITE+"("+COLOR_END+COLOR_PURPLE+EMOTE_SYMBOL+"yw"+COLOR_END+COLOR_WHITE+")"+COLOR_END+NEWLINE;
    SendMessageToPC(oPlayer, sMessage);
}

void ListCommands(object oPlayer)
{
    string sMessage;
    sMessage = COLOR_PURPLE+COMMAND1+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+COMMAND2+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "d4 "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "d6 "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "d8 "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "d10 "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "d12 "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "d20 "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "d100 "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "partyroll "+COLOR_END+NEWLINE;
    if (VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer)) sMessage += COLOR_GREEN + COMMAND_SYMBOL + "playerinfo "+COLOR_END+NEWLINE;
    else sMessage += COLOR_GREEN + COMMAND_SYMBOL + "playerinfo "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "anon "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "unanon "+COLOR_END+NEWLINE;
    if (ENABLE_WEAPON_VISUALS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "wpac "+COLOR_END+NEWLINE;
    if (ENABLE_WEAPON_VISUALS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "wpco "+COLOR_END+NEWLINE;
    if (ENABLE_WEAPON_VISUALS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "wpel "+COLOR_END+NEWLINE;
    if (ENABLE_WEAPON_VISUALS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "wpev "+COLOR_END+NEWLINE;
    if (ENABLE_WEAPON_VISUALS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "wpfi "+COLOR_END+NEWLINE;
    if (ENABLE_WEAPON_VISUALS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "wpho "+COLOR_END+NEWLINE;
    if (ENABLE_WEAPON_VISUALS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "wpnone "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "help "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "list emotes "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "list commands "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "list ignored "+COLOR_END+NEWLINE;
    if (ENABLE_LANGUAGES) sMessage += COLOR_PURPLE + "/l "+COLOR_END+NEWLINE;
    if (ENABLE_LANGUAGES) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "speak "+COLOR_END+NEWLINE;
    if (ENABLE_LANGUAGES) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "list languages "+COLOR_END+NEWLINE;
    if (ENABLE_LANGUAGES && (ENABLE_FULL_LANGUAGE_LIST_FOR_PLAYERS || VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer))) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "list alllanguages "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "lfg "+COLOR_END+NEWLINE;
    if (ENABLE_METACHANNELS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "metaaccept "+COLOR_END+NEWLINE;
    if (ENABLE_METACHANNELS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "metadecline "+COLOR_END+NEWLINE;
    if (ENABLE_METACHANNELS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "metadisband "+COLOR_END+NEWLINE;
    if (ENABLE_METACHANNELS) sMessage += COLOR_GREEN + COMMAND_SYMBOL + "metainvite "+COLOR_END+NEWLINE;
    if (ENABLE_METACHANNELS) sMessage += COLOR_GREEN + COMMAND_SYMBOL + "metakick "+COLOR_END+NEWLINE;
    if (ENABLE_METACHANNELS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "metaleave "+COLOR_END+NEWLINE;
    if (ENABLE_METACHANNELS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "metalist "+COLOR_END+NEWLINE;
    if (ENABLE_METACHANNELS) sMessage += COLOR_PURPLE + "/m "+COLOR_END+NEWLINE;
    if (ENABLE_PLAYER_SETNAME || VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer)) sMessage += COLOR_GREEN + COMMAND_SYMBOL + "setname "+COLOR_END+NEWLINE;
    if (ENABLE_PLAYER_SETNAME || VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer)) sMessage += COLOR_GREEN + COMMAND_SYMBOL + "setnameall "+COLOR_END+NEWLINE;
    if (ENABLE_PLAYER_SETTAILWINGS || VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer)) sMessage += COLOR_GREEN + COMMAND_SYMBOL + "settail "+COLOR_END+NEWLINE;
    if (ENABLE_PLAYER_SETTAILWINGS || VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer)) sMessage += COLOR_GREEN + COMMAND_SYMBOL + "setwings "+COLOR_END+NEWLINE;
    if (PLAYERS_CAN_DELETE || (VerifyDMKey(oPlayer) && DMS_CAN_DELETE) || VerifyAdminKey(oPlayer)) sMessage += COLOR_GREEN + COMMAND_SYMBOL + "delete "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "skillcheck "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "skillslist "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN + COMMAND_SYMBOL + "ignore "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN + COMMAND_SYMBOL + "unignore "+COLOR_END+NEWLINE;
    SendMessageToPC(oPlayer, sMessage);
}

void ListHelp(object oPlayer)
{
    string sMessage;
    sMessage = COLOR_PURPLE+COMMAND1+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+COMMAND2+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "d4 "+COLOR_END+COLOR_WHITE+COMMAND2_1+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "d6 "+COLOR_END+COLOR_WHITE+COMMAND3+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "d8 "+COLOR_END+COLOR_WHITE+COMMAND4+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "d10 "+COLOR_END+COLOR_WHITE+COMMAND4_1+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "d12 "+COLOR_END+COLOR_WHITE+COMMAND5+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "d20 "+COLOR_END+COLOR_WHITE+COMMAND6+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "d100 "+COLOR_END+COLOR_WHITE+COMMAND7+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "partyroll "+COLOR_END+COLOR_WHITE+COMMAND8+COLOR_END+NEWLINE;
    if (VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer)) sMessage += COLOR_GREEN + COMMAND_SYMBOL + "playerinfo "+COLOR_END+COLOR_WHITE+COMMAND9+COLOR_END+NEWLINE;
    else sMessage += COLOR_GREEN + COMMAND_SYMBOL + "playerinfo "+COLOR_END+COLOR_WHITE+COMMAND10+COLOR_END+COLOR_LT_PURPLE+COMMAND_SYMBOL+"anon "+COLOR_END+COLOR_WHITE+COMMAND10b+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "anon "+COLOR_END+COLOR_WHITE+COMMAND10_1+COLOR_END+COLOR_LT_GREEN+COMMAND_SYMBOL+"playerinfo "+COLOR_END+COLOR_WHITE+COMMAND10b+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "unanon "+COLOR_END+COLOR_WHITE+COMMAND10_2+COLOR_END+NEWLINE;
    if (ENABLE_WEAPON_VISUALS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "wpac "+COLOR_END+COLOR_WHITE+COMMAND11+COLOR_END+NEWLINE;
    if (ENABLE_WEAPON_VISUALS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "wpco "+COLOR_END+COLOR_WHITE+COMMAND12+COLOR_END+NEWLINE;
    if (ENABLE_WEAPON_VISUALS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "wpel "+COLOR_END+COLOR_WHITE+COMMAND13+COLOR_END+NEWLINE;
    if (ENABLE_WEAPON_VISUALS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "wpev "+COLOR_END+COLOR_WHITE+COMMAND14+COLOR_END+NEWLINE;
    if (ENABLE_WEAPON_VISUALS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "wpfi "+COLOR_END+COLOR_WHITE+COMMAND15+COLOR_END+NEWLINE;
    if (ENABLE_WEAPON_VISUALS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "wpho "+COLOR_END+COLOR_WHITE+COMMAND16+COLOR_END+NEWLINE;
    if (ENABLE_WEAPON_VISUALS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "wpnone "+COLOR_END+COLOR_WHITE+COMMAND50+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "help "+COLOR_END+COLOR_WHITE+COMMAND40+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "list emotes "+COLOR_END+COLOR_WHITE+COMMAND17+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "list commands "+COLOR_END+COLOR_WHITE+COMMAND18+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "list ignored "+COLOR_END+COLOR_WHITE+COMMAND19+COLOR_END+NEWLINE;
    if (ENABLE_LANGUAGES) sMessage += COLOR_PURPLE + "/l "+COLOR_END+COLOR_WHITE+COMMAND41+COLOR_LT_PURPLE+"/l"+COMMAND42+COLOR_END+COLOR_WHITE+COMMAND43+COLOR_LT_PURPLE+COMMAND_SYMBOL+"list languages"+COLOR_END+COLOR_WHITE+COMMAND44+NEWLINE;
    if (ENABLE_LANGUAGES) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "speak "+COLOR_END+COLOR_WHITE+COMMAND45+COLOR_LT_PURPLE+COMMAND_SYMBOL+"speak"+COLOR_END+COLOR_WHITE+COMMAND46+COLOR_LT_PURPLE+COMMAND_SYMBOL+"speak common"+COLOR_END+COLOR_WHITE+COMMAND47+COLOR_LT_PURPLE+COMMAND_SYMBOL+"list languages"+COLOR_END+COLOR_WHITE+COMMAND48+NEWLINE;
    if (ENABLE_LANGUAGES) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "list languages "+COLOR_END+COLOR_WHITE+COMMAND20+COLOR_LT_PURPLE+"/l"+COLOR_END+COLOR_WHITE+COMMAND20b+COLOR_LT_PURPLE+COMMAND_SYMBOL+"speak"+COLOR_END+COLOR_WHITE+COMMAND20c+COLOR_END+NEWLINE;
    if (ENABLE_LANGUAGES && (ENABLE_FULL_LANGUAGE_LIST_FOR_PLAYERS || VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer))) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "list alllanguages "+COLOR_END+COLOR_WHITE+COMMAND21+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "lfg "+COLOR_END+COLOR_WHITE+COMMAND22+COLOR_END+NEWLINE;
    if (ENABLE_METACHANNELS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "metaaccept "+COLOR_END+COLOR_WHITE+COMMAND23+COLOR_END+NEWLINE;
    if (ENABLE_METACHANNELS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "metadecline "+COLOR_END+COLOR_WHITE+COMMAND24+COLOR_END+NEWLINE;
    if (ENABLE_METACHANNELS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "metadisband "+COLOR_END+COLOR_WHITE+COMMAND25+COLOR_END+NEWLINE;
    if (ENABLE_METACHANNELS) sMessage += COLOR_GREEN + COMMAND_SYMBOL + "metainvite "+COLOR_END+COLOR_WHITE+COMMAND26+COLOR_END+NEWLINE;
    if (ENABLE_METACHANNELS) sMessage += COLOR_GREEN + COMMAND_SYMBOL + "metakick "+COLOR_END+COLOR_WHITE+COMMAND27+COLOR_END+NEWLINE;
    if (ENABLE_METACHANNELS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "metaleave "+COLOR_END+COLOR_WHITE+COMMAND28+COLOR_END+NEWLINE;
    if (ENABLE_METACHANNELS) sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "metalist "+COLOR_END+COLOR_WHITE+COMMAND29+COLOR_END+NEWLINE;
    if (ENABLE_METACHANNELS) sMessage += COLOR_PURPLE + "/m "+COLOR_END+COLOR_WHITE+COMMAND30+COLOR_END+NEWLINE;
    if (ENABLE_PLAYER_SETNAME || VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer)) sMessage += COLOR_GREEN + COMMAND_SYMBOL + "setname "+COLOR_END+COLOR_WHITE+COMMAND31+COLOR_LT_GREEN+COMMAND_SYMBOL+"setname ("+COMMAND31c+")"+COLOR_END+COLOR_WHITE+COMMAND31d+COLOR_LT_GREEN+COMMAND_SYMBOL+"setname "+COMMAND31f+COLOR_END+COLOR_WHITE+COMMAND31g+COLOR_END+NEWLINE;
    if (ENABLE_PLAYER_SETNAME || VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer)) sMessage += COLOR_GREEN + COMMAND_SYMBOL + "setnameall "+COLOR_END+COLOR_WHITE+COMMAND32a+COLOR_END+COLOR_LT_GREEN+COMMAND_SYMBOL+"setname"+COLOR_END+COLOR_WHITE+COMMAND32b+COLOR_END+NEWLINE;
    if (ENABLE_PLAYER_SETTAILWINGS || VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer)) sMessage += COLOR_GREEN + COMMAND_SYMBOL + "settail "+COLOR_END+COLOR_WHITE+COMMAND37+COLOR_END+COLOR_LT_GREEN + COMMAND_SYMBOL+"settail (tail number)"+COLOR_END+COLOR_WHITE+COMMAND38 + COLOR_END+NEWLINE;
    if (ENABLE_PLAYER_SETTAILWINGS || VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer)) sMessage += COLOR_GREEN + COMMAND_SYMBOL + "setwings "+COLOR_END+COLOR_WHITE+COMMAND39+COLOR_END+COLOR_LT_GREEN + COMMAND_SYMBOL+"setwing (wing number)"+COLOR_END+COLOR_WHITE+COMMAND38 + COLOR_END+NEWLINE;
    if (PLAYERS_CAN_DELETE || (VerifyDMKey(oPlayer) && DMS_CAN_DELETE) || VerifyAdminKey(oPlayer)) sMessage += COLOR_GREEN + COMMAND_SYMBOL + "delete "+COLOR_END+COLOR_WHITE+COMMAND49+COLOR_LT_GREEN + COMMAND_SYMBOL+"playerinfo"+COLOR_END+COLOR_WHITE+COMMAND48+ COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "skillcheck "+COLOR_END+COLOR_WHITE+COMMAND33+COLOR_LT_PURPLE+COMMAND_SYMBOL+"skillcheck "+COMMAND33b+COLOR_END+COLOR_WHITE+COMMAND33c+COLOR_LT_PURPLE+COMMAND_SYMBOL+"skillcheck 3 20"+COLOR_END+COLOR_WHITE+COMMAND33d+COLOR_LT_PURPLE+COMMAND_SYMBOL+"skillslist"+COLOR_END+COLOR_WHITE+COMMAND33e+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE + COMMAND_SYMBOL + "skillslist "+COLOR_END+COLOR_WHITE+COMMAND34+COLOR_LT_PURPLE+COMMAND_SYMBOL+"skillcheck"+COLOR_END+COLOR_WHITE+COMMAND34b+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN + COMMAND_SYMBOL + "ignore "+COLOR_END+COLOR_WHITE+COMMAND35+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN + COMMAND_SYMBOL + "unignore "+COLOR_END+COLOR_WHITE+COMMAND36+COLOR_END+NEWLINE;
    SendMessageToPC(oPlayer, sMessage);
}

void ListDMCommands(object oPlayer)
{
    string sMessage;
    sMessage = COLOR_PURPLE+DMCOMMAND1+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+COMMAND2+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_align_chaos "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_align_evil "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_align_good "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_align_law "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_bandm "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_banplayer_perm "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_banplayer_temp "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_banshout_temp "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_banshout_perm "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_boot "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_change_appear "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_change_appear base "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_create (resref) "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_a_allally "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_a_allfoe "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_a_peace "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_a_reset "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_c_allally "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_c_allfoe "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_c_peace "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_c_reset "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_m_allally "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_m_allfoe "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_m_peace "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_m_reset "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_p_allally "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_p_allfoe "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_p_peace "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_p_reset "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_freeze "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fx "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_fx_list_* "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fx_loc "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fx_rem "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_getbanlist "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_getbanreason "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_givexp "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_givelevel "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_takexp "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_takelevel "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_givepartyxp "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_givepartylevel "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_takepartyxp "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_takepartylevel "+COLOR_END+NEWLINE;
    if ((DM_PLAYERS_HEAR_DM && VerifyDMKey(oPlayer) && (!GetIsDM(oPlayer))) || (ADMIN_PLAYERS_HEAR_DM && VerifyAdminKey(oPlayer) && (!GetIsDM(oPlayer)))) sMessage += COLOR_PURPLE+"dm_ignoredm "+COLOR_END+NEWLINE;
    if ((DMS_HEAR_META && VerifyDMKey(oPlayer) && GetIsDM(oPlayer)) || (DM_PLAYERS_HEAR_META && VerifyDMKey(oPlayer) && (!GetIsDM(oPlayer))) || (ADMIN_DMS_HEAR_META && VerifyAdminKey(oPlayer) && GetIsDM(oPlayer)) || (ADMIN_PLAYERS_HEAR_META && VerifyAdminKey(oPlayer) && (!GetIsDM(oPlayer)))) sMessage += COLOR_PURPLE+"dm_ignoremeta "+COLOR_END+NEWLINE;
    if ((DMS_HEAR_TELLS && VerifyDMKey(oPlayer) && GetIsDM(oPlayer)) || (DM_PLAYERS_HEAR_TELLS && VerifyDMKey(oPlayer) && (!GetIsDM(oPlayer))) || (ADMIN_DMS_HEAR_TELLS && VerifyAdminKey(oPlayer) && GetIsDM(oPlayer)) || (ADMIN_PLAYERS_HEAR_TELLS && VerifyAdminKey(oPlayer) && (!GetIsDM(oPlayer)))) sMessage += COLOR_PURPLE+"dm_ignoretells "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_stealth "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_invis "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_invuln "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_item_id "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_item_destroy_all "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_item_destroy_equip "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_item_destroy_inv "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_help "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_kill "+COLOR_END+NEWLINE;
    if (ENABLE_LANGUAGES) sMessage += COLOR_GREEN+"dm_learn "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_listcommands "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_jump "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_porthere "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_porthell "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portjail "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portleader "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portthere "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_porttown "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portway "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portpartyhere "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portpartyhell "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portpartyjail "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portpartyleader "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portpartythere "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portpartytown "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portpartyway "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_rez "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_reset_mod "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_rest "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_reveal "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_hide "+COLOR_END+NEWLINE;
    if ((!LETO_FOR_ADMINS_ONLY) || VerifyAdminKey(oPlayer))
    {
        sMessage += COLOR_GREEN+"dm_setcha "+COLOR_END+NEWLINE;
        sMessage += COLOR_GREEN+"dm_setcon "+COLOR_END+NEWLINE;
        sMessage += COLOR_GREEN+"dm_setdex "+COLOR_END+NEWLINE;
        sMessage += COLOR_GREEN+"dm_setint "+COLOR_END+NEWLINE;
        sMessage += COLOR_GREEN+"dm_setstr "+COLOR_END+NEWLINE;
        sMessage += COLOR_GREEN+"dm_setwis "+COLOR_END+NEWLINE;
        sMessage += COLOR_GREEN+"dm_setfort "+COLOR_END+NEWLINE;
        sMessage += COLOR_GREEN+"dm_setreflex "+COLOR_END+NEWLINE;
        sMessage += COLOR_GREEN+"dm_setwill "+COLOR_END+NEWLINE;
    }
    sMessage += COLOR_PURPLE+"dm_settime "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_setvarint "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_setvarfloat "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_setvarstring "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_setvarmodint "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_setvarmodfloat "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_setvarmodstring "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_getvarint "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_getvarfloat "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_getvarstring "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_getvarmodint "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_getvarmodfloat "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_getvarmodstring "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_setweather_a_clear "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_setweather_a_rain "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_setweather_a_reset "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_setweather_a_snow "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_setweather_m_clear "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_setweather_m_rain "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_setweather_m_reset "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_setweather_m_snow "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_spawn "+COLOR_END+NEWLINE;
    if (VerifyAdminKey(oPlayer)) sMessage += COLOR_PURPLE+"dm_sql "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_unbandm "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_unbanshout "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_unfreeze "+COLOR_END+NEWLINE;
    if ((DM_PLAYERS_HEAR_DM && VerifyDMKey(oPlayer) && (!GetIsDM(oPlayer))) || (ADMIN_PLAYERS_HEAR_DM && VerifyAdminKey(oPlayer) && (!GetIsDM(oPlayer)))) sMessage += COLOR_PURPLE+"dm_unignoredm "+COLOR_END+NEWLINE;
    if ((DMS_HEAR_META && VerifyDMKey(oPlayer) && GetIsDM(oPlayer)) || (DM_PLAYERS_HEAR_META && VerifyDMKey(oPlayer) && (!GetIsDM(oPlayer))) || (ADMIN_DMS_HEAR_META && VerifyAdminKey(oPlayer) && GetIsDM(oPlayer)) || (ADMIN_PLAYERS_HEAR_META && VerifyAdminKey(oPlayer) && (!GetIsDM(oPlayer)))) sMessage += COLOR_PURPLE+"dm_unignoremeta "+COLOR_END+NEWLINE;
    if ((DMS_HEAR_TELLS && VerifyDMKey(oPlayer) && GetIsDM(oPlayer)) || (DM_PLAYERS_HEAR_TELLS && VerifyDMKey(oPlayer) && (!GetIsDM(oPlayer))) || (ADMIN_DMS_HEAR_TELLS && VerifyAdminKey(oPlayer) && GetIsDM(oPlayer)) || (ADMIN_PLAYERS_HEAR_TELLS && VerifyAdminKey(oPlayer) && (!GetIsDM(oPlayer)))) sMessage += COLOR_PURPLE+"dm_unignoretells "+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_uninvis "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_uninvuln "+COLOR_END+NEWLINE;
    if (ENABLE_LANGUAGES) sMessage += COLOR_GREEN+"dm_unlearn "+COLOR_END+NEWLINE;
    sMessage += ""+COLOR_PURPLE+"/v "+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_vent "+COLOR_END+NEWLINE;
    SendMessageToPC(oPlayer, sMessage);
}

void ListDMHelp(object oPlayer)
{
    string sMessage;
    sMessage = COLOR_PURPLE+DMCOMMAND1+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+COMMAND2+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_align_chaos "+COLOR_END+COLOR_WHITE+DMCOMMAND43+COLOR_LT_GREEN+"dm_align_chaos "+DMCOMMAND44+COLOR_END+COLOR_WHITE+DMCOMMAND45+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_align_evil "+COLOR_END+COLOR_WHITE+DMCOMMAND46+COLOR_LT_GREEN+"dm_align_evil "+DMCOMMAND44+COLOR_END+COLOR_WHITE+DMCOMMAND45+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_align_good "+COLOR_END+COLOR_WHITE+DMCOMMAND47+COLOR_LT_GREEN+"dm_align_good "+DMCOMMAND44+COLOR_END+COLOR_WHITE+DMCOMMAND45+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_align_law "+COLOR_END+COLOR_WHITE+DMCOMMAND48+COLOR_LT_GREEN+"dm_align_law "+DMCOMMAND44+COLOR_END+COLOR_WHITE+DMCOMMAND45+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_bandm "+COLOR_END+COLOR_WHITE+DMCOMMAND2+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_banplayer_perm "+COLOR_END+COLOR_WHITE+DMCOMMAND3+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_banplayer_temp "+COLOR_END+COLOR_WHITE+DMCOMMAND4+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_banshout_temp "+COLOR_END+COLOR_WHITE+DMCOMMAND5+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_banshout_perm "+COLOR_END+COLOR_WHITE+DMCOMMAND6+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_boot "+COLOR_END+COLOR_WHITE+DMCOMMAND79+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_change_appear "+COLOR_END+COLOR_WHITE+DMCOMMAND7+COLOR_LT_GREEN+"dm_change_appear ("+DMCOMMAND7b+")"+COLOR_END+COLOR_WHITE+DMCOMMAND7c+COLOR_LT_GREEN+"dm_change_appear 8"+COLOR_END+COLOR_WHITE+DMCOMMAND7d+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_change_appear base "+COLOR_END+COLOR_WHITE+DMCOMMAND8+COLOR_LT_GREEN+"dm_change_appear"+COLOR_END+COLOR_WHITE+DMCOMMAND8b+COLOR_LT_GREEN+"dm_change_appear"+COLOR_END+COLOR_WHITE+DMCOMMAND8c+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_create (resref) "+COLOR_END+COLOR_WHITE+DMCOMMAND9+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_a_allally "+COLOR_END+COLOR_WHITE+DMCOMMAND49+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_a_allfoe "+COLOR_END+COLOR_WHITE+DMCOMMAND50+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_a_peace "+COLOR_END+COLOR_WHITE+DMCOMMAND51+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_a_reset "+COLOR_END+COLOR_WHITE+DMCOMMAND52+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_c_allally "+COLOR_END+COLOR_WHITE+DMCOMMAND53+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_c_allfoe "+COLOR_END+COLOR_WHITE+DMCOMMAND54+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_c_peace "+COLOR_END+COLOR_WHITE+DMCOMMAND55+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_c_reset "+COLOR_END+COLOR_WHITE+DMCOMMAND56+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_m_allally "+COLOR_END+COLOR_WHITE+DMCOMMAND57+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_m_allfoe "+COLOR_END+COLOR_WHITE+DMCOMMAND58+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_m_peace "+COLOR_END+COLOR_WHITE+DMCOMMAND59+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_m_reset "+COLOR_END+COLOR_WHITE+DMCOMMAND60+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_p_allally "+COLOR_END+COLOR_WHITE+DMCOMMAND61+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_p_allfoe "+COLOR_END+COLOR_WHITE+DMCOMMAND62+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_p_peace "+COLOR_END+COLOR_WHITE+DMCOMMAND63+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fac_p_reset "+COLOR_END+COLOR_WHITE+DMCOMMAND64+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_freeze "+COLOR_END+COLOR_WHITE+DMCOMMAND10+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fx "+COLOR_END+COLOR_WHITE+DMCOMMAND11+COLOR_LT_GREEN+"dm_fx ("+DMCOMMAND11b+") 0 0"+COLOR_END+COLOR_WHITE+DMCOMMAND11c+COLOR_LT_GREEN+"dm_vfx 28 0 0"+COLOR_END+COLOR_WHITE+" ."+COLOR_END+NEWLINE;
    sMessage += COLOR_WHITE+DMCOMMAND11d+COLOR_LT_GREEN+"dm_fx ("+DMCOMMAND11b+") ("+DMCOMMAND11e+") ("+DMCOMMAND11f+") (E/S/SE)"+COLOR_END+COLOR_WHITE+DMCOMMAND11g+COLOR_LT_GREEN+"dm_vfx 209 1 300 ."+COLOR_END+NEWLINE;
    sMessage += COLOR_WHITE+DMCOMMAND11h+COLOR_LT_GREEN+"dm_vfx 209 1 300 E"+COLOR_END+COLOR_WHITE+DMCOMMAND11i+COLOR_LT_GREEN+"dm_vfx 209 2 0"+COLOR_END+COLOR_WHITE+DMCOMMAND11j+COLOR_LT_GREEN+"dm_fx_list_*"+COLOR_END+COLOR_WHITE+DMCOMMAND11k+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_fx_list_* "+COLOR_END+COLOR_WHITE+DMCOMMAND12+COLOR_LT_PURPLE+"dur, bea, eye, imp, com, fnf"+COLOR_END+COLOR_WHITE+DMCOMMAND12b+COLOR_LT_PURPLE+"dm_fx_list_fnf"+COLOR_END+COLOR_WHITE+DMCOMMAND12c+COLOR_LT_PURPLE+"dm_fx_list_dur"+COLOR_END+COLOR_WHITE+DMCOMMAND12d+COLOR_LT_PURPLE+"dm_fx_list_bea"+COLOR_END+COLOR_WHITE+DMCOMMAND12e+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fx_loc "+COLOR_END+COLOR_WHITE+DMCOMMAND13+COLOR_LT_GREEN+"dm_fx"+COLOR_END+COLOR_WHITE+DMCOMMAND13b+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_fx_rem "+COLOR_END+COLOR_WHITE+DMCOMMAND14+COLOR_LT_GREEN+"dm_fx command."+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_getbanlist "+COLOR_END+COLOR_WHITE+DMCOMMAND15+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_getbanreason "+COLOR_END+COLOR_WHITE+DMCOMMAND16+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_givexp "+COLOR_END+COLOR_WHITE+DMCOMMAND16_1+COLOR_LT_GREEN+"dm_givexp ("+DMCOMMAND16_1b+")"+COLOR_END+COLOR_WHITE+DMCOMMAND16_1c+COLOR_LT_GREEN+"dm_givexp 500"+COLOR_END+COLOR_WHITE+"."+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_givelevel "+COLOR_END+COLOR_WHITE+DMCOMMAND16_2+COLOR_LT_GREEN+"dm_givelevel ("+DMCOMMAND16_2b+")"+COLOR_END+COLOR_WHITE+DMCOMMAND16_2c+COLOR_LT_GREEN+"dm_givelevel 2"+COLOR_END+COLOR_WHITE+"."+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_takexp "+COLOR_END+COLOR_WHITE+DMCOMMAND16_3+COLOR_LT_GREEN+"dm_takexp ("+DMCOMMAND16_3b+")"+COLOR_END+COLOR_WHITE+DMCOMMAND16_3c+COLOR_LT_GREEN+"dm_takexp 500"+COLOR_END+COLOR_WHITE+"."+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_takelevel "+COLOR_END+COLOR_WHITE+DMCOMMAND16_4+COLOR_LT_GREEN+"dm_takelevel ("+DMCOMMAND16_4b+")"+COLOR_END+COLOR_WHITE+DMCOMMAND16_4c+COLOR_LT_GREEN+"dm_takelevel 2"+COLOR_END+COLOR_WHITE+"."+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_givepartyxp "+COLOR_END+COLOR_WHITE+DMCOMMAND65+COLOR_LT_GREEN+"dm_givepartyxp "+DMCOMMAND69+COLOR_END+COLOR_WHITE+"."+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_givepartylevel "+COLOR_END+COLOR_WHITE+DMCOMMAND66+COLOR_LT_GREEN+"dm_givepartylevel "+DMCOMMAND70+COLOR_END+COLOR_WHITE+"."+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_takepartyxp "+COLOR_END+COLOR_WHITE+DMCOMMAND67+COLOR_LT_GREEN+"dm_takepartyxp "+DMCOMMAND71+COLOR_END+COLOR_WHITE+"."+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_takepartylevel "+COLOR_END+COLOR_WHITE+DMCOMMAND68+COLOR_LT_GREEN+"dm_takepartylevel "+DMCOMMAND72+COLOR_END+COLOR_WHITE+"."+COLOR_END+NEWLINE;
    if ((DM_PLAYERS_HEAR_DM && VerifyDMKey(oPlayer) && (!GetIsDM(oPlayer))) || (ADMIN_PLAYERS_HEAR_DM && VerifyAdminKey(oPlayer) && (!GetIsDM(oPlayer)))) sMessage += COLOR_PURPLE+"dm_ignoredm "+COLOR_END+COLOR_WHITE+DMCOMMAND17+COLOR_END+NEWLINE;
    if ((DMS_HEAR_META && VerifyDMKey(oPlayer) && GetIsDM(oPlayer)) || (DM_PLAYERS_HEAR_META && VerifyDMKey(oPlayer) && (!GetIsDM(oPlayer))) || (ADMIN_DMS_HEAR_META && VerifyAdminKey(oPlayer) && GetIsDM(oPlayer)) || (ADMIN_PLAYERS_HEAR_META && VerifyAdminKey(oPlayer) && (!GetIsDM(oPlayer)))) sMessage += COLOR_PURPLE+"dm_ignoremeta "+COLOR_END+COLOR_WHITE+DMCOMMAND18+COLOR_END+NEWLINE;
    if ((DMS_HEAR_TELLS && VerifyDMKey(oPlayer) && GetIsDM(oPlayer)) || (DM_PLAYERS_HEAR_TELLS && VerifyDMKey(oPlayer) && (!GetIsDM(oPlayer))) || (ADMIN_DMS_HEAR_TELLS && VerifyAdminKey(oPlayer) && GetIsDM(oPlayer)) || (ADMIN_PLAYERS_HEAR_TELLS && VerifyAdminKey(oPlayer) && (!GetIsDM(oPlayer)))) sMessage += COLOR_PURPLE+"dm_ignoretells "+COLOR_END+COLOR_WHITE+DMCOMMAND19+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_stealth "+COLOR_END+COLOR_WHITE+DMCOMMAND132+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_invis "+COLOR_END+COLOR_WHITE+DMCOMMAND20+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_invuln "+COLOR_END+COLOR_WHITE+DMCOMMAND21+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_item_id "+COLOR_END+COLOR_WHITE+DMCOMMAND73+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_item_destroy_all "+COLOR_END+COLOR_WHITE+DMCOMMAND74+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_item_destroy_equip "+COLOR_END+COLOR_WHITE+DMCOMMAND75+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_item_destroy_inv "+COLOR_END+COLOR_WHITE+DMCOMMAND76+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_help "+COLOR_END+COLOR_WHITE+DMCOMMAND78+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_kill "+COLOR_END+COLOR_WHITE+DMCOMMAND22+COLOR_END+NEWLINE;
    if (ENABLE_LANGUAGES) sMessage += COLOR_GREEN+"dm_learn "+COLOR_END+COLOR_WHITE+DMCOMMAND23+COLOR_END+COLOR_LT_GREEN+"dm_learn sylvan"+COLOR_END+COLOR_WHITE+DMCOMMAND23b+COLOR_END+COLOR_LT_PURPLE+"!list alllanguages"+COLOR_END+COLOR_WHITE+DMCOMMAND23c+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_listcommands "+COLOR_END+COLOR_WHITE+DMCOMMAND24+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_jump "+COLOR_END+COLOR_WHITE+DMCOMMAND86+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_porthere "+COLOR_END+COLOR_WHITE+DMCOMMAND25+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_porthell "+COLOR_END+COLOR_WHITE+DMCOMMAND26+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portjail "+COLOR_END+COLOR_WHITE+DMCOMMAND27+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portleader "+COLOR_END+COLOR_WHITE+DMCOMMAND28+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portthere "+COLOR_END+COLOR_WHITE+DMCOMMAND29+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_porttown "+COLOR_END+COLOR_WHITE+DMCOMMAND30+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portway "+COLOR_END+COLOR_WHITE+DMCOMMAND130+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portpartyhere "+COLOR_END+COLOR_WHITE+DMCOMMAND87+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portpartyhell "+COLOR_END+COLOR_WHITE+DMCOMMAND88+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portpartyjail "+COLOR_END+COLOR_WHITE+DMCOMMAND89+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portpartyleader "+COLOR_END+COLOR_WHITE+DMCOMMAND90+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portpartythere "+COLOR_END+COLOR_WHITE+DMCOMMAND91+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portpartytown "+COLOR_END+COLOR_WHITE+DMCOMMAND92+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_portpartyway "+COLOR_END+COLOR_WHITE+DMCOMMAND131+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_rez "+COLOR_END+COLOR_WHITE+DMCOMMAND31+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_reset_mod "+COLOR_END+COLOR_WHITE+DMCOMMAND32+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_rest "+COLOR_END+COLOR_WHITE+DMCOMMAND83+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_reveal "+COLOR_END+COLOR_WHITE+DMCOMMAND84+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_hide "+COLOR_END+COLOR_WHITE+DMCOMMAND85+COLOR_END+NEWLINE;
    if ((!LETO_FOR_ADMINS_ONLY) || VerifyAdminKey(oPlayer))
    {
        sMessage += COLOR_GREEN+"dm_setcha "+COLOR_END+COLOR_WHITE+DMCOMMAND95+COLOR_END+COLOR_LT_GREEN+"dm_setcha "+COLOR_END+COLOR_WHITE+COMMAND38+COLOR_END+NEWLINE;
        sMessage += COLOR_GREEN+"dm_setcon "+COLOR_END+COLOR_WHITE+DMCOMMAND96+COLOR_END+COLOR_LT_GREEN+"dm_setcon "+COLOR_END+COLOR_WHITE+COMMAND38+COLOR_END+NEWLINE;
        sMessage += COLOR_GREEN+"dm_setdex "+COLOR_END+COLOR_WHITE+DMCOMMAND97+COLOR_END+COLOR_LT_GREEN+"dm_setcha "+COLOR_END+COLOR_WHITE+COMMAND38+COLOR_END+NEWLINE;
        sMessage += COLOR_GREEN+"dm_setint "+COLOR_END+COLOR_WHITE+DMCOMMAND98+COLOR_END+COLOR_LT_GREEN+"dm_setint "+COLOR_END+COLOR_WHITE+COMMAND38+COLOR_END+NEWLINE;
        sMessage += COLOR_GREEN+"dm_setstr "+COLOR_END+COLOR_WHITE+DMCOMMAND99+COLOR_END+COLOR_LT_GREEN+"dm_setstr "+COLOR_END+COLOR_WHITE+COMMAND38+COLOR_END+NEWLINE;
        sMessage += COLOR_GREEN+"dm_setwis "+COLOR_END+COLOR_WHITE+DMCOMMAND100+COLOR_END+COLOR_LT_GREEN+"dm_setwis "+COLOR_END+COLOR_WHITE+COMMAND38+COLOR_END+NEWLINE;
        sMessage += COLOR_GREEN+"dm_setfort "+COLOR_END+COLOR_WHITE+DMCOMMAND101+COLOR_END+COLOR_LT_GREEN+"dm_setfort "+DMCOMMAND94+COLOR_END+COLOR_WHITE+COMMAND38+COLOR_END+NEWLINE;
        sMessage += COLOR_GREEN+"dm_setreflex "+COLOR_END+COLOR_WHITE+DMCOMMAND102+COLOR_END+COLOR_LT_GREEN+"dm_setreflex "+DMCOMMAND94+COLOR_END+COLOR_WHITE+COMMAND38+COLOR_END+NEWLINE;
        sMessage += COLOR_GREEN+"dm_setwill "+COLOR_END+COLOR_WHITE+DMCOMMAND103+COLOR_END+COLOR_LT_GREEN+"dm_setwill "+DMCOMMAND94+COLOR_END+COLOR_WHITE+COMMAND38+COLOR_END+NEWLINE;
    }
    sMessage += COLOR_PURPLE+"dm_settime "+COLOR_END+COLOR_WHITE+DMCOMMAND116+COLOR_END+COLOR_LT_PURPLE+"dm_settime "+DMCOMMAND125+COLOR_END+COLOR_WHITE+"."+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_setvarint "+COLOR_END+COLOR_WHITE+DMCOMMAND109+DMCOMMAND111+DMCOMMAND114+COLOR_END+COLOR_LT_GREEN+"dm_setvarint "+DMCOMMAND104+DMCOMMAND105+COLOR_END+COLOR_WHITE+DMCOMMAND108+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_setvarfloat "+COLOR_END+COLOR_WHITE+DMCOMMAND109+DMCOMMAND112+DMCOMMAND114+COLOR_END+COLOR_LT_GREEN+"dm_setvarfloat "+DMCOMMAND104+DMCOMMAND106+COLOR_END+COLOR_WHITE+DMCOMMAND108+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_setvarstring "+COLOR_END+COLOR_WHITE+DMCOMMAND109+DMCOMMAND113+DMCOMMAND114+COLOR_END+COLOR_LT_GREEN+"dm_setvarstring "+DMCOMMAND104+DMCOMMAND107+COLOR_END+COLOR_WHITE+DMCOMMAND108+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_setvarmodint "+COLOR_END+COLOR_WHITE+DMCOMMAND109+DMCOMMAND111+DMCOMMAND115+COLOR_END+COLOR_LT_PURPLE+"dm_setvarmodint "+DMCOMMAND104+DMCOMMAND105+COLOR_END+COLOR_WHITE+"."+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_setvarmodfloat "+COLOR_END+COLOR_WHITE+DMCOMMAND109+DMCOMMAND112+DMCOMMAND115+COLOR_END+COLOR_LT_PURPLE+"dm_setvarmodfloat "+DMCOMMAND104+DMCOMMAND106+COLOR_END+COLOR_WHITE+"."+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_setvarmodstring "+COLOR_END+COLOR_WHITE+DMCOMMAND109+DMCOMMAND113+DMCOMMAND115+COLOR_END+COLOR_LT_PURPLE+"dm_setvarmodstring "+DMCOMMAND104+DMCOMMAND107+COLOR_END+COLOR_WHITE+"."+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_getvarint "+COLOR_END+COLOR_WHITE+DMCOMMAND110+DMCOMMAND111+DMCOMMAND114+COLOR_END+COLOR_LT_GREEN+"dm_getvarint "+DMCOMMAND104+COLOR_END+COLOR_WHITE+DMCOMMAND108+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_getvarfloat "+COLOR_END+COLOR_WHITE+DMCOMMAND110+DMCOMMAND112+DMCOMMAND114+COLOR_END+COLOR_LT_GREEN+"dm_getvarfloat "+DMCOMMAND104+COLOR_END+COLOR_WHITE+DMCOMMAND108+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_getvarstring "+COLOR_END+COLOR_WHITE+DMCOMMAND110+DMCOMMAND113+DMCOMMAND114+COLOR_END+COLOR_LT_GREEN+"dm_getvarstring "+DMCOMMAND104+COLOR_END+COLOR_WHITE+DMCOMMAND108+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_getvarmodint "+COLOR_END+COLOR_WHITE+DMCOMMAND110+DMCOMMAND111+DMCOMMAND115+COLOR_END+COLOR_LT_PURPLE+"dm_getvarmodint "+DMCOMMAND104+COLOR_END+COLOR_WHITE+"."+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_getvarmodfloat "+COLOR_END+COLOR_WHITE+DMCOMMAND110+DMCOMMAND112+DMCOMMAND115+COLOR_END+COLOR_LT_PURPLE+"dm_getvarmodfloat "+DMCOMMAND104+COLOR_END+COLOR_WHITE+"."+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_getvarmodstring "+COLOR_END+COLOR_WHITE+DMCOMMAND110+DMCOMMAND113+DMCOMMAND115+COLOR_END+COLOR_LT_PURPLE+"dm_getvarmodstring "+DMCOMMAND104+COLOR_END+COLOR_WHITE+"."+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_setweather_a_clear "+COLOR_END+COLOR_WHITE+DMCOMMAND117+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_setweather_a_rain "+COLOR_END+COLOR_WHITE+DMCOMMAND118+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_setweather_a_reset "+COLOR_END+COLOR_WHITE+DMCOMMAND119+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_setweather_a_snow "+COLOR_END+COLOR_WHITE+DMCOMMAND120+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_setweather_m_clear "+COLOR_END+COLOR_WHITE+DMCOMMAND121+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_setweather_m_rain "+COLOR_END+COLOR_WHITE+DMCOMMAND122+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_setweather_m_reset "+COLOR_END+COLOR_WHITE+DMCOMMAND123+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_setweather_m_snow "+COLOR_END+COLOR_WHITE+DMCOMMAND124+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_spawn "+COLOR_END+COLOR_WHITE+DMCOMMAND126+COLOR_END+COLOR_LT_GREEN+"dm_spawn "+DMCOMMAND127+COLOR_END+COLOR_WHITE+"."+COLOR_END+NEWLINE;
    if (VerifyAdminKey(oPlayer)) sMessage += COLOR_PURPLE+"dm_sql "+COLOR_END+COLOR_WHITE+DMCOMMAND80+COLOR_END+COLOR_LT_PURPLE+"dm_sql"+DMCOMMAND81+COLOR_END+COLOR_WHITE+DMCOMMAND82+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_unbandm "+COLOR_END+COLOR_WHITE+DMCOMMAND33+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_unbanshout "+COLOR_END+COLOR_WHITE+DMCOMMAND34+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_unfreeze "+COLOR_END+COLOR_WHITE+DMCOMMAND35+COLOR_END+NEWLINE;
    if ((DM_PLAYERS_HEAR_DM && VerifyDMKey(oPlayer) && (!GetIsDM(oPlayer))) || (ADMIN_PLAYERS_HEAR_DM && VerifyAdminKey(oPlayer) && (!GetIsDM(oPlayer)))) sMessage += COLOR_PURPLE+"dm_unignoredm "+COLOR_END+COLOR_WHITE+DMCOMMAND36+COLOR_END+NEWLINE;
    if ((DMS_HEAR_META && VerifyDMKey(oPlayer) && GetIsDM(oPlayer)) || (DM_PLAYERS_HEAR_META && VerifyDMKey(oPlayer) && (!GetIsDM(oPlayer))) || (ADMIN_DMS_HEAR_META && VerifyAdminKey(oPlayer) && GetIsDM(oPlayer)) || (ADMIN_PLAYERS_HEAR_META && VerifyAdminKey(oPlayer) && (!GetIsDM(oPlayer)))) sMessage += COLOR_PURPLE+"dm_unignoremeta "+COLOR_END+COLOR_WHITE+DMCOMMAND37+COLOR_END+NEWLINE;
    if ((DMS_HEAR_TELLS && VerifyDMKey(oPlayer) && GetIsDM(oPlayer)) || (DM_PLAYERS_HEAR_TELLS && VerifyDMKey(oPlayer) && (!GetIsDM(oPlayer))) || (ADMIN_DMS_HEAR_TELLS && VerifyAdminKey(oPlayer) && GetIsDM(oPlayer)) || (ADMIN_PLAYERS_HEAR_TELLS && VerifyAdminKey(oPlayer) && (!GetIsDM(oPlayer)))) sMessage += COLOR_PURPLE+"dm_unignoretells "+COLOR_END+COLOR_WHITE+DMCOMMAND38+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+"dm_uninvis "+COLOR_END+COLOR_WHITE+DMCOMMAND39+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_uninvuln "+COLOR_END+COLOR_WHITE+DMCOMMAND40+COLOR_END+NEWLINE;
    if (ENABLE_LANGUAGES) sMessage += COLOR_GREEN+"dm_unlearn "+COLOR_END+COLOR_WHITE+DMCOMMAND41+COLOR_LT_GREEN+"dm_learn"+COLOR_END+COLOR_WHITE+": "+COLOR_LT_GREEN+"dm_unlearn sylvan"+COLOR_END+COLOR_WHITE+DMCOMMAND41b+COLOR_LT_PURPLE+"!list alllanguages"+COLOR_END+COLOR_WHITE+DMCOMMAND41c+COLOR_END+NEWLINE;
    sMessage += ""+COLOR_PURPLE+"/v "+COLOR_END+COLOR_WHITE+DMCOMMAND42+COLOR_END+NEWLINE;
    sMessage += COLOR_GREEN+"dm_vent "+COLOR_END+COLOR_WHITE+DMCOMMAND128+COLOR_END+COLOR_LT_PURPLE+"/v"+COLOR_END+COLOR_WHITE+DMCOMMAND129+COLOR_END+NEWLINE;
    SendMessageToPC(oPlayer, sMessage);
}

int GetSpeaksAToDRacialPlanarLanguages(object oPC)
{
    if (GetLocalInt(oPC, "FKY_CHAT_LANG81")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG37")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG4")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG6")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG78")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG65")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG89")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG63")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG32")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG13")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG64")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG1")) return TRUE;
    return FALSE;
}

int GetSpeaksEToHRacialPlanarLanguages(object oPC)
{
    if (GetLocalInt(oPC, "FKY_CHAT_LANG9")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG17")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG66")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG18")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG15")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG49")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG52")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG23")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG53")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG74")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG62")) return TRUE;
    return FALSE;
}

int GetSpeaksIToORacialPlanarLanguages(object oPC)
{
    if (GetLocalInt(oPC, "FKY_CHAT_LANG21")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG61")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG72")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG79")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG67")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG54")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG55")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG99")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG60")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG57")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG82")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG56")) return TRUE;
    return FALSE;
}

int GetSpeaksPToZRacialPlanarLanguages(object oPC)
{
    if (GetLocalInt(oPC, "FKY_CHAT_LANG70")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG58")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG68")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG73")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG59")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG75")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG36")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG40")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG51")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG41")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG50")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG46")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG69")) return TRUE;
    return FALSE;
}

int GetSpeaksAnyRacialPlanarLanguages(object oPC)
{
    if (GetLocalInt(oPC, "FKY_CHAT_LANG81")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG37")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG4")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG6")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG78")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG65")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG89")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG63")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG32")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG13")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG64")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG1")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG9")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG17")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG66")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG18")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG15")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG49")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG52")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG23")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG53")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG74")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG62")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG21")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG61")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG72")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG79")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG67")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG54")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG55")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG99")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG60")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG57")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG82")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG56")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG70")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG58")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG68")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG73")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG59")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG75")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG36")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG40")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG51")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG41")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG50")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG46")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG69")) return TRUE;
    return FALSE;
}

int GetSpeaksAToHRegionalLanguages(object oPC)
{
    if (GetLocalInt(oPC, "FKY_CHAT_LANG2")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG3")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG7")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG8")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG10")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG11")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG12")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG16")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG19")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG20")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG76")) return TRUE;
    return FALSE;
}

int GetSpeaksIToRRegionalLanguages(object oPC)
{
    if (GetLocalInt(oPC, "FKY_CHAT_LANG22")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG24")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG25")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG26")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG27")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG28")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG29")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG30")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG31")) return TRUE;
    return FALSE;
}

int GetSpeaksSToZRegionalLanguages(object oPC)
{
    if (GetLocalInt(oPC, "FKY_CHAT_LANG33")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG34")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG35")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG38")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG39")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG42")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG43")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG45")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG47")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG48")) return TRUE;
    return FALSE;
}

int GetSpeaksAnyRegionalLanguages(object oPC)
{
    if (GetLocalInt(oPC, "FKY_CHAT_LANG2")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG3")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG7")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG8")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG10")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG11")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG12")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG16")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG19")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG20")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG76")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG22")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG24")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG25")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG26")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG27")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG28")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG29")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG30")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG31")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG33")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG34")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG35")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG38")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG39")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG42")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG43")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG45")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG47")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG48")) return TRUE;
    return FALSE;
}

int GetSpeaksAnyClassLanguages(object oPC)
{
    if (GetLocalInt(oPC, "FKY_CHAT_LANG5")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG14")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG71")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG80")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG77")) return TRUE;
    if (GetLocalInt(oPC, "FKY_CHAT_LANG44")) return TRUE;
    return FALSE;
}

int GetLanguageNumber(string sName)
{
    int nText = FindSubString(" dwarven elven gnomish halfling drow animal cant goblin orcish draconic infernal abyssal celestial leetspeak common", sName);
                              //1       9     15      23       32   37     44   49     56     63       72       81      89        99        109
    if (nText == -1)
    {                //second set of languages courtesy of Lanessar and the Myth Drannor PW
        nText = FindSubString("abc d g h ikl m n opr s t u v y", GetStringLeft(sName, 1));
        switch (nText)       //012 4 6 8 1012141618202224262830
        {                    //           11      19
            case 0:
            if (sName == "algarondan") nText = 2;
            else if (sName == "alzhedo") nText = 3;
            else if (sName == "aquan") nText = 4;
            else if (sName == "assassin") nText = 5;
            else if (sName == "auran") nText = 6;
            else if (sName == "averial") nText = 78;
            else nText = -1;
            break;
            case 1:
            if (sName == "bugbear") nText = 75;
            else nText = -1;
            break;
            case 2:
            if (sName == "chessentan") nText = 7;
            else if (sName == "chondathan") nText = 8;
            else if (sName == "chultan") nText = 10;
            else nText = -1;
            break;
            case 4:
            if (sName == "damaran") nText = 11;
            else if (sName == "dambrathan") nText = 12;
            else if (sName == "drowsign") nText = 13;
            else if (sName == "druidic") nText = 14;
            else if (sName == "duergar") nText = 64;
            else if (sName == "durpari") nText = 16;
            else nText = -1;
            break;
            case 6:
            if (sName == "giant") nText = 17;
            else if (sName == "githzerai") nText = 66;
            else if (sName == "gnoll") nText = 18;
            else if (sName == "grimlock") nText = 52;
            else nText = -1;
            break;
            case 8:
            if (sName == "halardrim") nText = 19;
            else if (sName == "halruaan") nText = 20;
            else if (sName == "half-orc") nText = 53;
            else if (sName == "hengeyokai") nText = 74;
            else if (sName == "highshou") nText = 76;
            else if (sName == "hobgoblin") nText = 62;
            else nText = -1;
            break;
            case 10:
            if (sName == "ignan") nText = 21;
            if (sName == "illithid") nText = 61;
            else if (sName == "illuskan") nText = 22;
            else if (sName == "imaskar") nText = 24;
            else nText = -1;
            break;
            case 11:
            if (sName == "kenderspeak") nText = 55;
            else if (sName == "kobold") nText = 79;
            else if (sName == "korred") nText = 67;
            else if (sName == "kuo-toan") nText = 54;
            else nText = -1;
            break;
            case 12:
            if (sName == "lantanese") nText = 25;
            else if (sName == "lizardman") nText = 60;
            else nText = -1;
            break;
            case 14:
            if (sName == "magic") nText = 71;
            else if (sName == "midani") nText = 26;
            else if (sName == "minotaur") nText = 57;
            else if (sName == "mulhorandi") nText = 27;
            else nText = -1;
            break;
            case 16:
            if (sName == "nexalan") nText = 28;
            else if (sName == "necromantic") nText = 80;
            else nText = -1;
            break;
            case 18:
            if (sName == "oillusk") nText = 29;
            else if (sName == "ogre") nText = 82;
            else nText = -1;
            break;
            case 19:
            if (sName == "pixie") nText = 70;
            else if (sName == "psionic") nText = 77;
            else nText = -1;
            break;
            case 20:
            if (sName == "rakshasa") nText = 58;
            else if (sName == "rashemi") nText = 30;
            else if (sName == "raumvira") nText = 31;
            else nText = -1;
            break;
            case 22:
            if (sName == "sahaguin") nText = 68;
            else if (sName == "serusan") nText = 33;
            else if (sName == "shaaran") nText = 34;
            else if (sName == "sirensong") nText = 73;
            else if (sName == "shou") nText = 35;
            else if (sName == "stinger") nText = 59;
            else if (sName == "svirfneblin") nText = 75;
            else if (sName == "sylvan") nText = 36;
            else nText = -1;
            break;
            case 24:
            if (sName == "talfiric") nText = 38;
            else if (sName == "tashalan") nText = 39;
            else if (sName == "terran") nText = 40;
            else if (sName == "thri-kreen") nText = 51;
            else if (sName == "treant") nText = 41;
            else if (sName == "troll") nText = 50;
            else if (sName == "tuigan") nText = 42;
            else if (sName == "turmic") nText = 43;
            else nText = -1;
            break;
            case 26:
            if (sName == "uluik") nText = 45;
            else if (sName == "undercommon") nText = 46;
            else if (sName == "untheric") nText = 47;
            else nText = -1;
            break;
            case 28:
            if (sName == "vaasan") nText = 48;
            else nText = -1;
            case 30:
            if (sName == "yuan-ti") nText = 69;
            else nText = -1;
            break;
        }
    }
    return nText;
}

string GetNameOfLanguage(int nLang)
{
    string sReturn = "";
    switch(nLang/10)
    {
        case 0:
        switch(nLang)
        {
            case 0: sReturn = "Common"; break;
            case 1: sReturn = "Dwarven"; break;
            case 2: sReturn = "Algarondan"; break;
            case 3: sReturn = "Alzhedo"; break;
            case 4: sReturn = "Aquan"; break;
            case 5: sReturn = "Assassin"; break;
            case 6: sReturn = "Auran"; break;
            case 7: sReturn = "Chessentan"; break;
            case 8: sReturn = "Chondathan"; break;
            case 9: sReturn = "Elven"; break;
        }
        break;
        case 1:
        switch(nLang)
        {
            case 10: sReturn = "Chultan"; break;
            case 11: sReturn = "Damaran"; break;
            case 12: sReturn = "Dambrathan"; break;
            case 13: sReturn = "DrowSign"; break;
            case 14: sReturn = "Druidic"; break;
            case 15: sReturn = "Gnomish"; break;
            case 16: sReturn = "Durpari"; break;
            case 17: sReturn = "Giant"; break;
            case 18: sReturn = "Gnoll"; break;
            case 19: sReturn = "Halardrim"; break;
        }
        break;
        case 2:
        switch(nLang)
        {
            case 20: sReturn = "Halruaan"; break;
            case 21: sReturn = "Ignan"; break;
            case 22: sReturn = "Illuskan"; break;
            case 23: sReturn = "Halfling"; break;
            case 24: sReturn = "Imaskar"; break;
            case 25: sReturn = "Lantanese"; break;
            case 26: sReturn = "Midani"; break;
            case 27: sReturn = "Mulhorandi"; break;
            case 28: sReturn = "Nexalan"; break;
            case 29: sReturn = "Oillusk"; break;
        }
        break;
        case 3:
        switch(nLang)
        {
            case 30: sReturn = "Rashemi"; break;
            case 31: sReturn = "Raumvira"; break;
            case 32: sReturn = "Drow"; break;
            case 33: sReturn = "Serusan"; break;
            case 34: sReturn = "Shaaran"; break;
            case 35: sReturn = "Shou"; break;
            case 36: sReturn = "Sylvan"; break;
            case 37: sReturn = "Animal"; break;
            case 38: sReturn = "Talfiric"; break;
            case 39: sReturn = "Tashalan"; break;
        }
        break;
        case 4:
        switch(nLang)
        {
            case 40: sReturn = "Terran"; break;
            case 41: sReturn = "Treant"; break;
            case 42: sReturn = "Tuigan"; break;
            case 43: sReturn = "Turmic"; break;
            case 44: sReturn = "Cant"; break;
            case 45: sReturn = "Uluik"; break;
            case 46: sReturn = "Undercommon"; break;
            case 47: sReturn = "Untheric"; break;
            case 48: sReturn = "Vaasan"; break;
            case 49: sReturn = "Goblin"; break;
        }
        break;
        case 5:
        switch(nLang)
        {
            case 50: sReturn = "Troll"; break;
            case 51: sReturn = "Thri-kreen"; break;
            case 52: sReturn = "Grimlock"; break;
            case 53: sReturn = "Half-Orc"; break;
            case 54: sReturn = "Kuo-Toan"; break;
            case 55: sReturn = "Kenderspeak"; break;
            case 56: sReturn = "Orcish"; break;
            case 57: sReturn = "Minotaur"; break;
            case 58: sReturn = "Rakshasa"; break;
            case 59: sReturn = "Stinger"; break;
        }
        break;
        case 6:
        switch(nLang)
        {
            case 60: sReturn = "Lizardman"; break;
            case 61: sReturn = "Illithid"; break;
            case 62: sReturn = "Hobgoblin"; break;
            case 63: sReturn = "Draconic"; break;
            case 64: sReturn = "Duergar"; break;
            case 65: sReturn = "Bugbear"; break;
            case 66: sReturn = "Githzerai"; break;
            case 67: sReturn = "Korred"; break;
            case 68: sReturn = "Sahaguin"; break;
            case 69: sReturn = "Yuan-ti"; break;
        }
        break;
        case 7:
        switch(nLang)
        {
            case 70: sReturn = "Pixie"; break;
            case 71: sReturn = "Magic"; break;
            case 72: sReturn = "Infernal"; break;
            case 73: sReturn = "Sirensong"; break;
            case 74: sReturn = "Hengeyokai"; break;
            case 75: sReturn = "Svirfneblin"; break;
            case 76: sReturn = "HighShou"; break;
            case 77: sReturn = "Psionic"; break;
            case 78: sReturn = "Averial"; break;
            case 79: sReturn = "Kobold"; break;
        }
        break;
        case 8:
        switch(nLang)
        {
            case 80: sReturn = "Necromantic"; break;
            case 81: sReturn = "Abyssal"; break;
            case 82: sReturn = "Ogre"; break;
            case 89: sReturn = "Celestial"; break;
        }
        break;
        case 9:
        switch(nLang)
        {
            case 99: sReturn = "Leetspeak"; break;
        }
        break;
        case 10:
        switch(nLang)
        {
            case 109: sReturn = "Common"; break;
        }
    }
    return sReturn;
}

void ListLanguages(object oPC)
{
    int nX;
    string sIntro = COLOR_WHITE+LANGLIST1+COLOR_PURPLE+"/l "+COLOR_END+COLOR_WHITE+LANGLIST2+COLOR_PURPLE+COMMAND_SYMBOL+"speak "+COLOR_END+COLOR_WHITE+LANGLIST3+COLOR_PURPLE+COMMAND_SYMBOL+"speak common"+COLOR_END+COLOR_WHITE+"."+COLOR_END+NEWLINE;
    string sMessage = "";
    for(nX = 0; nX < 100; nX++)
    {
        if (GetLocalInt(oPC, "FKY_CHAT_LANG" + IntToString(nX)))
        {
            sMessage += COLOR_PURPLE + GetStringLowerCase(GetNameOfLanguage(nX)) + COLOR_END+NEWLINE;
        }
    }
    if (sMessage == "")
    {
        sIntro += COLOR_WHITE+LANGLIST4+COLOR_END+NEWLINE;
    }
    else
    {
        sIntro += COLOR_WHITE+LANGLIST5+COLOR_END+NEWLINE;
        sMessage += COLOR_WHITE+LANGLIST6+COLOR_END+COLOR_PURPLE + COMMAND_SYMBOL + "speak common"+COLOR_END+COLOR_WHITE+LANGLIST7+COLOR_END+NEWLINE;
    }
    string sFinal = sIntro + sMessage;
    SendMessageToPC(oPC, sFinal);
}

void ListAllLanguages(object oPC)
{
    int nX;
    string sIntro = COLOR_WHITE+LANGLIST8+COLOR_END+NEWLINE;
    string sMessage;
    for(nX = 0; nX < 100; nX++)
    {
        sMessage = GetNameOfLanguage(nX);
        if (sMessage != "")
        {
            sIntro += COLOR_PURPLE + GetStringLowerCase(sMessage) + COLOR_END+NEWLINE;
        }
    }
    SendMessageToPC(oPC, sIntro);
}

void ListIgnored(object oPlayer)
{
    string sPlayername;
    string sMessage = "";
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC))
    {
        sPlayername = GetPCPlayerName(oPC);
        if (GetLocalInt(oPlayer, "CHT_IGNORE" + sPlayername) == TRUE)
        {
            sMessage += COLOR_RED+IGNORE1+sPlayername+"."+COLOR_END+NEWLINE;
        }
        oPC = GetNextPC();
    }
    if (sMessage != "") SendMessageToPC(oPlayer, sMessage);
    else SendMessageToPC(oPlayer, COLOR_RED+IGNORE2+COLOR_END);
}
int GetIsSpam(string sText)
{
    if(TestStringAgainstPattern("**http:**|**www.**|**.*a.**|*n.*n.*n.*n", sText)) return TRUE;
    return FALSE;
}
int GetIsChannelSuppressed(int nChannel)
{
    int nReturn;
    switch(nChannel)
    {
    case 1: nReturn = DISABLE_TALK_CHANNEL; break;
    case 2: nReturn = DISABLE_SHOUT_CHANNEL; break;
    case 3: nReturn = DISABLE_WHISPER_CHANNEL; break;
    case 4: nReturn = DISABLE_TELL_CHANNEL; break;
    case 6: nReturn = DISABLE_PARTY_CHANNEL; break;
    case 14: nReturn = DISABLE_DM_CHANNEL; break;
    default: nReturn = FALSE; break;
    }
    return nReturn;
}
int GetIsChannelDeadSuppressed(int nChannel)
{
    int nReturn;
    switch(nChannel)
    {
    case 1: nReturn = DISABLE_DEAD_TALK; break;
    case 2: nReturn = DISABLE_DEAD_SHOUT; break;
    case 3: nReturn = DISABLE_DEAD_WHISPER; break;
    case 4: nReturn = DISABLE_DEAD_TELL; break;
    case 6: nReturn = DISABLE_DEAD_PARTY; break;
    case 14: nReturn = DISABLE_DEAD_DM; break;
    default: nReturn = FALSE; break;
    }
    return nReturn;
}
int GetIsChannelSilencedSuppressed(int nChannel)
{
    int nReturn;
    switch(nChannel)
    {
    case 1: nReturn = DISABLE_SILENCED_TALK; break;
    case 2: nReturn = DISABLE_SILENCED_SHOUT; break;
    case 3: nReturn = DISABLE_SILENCED_WHISPER; break;
    case 4: nReturn = DISABLE_SILENCED_TELL; break;
    case 6: nReturn = DISABLE_SILENCED_PARTY; break;
    case 14: nReturn = DISABLE_SILENCED_DM; break;
    default: nReturn = FALSE; break;
    }
    return nReturn;
}
int GetIsSilenced(object oPC)
{
    effect eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect))
    {
        if (GetEffectType(eEffect) == EFFECT_TYPE_SILENCE) return TRUE;
        eEffect = GetNextEffect(oPC);
    }
    return FALSE;
}
void SendMessageToPCDMs(string sMessage)
{
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC))
    {//check to see if they've chosen to ignore
        if (VerifyDMKey(oPC) && (!GetIsDM(oPC)) && (!GetLocalInt(oPC, "FKY_CHT_IGNORETELLS")))
        {
            if (SEND_CHANNELS_TO_CHAT_LOG) SendChatLogMessage(oPC, sMessage, GetMessenger());
            else SendMessageToPC(oPC, sMessage);
        }
        oPC = GetNextPC();
    }
}
void SendMessageToPCAdmins(string sMessage)
{
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC))
    {//check to see if they've chosen to ignore
        if (VerifyAdminKey(oPC) && (!GetIsDM(oPC)) && (!GetLocalInt(oPC, "FKY_CHT_IGNORETELLS")))
        {
            if (SEND_CHANNELS_TO_CHAT_LOG) SendChatLogMessage(oPC, sMessage, GetMessenger());
            else SendMessageToPC(oPC, sMessage);
        }
        oPC = GetNextPC();
    }
}
void SendMessageToDMDMs(string sMessage)
{
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC))
    {//check to see if they've chosen to ignore
        if (VerifyDMKey(oPC) && GetIsDM(oPC) && (!GetLocalInt(oPC, "FKY_CHT_IGNORETELLS")))
        {
            if (SEND_CHANNELS_TO_CHAT_LOG) SendChatLogMessage(oPC, sMessage, GetMessenger());
            else SendMessageToPC(oPC, sMessage);
        }
        oPC = GetNextPC();
    }
}
void SendMessageToDMAdmins(string sMessage)
{
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC))
    {//check to see if they've chosen to ignore
        if (VerifyAdminKey(oPC) && GetIsDM(oPC) && (!GetLocalInt(oPC, "FKY_CHT_IGNORETELLS")))
        {
            if (SEND_CHANNELS_TO_CHAT_LOG) SendChatLogMessage(oPC, sMessage, GetMessenger());
            else SendMessageToPC(oPC, sMessage);
        }
        oPC = GetNextPC();
    }
}
void GetBanList(object oPlayer)
{
    string sString = "";
    string sList = "";
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC))
    {
        if (GetLocalInt(oPC, "FKY_CHT_BANSHOUT") == TRUE)
        {
            sString = COLOR_RED+GetName(oPC)+BAN1+COLOR_END+NEWLINE;
            sList += sString;
        }
        if (GetLocalInt(oPC, "FKY_CHT_BANDM") == TRUE)
        {
            sString = COLOR_RED+GetName(oPC)+BAN2+COLOR_END+NEWLINE;
            sList += sString;
        }
        oPC = GetNextPC();
    }
    if (sList != "") SendMessageToPC(oPlayer, sList);
    else SendMessageToPC(oPlayer, COLOR_RED+BAN3+COLOR_END);
}
void DMTellForwarding(object oPlayer, string sTarget, string sMessage, int nChannel)
{
    string sSend = COLOR_PURPLE + GetName(oPlayer) + "(" + GetPCPlayerName(oPlayer) + ")" + sTarget + COLOR_END+COLOR_GREEN+"["+TELL+"] " + sMessage + COLOR_END+NEWLINE;
    if ((nChannel == 4) || (ENABLE_DM_TELL_ROUTING && (nChannel == 20)))
    {
        if (DMS_HEAR_TELLS) SendMessageToDMDMs(sSend);
        if (DM_PLAYERS_HEAR_TELLS) SendMessageToPCDMs(sSend);
        if (ADMIN_DMS_HEAR_TELLS) SendMessageToDMAdmins(sSend);
        if (ADMIN_PLAYERS_HEAR_TELLS) SendMessageToPCAdmins(sSend);
    }
    else if ((nChannel == 20) && DM_TELLS_ROUTED_ONLY_TO_ADMINS)
    {
        if (ADMIN_DMS_HEAR_TELLS) SendMessageToDMAdmins(sSend);
        if (ADMIN_PLAYERS_HEAR_TELLS) SendMessageToPCAdmins(sSend);
    }
}
void DMChannelForwardToDMs(object oPlayer, string sMessage)
{
    string sSend = COLOR_PURPLE + GetName(oPlayer) + "(" + GetPCPlayerName(oPlayer) + ")" + ": "+COLOR_END+COLOR_LT_BLUE+"["+DM+"] " + sMessage + COLOR_END+NEWLINE;
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC))
    {
        if (VerifyDMKey(oPC) && (!GetIsDM(oPC)) && (!GetLocalInt(oPC, "FKY_CHT_IGNOREDM")))
        {
            if (SEND_CHANNELS_TO_CHAT_LOG) SendChatLogMessage(oPC, sSend, GetMessenger());
            else SendMessageToPC(oPC, sSend);
        }
        oPC = GetNextPC();
    }
}
void DMChannelForwardToAdmins(object oPlayer, string sMessage)
{
    string sSend = COLOR_PURPLE + GetName(oPlayer) + "(" + GetPCPlayerName(oPlayer) + ")" + ":"+COLOR_END+COLOR_LT_BLUE+"[DM] " + sMessage + COLOR_END+NEWLINE;
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC))
    {
        if (VerifyAdminKey(oPC) && (!GetIsDM(oPC)) && (!GetLocalInt(oPC, "FKY_CHT_IGNOREDM")))
        {
            if (SEND_CHANNELS_TO_CHAT_LOG) SendChatLogMessage(oPC, sSend, GetMessenger());
            else SendMessageToPC(oPC, sSend);
        }
        oPC = GetNextPC();
    }
}
void DoDMInvis(object oPlayer)
{
    effect eEffect = EffectCutsceneGhost();
    effect eEffect2 = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);
    effect eLink = SupernaturalEffect(EffectLinkEffects(eEffect, eEffect2));
    ApplyEffectToObject(2, eLink, oPlayer);
}
void DoDMUninvis(object oPlayer)
{
    effect eEffect = GetFirstEffect(oPlayer);
    while (GetIsEffectValid(eEffect))
    {
        if (GetEffectCreator(eEffect) == GetModule()) DelayCommand(0.1, RemoveEffect(oPlayer, eEffect));
        eEffect = GetNextEffect(oPlayer);
    }
}
void ShowInfo(object oPlayer, object oGetInfoFrom)
{
    //collect info
    string sName = GetName(oGetInfoFrom);
    string sPlayername = GetPCPlayerName(oGetInfoFrom);
    string sKey = GetPCPublicCDKey(oGetInfoFrom);
    string sIP = GetPCIPAddress(oGetInfoFrom);
    int nClass1 = GetClassByPosition(1, oGetInfoFrom);
    int nClass2 = GetClassByPosition(2, oGetInfoFrom);
    int nClass3 = GetClassByPosition(3, oGetInfoFrom);
    int nClassLevel1 = GetLevelByClass(nClass1, oGetInfoFrom);
    int nClassLevel2 = GetLevelByClass(nClass2, oGetInfoFrom);
    int nClassLevel3 = GetLevelByClass(nClass3, oGetInfoFrom);
    int nControlClass = nClass1;
    if ((nClassLevel1 > nClassLevel2) && (nClassLevel1 > nClassLevel3)) nControlClass = nClass1;
    else if ((nClassLevel2 > nClassLevel1) && (nClassLevel2 > nClassLevel3)) nControlClass = nClass2;
    else if ((nClassLevel3 > nClassLevel1) && (nClassLevel3 > nClassLevel2)) nControlClass = nClass3;
    else if (nClassLevel1 == nClassLevel2) nControlClass = nClass1;
    else if (nClassLevel1 == nClassLevel3) nControlClass = nClass1;
    else if (nClassLevel2 == nClassLevel3) nControlClass = nClass2;
    int nLevel = GetHitDice(oGetInfoFrom);
    int nLL = GetNumberOfLegendaryLevels(oGetInfoFrom);
    int nTotal = nLevel + nLL;
    string sClasses = COLOR_LT_BLUE2+GetClassName(nClass1)+COLOR_END+COLOR_WHITE+": "+IntToString(nClassLevel1)+COLOR_END;
    if (nClass2 != CLASS_TYPE_INVALID) sClasses += COLOR_WHITE+", "+COLOR_END+COLOR_LT_BLUE2+GetClassName(nClass2)+COLOR_END+COLOR_WHITE+": "+IntToString(nClassLevel2)+COLOR_END;
    if (nClass3 != CLASS_TYPE_INVALID) sClasses += COLOR_WHITE+", "+COLOR_END+COLOR_LT_BLUE2+GetClassName(nClass3)+COLOR_END+COLOR_WHITE+": "+IntToString(nClassLevel3)+COLOR_END;
    if (nLL) sClasses += COLOR_WHITE+", "+COLOR_END+COLOR_LT_BLUE2+LEGLEVEL+COLOR_END+COLOR_LT_BLUE+"["+GetClassName(nControlClass)+"]"+COLOR_END+COLOR_WHITE+": "+IntToString(nLL)+COLOR_END;
    if ((nClass2 != CLASS_TYPE_INVALID) || (nLL)) sClasses += COLOR_WHITE+", "+COLOR_END+COLOR_BLUE+NFOHD+COLOR_END+COLOR_WHITE+": "+IntToString(nTotal)+COLOR_END;
    string sDeity = GetDeity(oGetInfoFrom);
    if (sDeity == "") sDeity = NONE;
    int nGold = GetGold(oGetInfoFrom);
    int nGoldTotal, nValue, nX;
    object oItem = GetFirstItemInInventory(oGetInfoFrom);
    while (GetIsObjectValid(oItem))
    {
        nValue = GetGoldPieceValue(oItem);
        nGoldTotal += nValue;
        oItem = GetNextItemInInventory(oGetInfoFrom);
    }
    for (nX = 0; nX < 14; nX++)
    {
        oItem = GetItemInSlot(nX, oGetInfoFrom);
        nValue = GetGoldPieceValue(oItem);
        nGoldTotal += nValue;
    }
    nGoldTotal += nGold;
    string sSubrace = GetSubRace(oGetInfoFrom);
    if (sSubrace == "") sSubrace = NONE;
    int nXP = GetXP(oGetInfoFrom);
    int nNextXP = (( nLevel * ( nLevel + 1 )) / 2 * 1000 );
    int nXPForNextLevel = nNextXP - nXP;
    if (nLevel == 40) nXPForNextLevel = 0;
    string sArea = GetName(GetArea(oGetInfoFrom));
    string sFactionMembers = "";
    object oLeader = GetFactionLeader(oGetInfoFrom);
    object oMember = GetFirstFactionMember(oGetInfoFrom);
    while (GetIsObjectValid(oMember))
    {
        if (oMember == oLeader) sFactionMembers = COLOR_WHITE+GetName(oMember)+COLOR_END+COLOR_BLUE+" ["+LFG1+IntToString(GetNumberOfLegendaryLevels(oMember) + GetHitDice(oMember))+"] "+COLOR_END+COLOR_ORANGE+LEADER+COLOR_END+NEWLINE+sFactionMembers;
        else sFactionMembers = sFactionMembers+COLOR_WHITE+GetName(oMember)+COLOR_END+COLOR_BLUE+" ["+LFG1+IntToString(GetNumberOfLegendaryLevels(oMember) + GetHitDice(oMember))+"] "+COLOR_END+NEWLINE;
        oMember = GetNextFactionMember(oGetInfoFrom);
    }
    //combine
    string sMessage = COLOR_PURPLE+NFOHEADER+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+NFO1+COLOR_END+COLOR_WHITE+sName+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+NFO2+COLOR_END+COLOR_WHITE+sPlayername+COLOR_END+NEWLINE;
    sMessage += COLOR_PURPLE+NFO3+COLOR_END+COLOR_WHITE+sKey+COLOR_END+NEWLINE;
    if (VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer) || (oPlayer == oGetInfoFrom)) sMessage += COLOR_PURPLE+NFO4+COLOR_END+COLOR_WHITE+sIP+COLOR_END+NEWLINE;
    if (VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer) || (oPlayer == oGetInfoFrom) || (!GetLocalInt(oGetInfoFrom, "FKY_CHAT_ANON"))) sMessage += COLOR_PURPLE+NFO5+COLOR_END+sClasses+NEWLINE;
    if (VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer) || (oPlayer == oGetInfoFrom) || (!GetLocalInt(oGetInfoFrom, "FKY_CHAT_ANON"))) sMessage += COLOR_PURPLE+NFO6+COLOR_END+COLOR_YELLOW+IntToString(nXP)+COLOR_END+NEWLINE;
    if (VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer) || (oPlayer == oGetInfoFrom) || (!GetLocalInt(oGetInfoFrom, "FKY_CHAT_ANON"))) sMessage += COLOR_PURPLE+NFO7+COLOR_END+COLOR_RED+IntToString(nXPForNextLevel)+COLOR_END+NEWLINE;
    if (VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer) || (oPlayer == oGetInfoFrom) || (!GetLocalInt(oGetInfoFrom, "FKY_CHAT_ANON"))) sMessage += COLOR_PURPLE+NFO8+COLOR_END+COLOR_GREEN+sArea+COLOR_END+NEWLINE;
    if (VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer) || (oPlayer == oGetInfoFrom) || (!GetLocalInt(oGetInfoFrom, "FKY_CHAT_ANON"))) sMessage += COLOR_PURPLE+NFO9+COLOR_END+sFactionMembers;
    if (VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer) || (oPlayer == oGetInfoFrom)) sMessage += COLOR_PURPLE+NFO10+COLOR_END+COLOR_LT_BLUE+sDeity+COLOR_END+NEWLINE;
    if (VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer) || (oPlayer == oGetInfoFrom)) sMessage += COLOR_PURPLE+NFO11+COLOR_END+COLOR_LT_BLUE+sSubrace+COLOR_END+NEWLINE;
    if (VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer) || (oPlayer == oGetInfoFrom)) sMessage += COLOR_PURPLE+NFO12+COLOR_END+COLOR_GOLD+IntToString(nGold)+COLOR_END+NEWLINE;
    if (VerifyDMKey(oPlayer) || VerifyAdminKey(oPlayer) || (oPlayer == oGetInfoFrom)) sMessage += COLOR_PURPLE+NFO13+COLOR_END+COLOR_GOLD+IntToString(nGoldTotal)+COLOR_END+NEWLINE;
    SendMessageToPC(oPlayer, sMessage);
}

void GiveLevel(object oReceiver, object oDM, int nLevels, int nMessage = TRUE)
{
    int nHD = GetHitDice(oReceiver);
    if (nHD < 40)
    {
        int nTargetLevel = nHD+nLevels;
        if (nTargetLevel > 40) nTargetLevel = 40;
        int nTargetXP = (( nTargetLevel * ( nTargetLevel - 1 )) / 2 * 1000 );
        SetXP(oReceiver, nTargetXP);
        string sLevel = XP4;
        if (nLevels == 1) sLevel = XP5;
        if (nMessage) SendMessageToPC(oDM, COLOR_RED+XP6+IntToString(nLevels)+sLevel+XP7+GetName(oReceiver) + "."+COLOR_END);
    }
    else if (nMessage) SendMessageToPC(oDM, COLOR_RED+GetName(oReceiver)+XP3+COLOR_END);
}

void TakeLevel(object oLoser, object oDM, int nLevels, int nMessage = TRUE)
{
    int nHD = GetHitDice(oLoser);
    int nTargetLevel = nHD-nLevels;
    if (nTargetLevel < 1) nTargetLevel = 1;
    int nTargetXP = (( nTargetLevel * ( nTargetLevel - 1 )) / 2 * 1000 );
    SetXP(oLoser, nTargetXP);
    string sLevel = XP4;
    if (nLevels == 1) sLevel = XP5;
    if (nMessage) SendMessageToPC(oDM, COLOR_RED+XP8+IntToString(nLevels)+sLevel+XP10+GetName(oLoser) + "."+COLOR_END);
}

string GetColorStringForColumn(int nNum)
{
    string sReturn;
    switch(nNum)
    {
        case 1: sReturn = COLOR_RED; break;
        case 2: sReturn = COLOR_ORANGE; break;
        case 3: sReturn = COLOR_YELLOW; break;
        case 4: sReturn = COLOR_GREEN; break;
        case 5: sReturn = COLOR_BLUE; break;
        case 6: sReturn = COLOR_PURPLE; break;
    }
    return sReturn;
}

location VerifyLocation(object oPC, string sVLNormalCase)
{
    location lReturn = GetLocalLocation(oPC, "FKY_CHAT_LOCATION"); //have they already used the targeter?
    if (!GetIsObjectValid(GetAreaFromLocation(lReturn)))
    {
        FloatingTextStringOnCreature(COLOR_GOLD+REQUIRES_TARGET+COLOR_END, oPC, FALSE);//tell them
        SetLocalString(oPC, "FKY_CHAT_COMMAND", LOCATION_TARGET+"dm_" + sVLNormalCase);//mark them for the targeter
        if (!GetIsObjectValid(GetItemPossessedBy(oPC, "fky_chat_target"))) CreateItemOnObject("fky_chat_target", oPC);//give them a targeter if they need one
    }
    //else DeleteLocalLocation(oPC, "FKY_CHAT_LOCATION");//variable cleanup - done in individual commands
    return lReturn;
}

//return the target object, if invaild a validity check will return out of the chat script
object VerifyTarget(object oTarget, object oPC, string sVTNormalCase, string sCommandType = OBJECT_TARGET, int nPCOnly = TRUE, int nCreatureOnly = TRUE)//defaults to OBJECT_TARGET for object - no area object allowed; other option is AREA_TARGET_OK for area object allowed
{
    object oReturn = oTarget;
    if (!GetIsObjectValid(oReturn))//target verification - do they need to use the command targeter?
    {
        oReturn = GetLocalObject(oPC, "FKY_CHAT_TARGET"); //have they already used the targeter?
        if (!GetIsObjectValid(oReturn))
        {
            FloatingTextStringOnCreature(COLOR_GOLD+REQUIRES_TARGET+COLOR_END, oPC, FALSE);//tell them
            SetLocalString(oPC, "FKY_CHAT_COMMAND", sCommandType+"dm_" + sVTNormalCase);//mark them for the targeter
            if (!GetIsObjectValid(GetItemPossessedBy(oPC, "fky_chat_target"))) CreateItemOnObject("fky_chat_target", oPC);//give them a targeter if they need one
            return OBJECT_INVALID;
        }
        else DeleteLocalObject(oPC, "FKY_CHAT_TARGET");//variable cleanup
    }
    if (sCommandType == AREA_TARGET_OK)//failsafe check to ensure that if the command allows area targets it wiil ignore PCOnly and Creature only settings
    {
        nPCOnly = FALSE;
        nCreatureOnly = FALSE;
    }
    if (nPCOnly && (!GetIsPC(oReturn)))
    {
        FloatingTextStringOnCreature(COLOR_RED+PC_ONLY+COLOR_END, oPC, FALSE);
        return OBJECT_INVALID;
    }
    if (nCreatureOnly && (GetObjectType(oReturn) != OBJECT_TYPE_CREATURE))
    {
        FloatingTextStringOnCreature(COLOR_RED+CREATURE_ONLY+COLOR_END, oPC, FALSE);
        return OBJECT_INVALID;
    }
    return oReturn;
}


void SendMetaNotice(string sChannelName, string sMessage)
{
    string sText = COLOR_RED + sMessage + COLOR_END;//red
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC))
    {
        if (GetLocalString(oPC, "FKY_CHT_META_GRP") == sChannelName)
        {
            if (SEND_CHANNELS_TO_CHAT_LOG) SendChatLogMessage(oPC, sText, GetMessenger());
            else SendMessageToPC(oPC, sText);
        }
        oPC = GetNextPC();
    }
}
void SendMetaMessage(object oPlayer, string sChannelName, string sMessage)
{
    string sText = COLOR_PURPLE + GetName(oPlayer) + "(" + GetPCPlayerName(oPlayer) + "):"+COLOR_END+COLOR_ORANGE+"["+CHAN1+"] " + sMessage + COLOR_END;
    string sDMText = sText + COLOR_RED+" ("+CHAN2+": " + sChannelName + ")"+COLOR_END;
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC))
    {
        if (GetLocalString(oPC, "FKY_CHT_META_GRP") == sChannelName)
        {
            if (SEND_CHANNELS_TO_CHAT_LOG) SendChatLogMessage(oPC, sText, GetMessenger());
            else SendMessageToPC(oPC, sText);
        }
        if (DM_PLAYERS_HEAR_META)
        {
            if (VerifyDMKey(oPC) && (!GetIsDM(oPC)) && (GetLocalString(oPC, "FKY_CHT_META_GRP") != sChannelName) && (!GetLocalInt(oPC, "FKY_CHT_IGNOREMETA")))
            {
                if (SEND_CHANNELS_TO_CHAT_LOG) SendChatLogMessage(oPC, sDMText, GetMessenger());
                else SendMessageToPC(oPC, sDMText);
            }
        }
        if (DMS_HEAR_META)
        {
            if (VerifyDMKey(oPC) && GetIsDM(oPC) && (GetLocalString(oPC, "FKY_CHT_META_GRP") != sChannelName) && (!GetLocalInt(oPC, "FKY_CHT_IGNOREMETA")))
            {
                if (SEND_CHANNELS_TO_CHAT_LOG) SendChatLogMessage(oPC, sDMText, GetMessenger());
                else SendMessageToPC(oPC, sDMText);
            }
        }
        if (ADMIN_PLAYERS_HEAR_META)
        {
            if (VerifyAdminKey(oPC) && (!GetIsDM(oPC)) && (GetLocalString(oPC, "FKY_CHT_META_GRP") != sChannelName) && (!GetLocalInt(oPC, "FKY_CHT_IGNOREMETA")))
            {
                if (SEND_CHANNELS_TO_CHAT_LOG) SendChatLogMessage(oPC, sDMText, GetMessenger());
                else SendMessageToPC(oPC, sDMText);
            }
        }
        if (ADMIN_DMS_HEAR_META)
        {
            if (VerifyAdminKey(oPC) && GetIsDM(oPC) && (GetLocalString(oPC, "FKY_CHT_META_GRP") != sChannelName) && (!GetLocalInt(oPC, "FKY_CHT_IGNOREMETA")))
            {
                if (SEND_CHANNELS_TO_CHAT_LOG) SendChatLogMessage(oPC, sDMText, GetMessenger());
                else SendMessageToPC(oPC, sDMText);
            }
        }
        oPC = GetNextPC();
    }
}
void DisbandMetaChannel(object oPlayer)
{
    string sText = COLOR_RED + GetName(oPlayer) +METADBND+COLOR_END;//red
    string sChannelName = GetPCPlayerName(oPlayer);
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC))
    {
        if (GetLocalString(oPC, "FKY_CHT_META_GRP") == sChannelName)
        {
        SendMessageToPC(oPC, sText);//tell them
        DeleteLocalString(oPC, "FKY_CHT_META_GRP");//remove them
        }
        oPC = GetNextPC();
    }
}
void ListMetaMembers(object oPlayer)
{
    string sText = COLOR_RED+METAMEMB+COLOR_END+NEWLINE;//red
    string sAdd;
    string sChannelName = GetLocalString(oPlayer, "FKY_CHT_META_GRP");
    if (sChannelName != "")
    {
        object oPC = GetFirstPC();
        while (GetIsObjectValid(oPC))
        {
            if (GetLocalString(oPC, "FKY_CHT_META_GRP") == sChannelName)
            {
                sAdd = COLOR_RED + GetName(oPC) + "(" + GetPCPlayerName(oPC) + ")"+COLOR_END+NEWLINE;
                sText += sAdd;
            }
            oPC = GetNextPC();
        }
        SendMessageToPC(oPlayer, sText);
    }
    else SendMessageToPC(oPlayer, COLOR_RED+METABAD+COLOR_END);
}
void CheckIfNewChannel(string sChannel)
{
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC))
    {
        if (GetPCPlayerName(oPC) == sChannel)//if the channel is named after them
        {
            if (GetLocalString(oPC, "FKY_CHT_META_GRP") == "")//and they are not in it
            {
                SetLocalString(oPC, "FKY_CHT_META_GRP", sChannel);//then its a new channel, add them to the channel
            }
            break;
        }
        oPC = GetNextPC();
    }
}


void CommandRedirect(object oSpeaker, int nMenu, string sMessage = BADCOMMAND, string sColor = COLOR_RED)
{
    if (sMessage != "") FloatingTextStringOnCreature(sColor+sMessage+COLOR_END, oSpeaker, FALSE);
    if (!USING_LINUX) return;//command redirect only works for Linux users
    string sMenu;
    switch (nMenu)
    {
        case -1: sMenu = "chat_com"; break;
        case 1: sMenu = "chat_com"; break;
        case 2: sMenu = "chat_com_char"; break;
        case 3: sMenu = "chat_com_dice"; break;
        case 4: sMenu = "chat_com_item"; break;
        case 5: sMenu = "chat_com_lang"; break;
        case 6: sMenu = "chat_com_list"; break;
        case 7: sMenu = "chat_com_meta"; break;
        case 8: sMenu = "chat_com_social"; break;
        case 9: sMenu = "chat_lang"; break;
        case 11: sMenu = "chat_dm"; break;
        case 12: sMenu = "chat_dm_play"; break;
        case 13: sMenu = "chat_dm_play_aaa"; break;
        case 14: sMenu = "chat_dm_play_ali"; break;
        case 15: sMenu = "chat_dm_play_ava"; break;
        case 16: sMenu = "chat_dm_play_ban"; break;
        case 17: sMenu = "chat_dm_play_ite"; break;
        case 18: sMenu = "chat_dm_play_tel"; break;
        case 19: sMenu = "chat_dm_play_xp"; break;
        case 20: sMenu = "chat_dm_serv"; break;
        case 21: sMenu = "chat_dm_serv_tim"; break;
        case 22: sMenu = "chat_dm_serv_var"; break;
        case 23: sMenu = "chat_dm_creat"; break;
        case 24: sMenu = "chat_dm_creat_fa"; break;
        case 25: sMenu = "chat_dm_fx"; break;
        case 26: sMenu = "chat_dm_chat"; break;
        case 27: sMenu = "chat_dm_chat_ign"; break;
        case 43: sMenu = "chat_dm_fx_dur"; break;
        case 44: sMenu = "chat_dm_fx_es"; break;
    }
    SetLocalInt(oSpeaker, "FKY_CHAT_CONVONUMBER", nMenu);
    AssignCommand(oSpeaker, ClearAllActions(TRUE));
    AssignCommand(oSpeaker, ActionStartConversation(oSpeaker, sMenu, TRUE, FALSE));
}

//                         oPC          oTarget          sText       nChannel
void HandleCommands(object oCPC, object oCTarget, string sCText, int nCChannel)
{
        string sSort, sTarget, sPlayer, sInvite, sKey, sNormalCase;
        int nText, nCount, nPos, nLang, nCheck;
        object oItem;
        location lLoc;
        SetLocalString(oCPC, "NWNX!CHAT!SUPRESS", "1");//suppress command speech no matter what, helps avoid circumvention of shout ban
        if (!GetIsDead(oCPC))
        {
            sNormalCase = GetStringRight(sCText, GetStringLength(sCText) - 1); //preserve caps for setname command
            sCText = GetStringLowerCase(sNormalCase);  //case insensitive
            WriteTimestampedLogEntry(sCText);
            sSort = GetStringLeft(sCText, 1);
            nText = FindSubString("a d h i l m p s t u w", sSort);
            switch (nText)       //0 2 4 6 8 101214161820
            {
                case -1: CommandRedirect(oCPC, 1); break;
    /*a*/       case 0:
                if (sCText ==  "anon")
                {
                    SetLocalInt(oCPC, "FKY_CHAT_ANON", 1);
                    SendMessageToPC(oCPC, COLOR_RED+ANON+COLOR_END);
                }
                else if (GetStringLeft(sCText, 2) == "an") CommandRedirect(oCPC, 2);
                else CommandRedirect(oCPC, 1);
                break;
    /*d*/       case 2:
                if (GetStringLeft(sCText, 6) == "delete")
                {
                    if (!GetIsObjectValid(oCTarget))//target verification - do they need to use the command targeter?
                    {
                        oCTarget = GetLocalObject(oCPC, "FKY_CHAT_TARGET"); //have they already used the targeter?
                        if (!GetIsObjectValid(oCTarget))
                        {
                            FloatingTextStringOnCreature(COLOR_GOLD+REQUIRES_TARGET+COLOR_END, oCPC, FALSE);//tell them
                            SetLocalString(oCPC, "FKY_CHAT_COMMAND", OBJECT_TARGET+COMMAND_SYMBOL + sNormalCase);//mark them for the targeter
                            if (!GetIsObjectValid(GetItemPossessedBy(oCPC, "fky_chat_target"))) CreateItemOnObject("fky_chat_target", oCPC);//give them a targeter if they need one
                            return;
                        }
                        else DeleteLocalObject(oCPC, "FKY_CHAT_TARGET");//variable cleanup
                    }
                    nCount = GetLocalInt(oCTarget, "FKY_CHAT_DELETE_CONFIRM");
                    if (nCount == 1)
                    {
                        if (GetIsPC(oCTarget))
                        {
                            if (GetStringRight(sCText, 8) == GetStringLowerCase(GetPCPublicCDKey(oCTarget)))
                            {
                                ExportSingleCharacter(oCTarget);//export needed to ensure this .bic is the most recently edited
                                if (SAFE_DELETE) DelayCommand(4.0, SafeDeleteBic(oCTarget));
                                else DelayCommand(4.0, AssignCommand(GetModule(), DeleteBic(oCTarget)));
                                FloatingTextStringOnCreature(COLOR_RED+LETO_DELETE+COLOR_END, oCPC, FALSE);
                            }
                            else FloatingTextStringOnCreature(COLOR_RED+DISCONFIRM+COLOR_END, oCPC, FALSE);
                        }
                        else FloatingTextStringOnCreature(COLOR_RED+PC_ONLY+COLOR_END, oCPC, FALSE);
                    }
                    else if (sCText ==  "delete")
                    {
                        if (VAULTPATH_CHAT != "")//check if vault specified, command error otherwise
                        {
                            //check permission
                            nPos = (oCPC == oCTarget);//self-targeted?
                            if ((PLAYERS_CAN_DELETE && nPos) || (DMS_CAN_DELETE && VerifyDMKey(oCPC)) || VerifyAdminKey(oCPC))
                            {
                                if (GetIsPC(oCTarget))
                                {
                                    if ((VerifyDMKey(oCTarget) || VerifyAdminKey(oCTarget)) && (!nPos)) FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oCPC, FALSE);
                                    else
                                    {
                                        SetLocalInt(oCTarget, "FKY_CHAT_DELETE_CONFIRM", 1);
                                        FloatingTextStringOnCreature(COLOR_RED+CONFIRM_DELETE+COMMAND_SYMBOL+CONFIRM_DELETE2+COLOR_END, oCPC, FALSE);
                                    }
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+PC_ONLY+COLOR_END, oCPC, FALSE);
                            }
                            else CommandRedirect(oCPC, 1);
                        //check process
                        }
                        else CommandRedirect(oCPC, 1);
                    }
                    else CommandRedirect(oCPC, 1);
                }
                else if (GetStringLeft(sCText, 2) == "de") CommandRedirect(oCPC, 2);
                else
                {
                    nText = FindSubString("d4 d6 d8 d10 d12 d20 d100", sCText);
                    switch (nText)       //0  3  6  9   13  17  21
                    {
                        case -1:
                        if (TestStringAgainstPattern("*n", GetSubString(sCText, 1, 1))) CommandRedirect(oCPC, 3);
                        else CommandRedirect(oCPC, 1);
                        break;
                        case 0: RollDie(oCPC, 4); break;
                        case 3: RollDie(oCPC, 6); break;
                        case 6: RollDie(oCPC, 8); break;
                        case 9: RollDie(oCPC, 10); break;
                        case 13: RollDie(oCPC, 12); break;
                        case 17: RollDie(oCPC, 20); break;
                        case 21: RollDie(oCPC, 100); break;
                    }
                }
                break;
    /*h*/       case 4:
                if (sCText ==  "help") ListHelp(oCPC);
                else CommandRedirect(oCPC, 6);
                break;
    /*i*/       case 6:
                if (sCText == "ignore")
                {
                    if (!GetIsObjectValid(oCTarget))//target verification - do they need to use the command targeter?
                    {
                        oCTarget = GetLocalObject(oCPC, "FKY_CHAT_TARGET"); //have they already used the targeter?
                        if (!GetIsObjectValid(oCTarget))
                        {
                            FloatingTextStringOnCreature(COLOR_GOLD+REQUIRES_TARGET+COLOR_END, oCPC, FALSE);//tell them
                            SetLocalString(oCPC, "FKY_CHAT_COMMAND", OBJECT_TARGET+COMMAND_SYMBOL + sNormalCase);//mark them for the targeter
                            if (!GetIsObjectValid(GetItemPossessedBy(oCPC, "fky_chat_target"))) CreateItemOnObject("fky_chat_target", oCPC);//give them a targeter if they need one
                            return;
                        }
                        else DeleteLocalObject(oCPC, "FKY_CHAT_TARGET");//variable cleanup
                    }
                    //if (((nCChannel == 4) ||(nCChannel == 20)) && GetIsObjectValid(oCTarget))//can now target with command targeter
                    if (GetIsPC(oCTarget))
                    {
                        if ((!VerifyDMKey(oCTarget)) && (!VerifyAdminKey(oCTarget)))//can't ignore DMs or Admins
                        {
                            if (oCPC != oCTarget)
                            {
                                sTarget = GetPCPlayerName(oCTarget);
                                if (GetLocalInt(oCPC, "FKY_CHT_IGNORE" + sTarget) == FALSE)
                                {
                                    sPlayer = GetPCPlayerName(oCPC);
                                    SetLocalInt(oCPC, "FKY_CHT_IGNORE" + sTarget, TRUE);//ignore list stored on PC ignoring
                                    SendMessageToPC(oCPC, COLOR_RED+IGNORE3+ sTarget + "."+COLOR_END);
                                    SendMessageToPC(oCTarget, COLOR_RED + sPlayer +IGNORE4+COLOR_END);
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+IGNORE5+ sTarget + "!"+COLOR_END, oCPC, FALSE);
                            }
                            else FloatingTextStringOnCreature(COLOR_RED+IGNORE6+COLOR_END, oCPC, FALSE);
                        }
                        else FloatingTextStringOnCreature(COLOR_RED+IGNORE7+COLOR_END, oCPC, FALSE);
                    }
                    else FloatingTextStringOnCreature(COLOR_RED+PC_ONLY+COLOR_END, oCPC, FALSE);
                    //else FloatingTextStringOnCreature(COLOR_RED+IGNORE8+COLOR_END, oCPC, FALSE);
                }
                else if (GetStringLeft(sCText, 2) == "ig") CommandRedirect(oCPC, 8);
                else CommandRedirect(oCPC, 1);
                break;
    /*l*/       case 8:
                if (sCText ==  "lfg")
                {
                    if (GetLocalInt(oCPC, "FKY_CHT_BANSHOUT") || GetLocalInt(oCPC, "FKY_CHT_BANDM"))//if they've been muted from either channel they can only use this 3 times, to avoid circumventing
                    {
                        nCount = GetLocalInt(oCPC, "FKY_CHT_LFG");
                        if (nCount > 2)
                        {
                            SendMessageToPC(oCPC, COLOR_RED+USES_3+COLOR_END);
                        }
                        else
                        {
                            nCount++;
                            SetLocalInt(oCPC, "FKY_CHT_LFG", nCount);
                            SpeakString(LFG1+ IntToString(GetNumberOfLegendaryLevels(OBJECT_SELF)+ GetHitDice(OBJECT_SELF))+LFG2, TALKVOLUME_SHOUT);
                        }
                    }
                    else
                    {
                        SpeakString(LFG1+ IntToString(GetNumberOfLegendaryLevels(OBJECT_SELF)+ GetHitDice(OBJECT_SELF))+LFG2, TALKVOLUME_SHOUT);
                    }
                }
                else if (GetStringLeft(sCText, 2) == "lf") CommandRedirect(oCPC, 8);
                else if (GetStringLeft(sCText, 4) == "list")
                {
                    if (sCText ==  "list emotes") ListEmotes(oCPC);
                    else if (sCText ==  "list commands") ListCommands(oCPC);
                    else if (sCText ==  "list ignored") ListIgnored(oCPC);
                    else if (sCText == "list languages")
                    {
                        if (ENABLE_LANGUAGES) ListLanguages(oCPC);
                        else CommandRedirect(oCPC, 1);
                    }
                    else if (sCText == "list alllanguages")
                    {
                        if (ENABLE_LANGUAGES && (ENABLE_FULL_LANGUAGE_LIST_FOR_PLAYERS || VerifyDMKey(oCPC) || VerifyAdminKey(oCPC))) ListAllLanguages(oCPC);
                        else CommandRedirect(oCPC, 1);
                    }
                    else CommandRedirect(oCPC, 6);
                }
                else if (GetStringLeft(sCText, 2) == "li") CommandRedirect(oCPC, 6);
                else CommandRedirect(oCPC, 1);
                break;
    /*m*/       case 10://metachannels
                if ((GetStringLeft(sCText, 4) == "meta") && ENABLE_METACHANNELS)
                {
                    sCText = GetStringRight(sCText, GetStringLength(sCText) - 4);
                    nText = FindSubString("accept decline disband invite kick leave list", sCText);
                    switch (nText)       //0      7       15      23     30   35    41
                    {                    //                      (tell) (tell)
                    case -1: CommandRedirect(oCPC, 7); break;
                    case 0://accept
                    if (GetLocalString(oCPC, "FKY_CHT_META_GRP") == "")//They are not in a metagroup
                    {
                        sInvite = GetLocalString(oCPC, "FKY_CHT_META_INV");
                        if (sInvite != "")
                        {
                            CheckIfNewChannel(sInvite);//if it's a new channel this adds the inviter
                            SetLocalString(oCPC, "FKY_CHT_META_GRP", sInvite);//add them to the channel
                            sKey = COLOR_ORANGE+META1+COLOR_END;
                            FloatingTextStringOnCreature(sInvite, oCPC, FALSE);
                            SendMetaNotice(sInvite, GetName(oCPC)+META2);
                        }
                        else SendMessageToPC(oCPC, COLOR_RED+META3+COLOR_END);
                    }
                    else SendMessageToPC(oCPC, COLOR_RED+META4+COLOR_END);
                    break;
                    case 7://decline
                    sInvite = GetLocalString(oCPC, "FKY_CHT_META_INV");
                    if (sInvite != "")
                    {
                        DeleteLocalString(oCPC, "FKY_CHT_META_INV");//clear the invite
                        sKey = COLOR_ORANGE+META5+COLOR_END;
                        SendMetaNotice(sInvite, GetName(oCPC)+META6);
                        FloatingTextStringOnCreature(sInvite, oCPC, FALSE);
                    }
                    else SendMessageToPC(oCPC, COLOR_RED+META3+COLOR_END);
                    break;
                    case 15://disband
                    if (GetLocalString(oCPC, "FKY_CHT_META_GRP") == GetPCPlayerName(oCPC)) DisbandMetaChannel(oCPC); break;//only the leader can disband
                    case 23://invite
                    //if ((nCChannel == 4) || (nCChannel == 20))//must invite in tell channel//can now invite with command targeter
                    //{
                        sKey = GetLocalString(oCPC, "FKY_CHT_META_GRP");
                        if (sKey == "") sKey = GetPCPlayerName(oCPC);//they are not in a metagroup and are attempting to start one as the leader
                        if (!GetIsObjectValid(oCTarget))//target verification - do they need to use the command targeter?
                        {
                            oCTarget = GetLocalObject(oCPC, "FKY_CHAT_TARGET"); //have they already used the targeter?
                            if (!GetIsObjectValid(oCTarget))
                            {
                                FloatingTextStringOnCreature(COLOR_GOLD+REQUIRES_TARGET+COLOR_END, oCPC, FALSE);//tell them
                                SetLocalString(oCPC, "FKY_CHAT_COMMAND", OBJECT_TARGET+COMMAND_SYMBOL + sNormalCase);//mark them for the targeter
                                if (!GetIsObjectValid(GetItemPossessedBy(oCPC, "fky_chat_target"))) CreateItemOnObject("fky_chat_target", oCPC);//give them a targeter if they need one
                                return;
                            }
                            else DeleteLocalObject(oCPC, "FKY_CHAT_TARGET");//variable cleanup
                        }
                        if (GetIsPC(oCTarget))
                        {
                            if (GetLocalString(oCTarget, "FKY_CHT_META_GRP") == "")//They are not in a metagroup
                            {
                                sInvite = COLOR_ORANGE+META7+ GetPCPlayerName(oCPC) + "!"+COLOR_END;
                                FloatingTextStringOnCreature(sInvite, oCTarget, FALSE);
                                SetLocalString(oCTarget, "FKY_CHT_META_INV", sKey);//will overwrite last invite
                                sInvite = COLOR_ORANGE+META8+COLOR_END;
                                FloatingTextStringOnCreature(sInvite, oCPC, FALSE);
                            }
                            else //they are already in a Metagroup
                            {
                                sInvite = COLOR_ORANGE + GetName(oCTarget) +META9+COLOR_END;
                                FloatingTextStringOnCreature(sInvite, oCPC, FALSE);
                            }
                        }
                        else FloatingTextStringOnCreature(COLOR_RED+PC_ONLY+COLOR_END, oCPC, FALSE);
                    //}
                    //else FloatingTextStringOnCreature(COLOR_RED+META10+COLOR_END, oCPC, FALSE);
                    break;
                    case 30://kick
                    //if ((nCChannel == 4) || (nCChannel == 20))//must kick in tell channel//can now target with command targeter
                    //{
                        sKey = GetPCPlayerName(oCPC);
                        if (GetLocalString(oCPC, "FKY_CHT_META_GRP") == sKey)//only leader can kick
                        {
                            if (!GetIsObjectValid(oCTarget))//target verification - do they need to use the command targeter?
                            {
                                oCTarget = GetLocalObject(oCPC, "FKY_CHAT_TARGET"); //have they already used the targeter?
                                if (!GetIsObjectValid(oCTarget))
                                {
                                    FloatingTextStringOnCreature(COLOR_GOLD+REQUIRES_TARGET+COLOR_END, oCPC, FALSE);//tell them
                                    SetLocalString(oCPC, "FKY_CHAT_COMMAND", OBJECT_TARGET+COMMAND_SYMBOL + sNormalCase);//mark them for the targeter
                                    if (!GetIsObjectValid(GetItemPossessedBy(oCPC, "fky_chat_target"))) CreateItemOnObject("fky_chat_target", oCPC);//give them a targeter if they need one
                                    return;
                                }
                                else DeleteLocalObject(oCPC, "FKY_CHAT_TARGET");//variable cleanup
                            }
                            if (GetIsPC(oCTarget))
                            {
                                if (GetLocalString(oCTarget, "FKY_CHT_META_GRP") == sKey)
                                {
                                    DeleteLocalString(oCTarget, "FKY_CHT_META_GRP");//kick them
                                    sInvite = COLOR_ORANGE+META11+COLOR_END;
                                    FloatingTextStringOnCreature(sInvite, oCTarget, FALSE);
                                    SendMetaNotice(sKey, GetName(oCTarget)+META12);
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+META13+ GetName(oCTarget) +META14+COLOR_END, oCPC, FALSE);
                            }
                            else FloatingTextStringOnCreature(COLOR_RED+PC_ONLY+COLOR_END, oCPC, FALSE);
                        }
                        else FloatingTextStringOnCreature(COLOR_RED+META15+COLOR_END, oCPC, FALSE);
                    //}
                    //else FloatingTextStringOnCreature(COLOR_RED+META16+COLOR_END, oCPC, FALSE);
                    break;
                    case 35://leave
                    sKey = GetLocalString(oCPC, "FKY_CHT_META_GRP");
                    if (sKey != "")
                    {
                        DeleteLocalString(oCPC, "FKY_CHT_META_GRP");//leave group
                        sInvite = COLOR_ORANGE+META17+COLOR_END;
                        FloatingTextStringOnCreature(sInvite, oCPC, FALSE);
                        SendMetaNotice(sKey, GetName(oCPC)+META18);
                    }
                    else SendMessageToPC(oCPC, COLOR_RED+METABAD+COLOR_END);
                    break;
                    case 41: ListMetaMembers(oCPC); break;//list
                    }
                }
                else if (GetStringLeft(sCText, 2) == "me") CommandRedirect(oCPC, 7);
                else CommandRedirect(oCPC, 1);
                break;
    /*p*/       case 12:
                if (sCText == "partyroll") DoPartyRoll(oCPC);
                else if (GetStringLeft(sCText, 2) == "pa") CommandRedirect(oCPC, 3);
                else if (sCText == "playerinfo")
                {
                    if (!GetIsObjectValid(oCTarget))//target verification - do they need to use the command targeter?
                    {
                        oCTarget = GetLocalObject(oCPC, "FKY_CHAT_TARGET"); //have they already used the targeter?
                        if (!GetIsObjectValid(oCTarget))
                        {
                            FloatingTextStringOnCreature(COLOR_GOLD+REQUIRES_TARGET+COLOR_END, oCPC, FALSE);//tell them
                            SetLocalString(oCPC, "FKY_CHAT_COMMAND", OBJECT_TARGET+COMMAND_SYMBOL + sNormalCase);//mark them for the targeter
                            if (!GetIsObjectValid(GetItemPossessedBy(oCPC, "fky_chat_target"))) CreateItemOnObject("fky_chat_target", oCPC);//give them a targeter if they need one
                            return;
                        }
                        else DeleteLocalObject(oCPC, "FKY_CHAT_TARGET");//variable cleanup
                    }
                    //if ((nCChannel == 4) || (nCChannel == 20))//can now target with the command targeter
                    if (GetIsPC(oCTarget))
                    {
                        ShowInfo(oCPC, oCTarget);
                    }
                    else FloatingTextStringOnCreature(COLOR_RED+PC_ONLY+COLOR_END, oCPC, FALSE);
                    //else FloatingTextStringOnCreature(COLOR_RED+NFO14+COLOR_END, oCPC, FALSE);
                }
                else if (GetStringLeft(sCText, 2) == "pl") CommandRedirect(oCPC, 2);
                else CommandRedirect(oCPC, 1);
                break;
    /*s*/       case 14:
                if (ENABLE_LANGUAGES && (GetStringLeft(sCText, 6) == "speak "))
                {
                    sCText = GetStringRight(sCText, GetStringLength(sCText) - 6);
                    nText = GetLanguageNumber(sCText);
                    if (nText == -1) FloatingTextStringOnCreature(COLOR_RED+LANG1+COLOR_END, oCPC, FALSE);
                    else if (nText == 109)//revert to speaking common
                    {
                        nLang = GetLocalInt(oCPC, "FKY_CHT_SPEAKING");//what they were speaking
                        if (nLang)
                        {
                            DeleteLocalInt(oCPC, "FKY_CHT_SPEAKING");
                            SendMessageToPC(oCPC, COLOR_RED+SPEAK1+ GetNameOfLanguage(nLang) + "."+COLOR_END);
                        }
                        else SendMessageToPC(oCPC, COLOR_RED+SPEAK2+COLOR_END);
                    }
                    else //set them to speak the language from that point on if they are able to
                    {
                        nLang = GetLocalInt(oCPC, "FKY_CHT_SPEAKING");//what they were speaking
                        if (nLang == nText) SendMessageToPC(oCPC, COLOR_RED+SPEAK3+ GetNameOfLanguage(nLang) + "!"+COLOR_END);
                        else if (GetLocalInt(oCPC, "FKY_CHAT_LANG" + IntToString(nText)))//can they speak it?
                        {
                            SetLocalInt(oCPC, "FKY_CHT_SPEAKING", nText);
                            SendMessageToPC(oCPC, COLOR_RED+SPEAK4+ GetNameOfLanguage(nText)+SPEAK5+GetNameOfLanguage(nLang) + "."+COLOR_END);
                        }
                        else SendMessageToPC(oCPC, COLOR_RED+SPEAK6+ GetNameOfLanguage(nText) + "!"+COLOR_END);
                    }
                }
                else if (ENABLE_LANGUAGES && (GetStringLeft(sCText, 2) == "sp")) CommandRedirect(oCPC, 5);
                else if ((ENABLE_PLAYER_SETNAME || VerifyDMKey(oCPC) || VerifyAdminKey(oCPC))&& (GetStringLeft(sCText, 8) == "setname "))
                {
                    oCTarget = GetLocalObject(oCPC, "FKY_CHAT_TARGET"); //have they already used the targeter?
                    if (!GetIsObjectValid(oCTarget))
                    {
                        FloatingTextStringOnCreature(COLOR_GOLD+REQUIRES_TARGET2+COLOR_END, oCPC, FALSE);//tell them
                        SetLocalString(oCPC, "FKY_CHAT_COMMAND", ITEM_TARGET+COMMAND_SYMBOL + sNormalCase);//mark them for the targeter
                        if (!GetIsObjectValid(GetItemPossessedBy(oCPC, "fky_chat_target"))) CreateItemOnObject("fky_chat_target", oCPC);//give them a targeter if they need one
                        return;
                    }
                    else DeleteLocalObject(oCPC, "FKY_CHAT_TARGET");//variable cleanup
                    sCText = GetStringRight(sNormalCase, GetStringLength(sCText) - 8);//switch in the normal case - they are the same length atm
                    //nPos = FindSubString(sCText, "@");
                    //sSort = GetStringLeft(sCText, nPos);
                    //sCText = GetStringRight(sCText, GetStringLength(sCText) - (nPos+1));
                    //oItem = GetFirstItemInInventory(oCPC);
                    //while (GetIsObjectValid(oItem) && (nCheck != 1))
                    //{
                    //    if (GetName(oItem) == sSort)
                    //    {
                            /*DelayCommand(0.1, */SetName(oCTarget, sCText);//);
                    //        nCheck = 1;
                    //    }
                    //    oItem = GetNextItemInInventory(oCPC);
                    //}
                }
                else if ((ENABLE_PLAYER_SETNAME || VerifyDMKey(oCPC) || VerifyAdminKey(oCPC))&& (GetStringLeft(sCText, 11) == "setnameall "))
                {
                    oCTarget = GetLocalObject(oCPC, "FKY_CHAT_TARGET"); //have they already used the targeter?
                    if (!GetIsObjectValid(oCTarget))
                    {
                        FloatingTextStringOnCreature(COLOR_GOLD+REQUIRES_TARGET2+COLOR_END, oCPC, FALSE);//tell them
                        SetLocalString(oCPC, "FKY_CHAT_COMMAND", ITEM_TARGET+COMMAND_SYMBOL + sNormalCase);//mark them for the targeter
                        if (!GetIsObjectValid(GetItemPossessedBy(oCPC, "fky_chat_target"))) CreateItemOnObject("fky_chat_target", oCPC);//give them a targeter if they need one
                        return;
                    }
                    else DeleteLocalObject(oCPC, "FKY_CHAT_TARGET");//variable cleanup
                    sCText = GetStringRight(sNormalCase, GetStringLength(sCText) - 11);
                    //nPos = FindSubString(sCText, "@");
                    sSort = GetName(oCTarget);
                    //sCText = GetStringRight(sCText, GetStringLength(sCText) - (nPos+1));
                    oItem = GetFirstItemInInventory(oCPC);
                    while (GetIsObjectValid(oItem))
                    {
                        if (GetName(oItem) == sSort)
                        {
                            DelayCommand(0.1, SetName(oItem, sCText));
                        }
                        oItem = GetNextItemInInventory(oCPC);
                    }
                }
                else if ((ENABLE_PLAYER_SETNAME || VerifyDMKey(oCPC) || VerifyAdminKey(oCPC))&& (GetStringLeft(sCText, 4) == "setn")) CommandRedirect(oCPC, 4);
                else if ((ENABLE_PLAYER_SETTAILWINGS || VerifyDMKey(oCPC) || VerifyAdminKey(oCPC))&& (GetStringLeft(sCText, 8) == "settail "))
                {
                    sCText = GetStringRight(sCText, GetStringLength(sCText) - 8);
                    nPos = StringToInt(sCText);
                    if (TestStringAgainstPattern("*n", sCText))
                    {
                        if (!GetIsObjectValid(oCTarget))//target verification - do they need to use the command targeter?
                        {
                            oCTarget = GetLocalObject(oCPC, "FKY_CHAT_TARGET"); //have they already used the targeter?
                            if (!GetIsObjectValid(oCTarget))
                            {
                                FloatingTextStringOnCreature(COLOR_GOLD+REQUIRES_TARGET+COLOR_END, oCPC, FALSE);//tell them
                                SetLocalString(oCPC, "FKY_CHAT_COMMAND", OBJECT_TARGET+COMMAND_SYMBOL + sNormalCase);//mark them for the targeter
                                if (!GetIsObjectValid(GetItemPossessedBy(oCPC, "fky_chat_target"))) CreateItemOnObject("fky_chat_target", oCPC);//give them a targeter if they need one
                                return;
                            }
                            else DeleteLocalObject(oCPC, "FKY_CHAT_TARGET");//variable cleanup
                        }
                        if (GetIsPC(oCTarget))
                        {
                            if ((!VerifyDMKey(oCTarget)) && (!VerifyAdminKey(oCTarget)) || (oCTarget == oCPC)) SetCreatureTailType(nPos, oCTarget);
                            else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oCPC, FALSE);
                        }
                        else FloatingTextStringOnCreature(COLOR_RED+PC_ONLY+COLOR_END, oCPC, FALSE);
                    }
                    else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oCPC);
                }
                else if ((ENABLE_PLAYER_SETTAILWINGS || VerifyDMKey(oCPC) || VerifyAdminKey(oCPC))&& (GetStringLeft(sCText, 9) == "setwings "))
                {
                    sCText = GetStringRight(sCText, GetStringLength(sCText) - 9);
                    nPos = StringToInt(sCText);
                    if (TestStringAgainstPattern("*n", sCText))
                    {
                        if (!GetIsObjectValid(oCTarget))//target verification - do they need to use the command targeter?
                        {
                            oCTarget = GetLocalObject(oCPC, "FKY_CHAT_TARGET"); //have they already used the targeter?
                            if (!GetIsObjectValid(oCTarget))
                            {
                                FloatingTextStringOnCreature(COLOR_GOLD+REQUIRES_TARGET+COLOR_END, oCPC, FALSE);//tell them
                                SetLocalString(oCPC, "FKY_CHAT_COMMAND", OBJECT_TARGET+COMMAND_SYMBOL + sNormalCase);//mark them for the targeter
                                if (!GetIsObjectValid(GetItemPossessedBy(oCPC, "fky_chat_target"))) CreateItemOnObject("fky_chat_target", oCPC);//give them a targeter if they need one
                                return;
                            }
                            else DeleteLocalObject(oCPC, "FKY_CHAT_TARGET");//variable cleanup
                        }
                        if (GetIsPC(oCTarget))
                        {
                            if ((!VerifyDMKey(oCTarget)) && (!VerifyAdminKey(oCTarget)) || (oCTarget == oCPC)) SetCreatureWingType(nPos, oCTarget);
                            else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oCPC, FALSE);
                        }
                        else FloatingTextStringOnCreature(COLOR_RED+PC_ONLY+COLOR_END, oCPC, FALSE);
                    }
                    else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oCPC);
                }
                else if ((ENABLE_PLAYER_SETTAILWINGS || VerifyDMKey(oCPC) || VerifyAdminKey(oCPC))&& (GetStringLeft(sCText, 3) == "set")) CommandRedirect(oCPC, 2);
                else if (GetStringLeft(sCText, 11) == "skillcheck ")//!skillcheck 5 50
                {
                    sCText = GetStringRight(sCText, GetStringLength(sCText) - 11);
                    nPos = FindSubString(sCText, " ");
                    sSort = GetStringLeft(sCText, nPos);
                    sCText = GetStringRight(sCText, GetStringLength(sCText) - (nPos+1));
                    if ((!TestStringAgainstPattern("*n", sSort)) ||  (!TestStringAgainstPattern("*n", sCText))) FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oCPC, FALSE);
                    else DoSkillCheck(oCPC, StringToInt(sSort), StringToInt(sCText));
                }
                else if (sCText == "skillslist")
                {
                    sCText = "";
                    for (nPos = 0; nPos < 27; nPos++)
                    {
                        sCText += IntToString(nPos) + ": " + GetSkillName(nPos) + NEWLINE;
                    }
                    SendMessageToPC(oCPC, sCText);
                }
                else if (GetStringLeft(sCText, 2) == "sk") CommandRedirect(oCPC, 3);
                else CommandRedirect(oCPC, 1);
                break;
    /*t*/       case 16:
                if (sCText ==  "target")
                {
                    sSort = GetLocalString(oCPC, "FKY_CHAT_COMMAND");
                    if (sSort != "")
                    {
                        if (nCChannel == 4 || nCChannel == 20) //must be sent in tell
                        {
                            if (GetIsObjectValid(oCTarget))
                            {
                                sKey = GetStringLeft(sSort, 1);
                                sSort = GetStringRight(sSort, GetStringLength(sSort) - 1);
                                if (sKey == AREA_TARGET_OK ||
                                    sKey == OBJECT_TARGET)
                                {
                                    SetLocalObject(oCPC, "FKY_CHAT_TARGET", oCTarget);
                                    DeleteLocalString(oCPC, "FKY_CHAT_COMMAND");
                                    SetLocalString(oCPC, "FKY_CHAT_COMMAND_EXE", sSort);//set the command to speak on them
                                    DelayCommand(0.1, ExecuteScript("fky_chat_command", oCPC));//this ensures the spoken string fires the chat script again
                                }
                                else if (sKey == LOCATION_TARGET)
                                {
                                    lLoc = GetLocation(oCTarget);
                                    if (GetIsObjectValid(GetAreaFromLocation(lLoc)))
                                    {
                                        SetLocalLocation(oCPC, "FKY_CHAT_LOCATION", lLoc);
                                        DeleteLocalString(oCPC, "FKY_CHAT_COMMAND");//here we only delete if they selected a valid location - otherwise propmpt for retry
                                        SetLocalString(oCPC, "FKY_CHAT_COMMAND_EXE", sSort);//set the command to speak on them
                                        DelayCommand(0.1, ExecuteScript("fky_chat_command", oCPC));//this ensures the spoken string fires the chat script again
                                    }
                                    else FloatingTextStringOnCreature(COLOR_RED+TARGETER_ERROR3+COLOR_END, oCPC, FALSE);
                                }
                                else if (sKey == ITEM_TARGET)
                                {
                                    DeleteLocalString(oCPC, "FKY_CHAT_COMMAND");
                                    FloatingTextStringOnCreature(COLOR_RED + TARGETER_ERROR5 + COLOR_END, oCPC, FALSE);
                                }
                                else
                                {
                                    DeleteLocalString(oCPC, "FKY_CHAT_COMMAND");
                                    FloatingTextStringOnCreature(COLOR_RED + TARGETER_ERROR5 + COLOR_END, oCPC, FALSE);
                                }
                            }
                            else FloatingTextStringOnCreature(COLOR_RED + TARGET_ON_SERV + COLOR_END, oCPC, FALSE);
                        }
                        else
                        {
                            DeleteLocalString(oCPC, "FKY_CHAT_COMMAND");
                            FloatingTextStringOnCreature(COLOR_RED + TARGET_REQ_TELL1 + COLOR_END + COLOR_GREEN + COMMAND_SYMBOL+"target "+ COLOR_END + COLOR_RED + TARGET_REQ_TELL2 + COLOR_END, oCPC, FALSE);
                        }
                    }
                    else FloatingTextStringOnCreature(COLOR_RED + TARGET_NO_COMM + COLOR_END, oCPC, FALSE);
                }
                break;
    /*u*/       case 18:
                if (sCText ==  "unignore")
                {
                    //if (((nCChannel == 4) ||(nCChannel == 20)) && GetIsObjectValid(oCTarget))//can now be targeted with the command targeter
                    //{
                        if (!GetIsObjectValid(oCTarget))//target verification - do they need to use the command targeter?
                        {
                            oCTarget = GetLocalObject(oCPC, "FKY_CHAT_TARGET"); //have they already used the targeter?
                            if (!GetIsObjectValid(oCTarget))
                            {
                                FloatingTextStringOnCreature(COLOR_GOLD+REQUIRES_TARGET+COLOR_END, oCPC, FALSE);//tell them
                                SetLocalString(oCPC, "FKY_CHAT_COMMAND", OBJECT_TARGET+COMMAND_SYMBOL + sNormalCase);//mark them for the targeter
                                if (!GetIsObjectValid(GetItemPossessedBy(oCPC, "fky_chat_target"))) CreateItemOnObject("fky_chat_target", oCPC);//give them a targeter if they need one
                                return;
                            }
                            else DeleteLocalObject(oCPC, "FKY_CHAT_TARGET");//variable cleanup
                        }
                        if (GetIsPC(oCTarget))
                        {
                            sTarget = GetPCPlayerName(oCTarget);
                            if (GetLocalInt(oCPC, "FKY_CHT_IGNORE" + sTarget) == TRUE)
                            {
                                sPlayer = GetPCPlayerName(oCPC);
                                DeleteLocalInt(oCPC, "FKY_CHT_IGNORE" + sTarget);//ignore list stored on PC ignoring
                                SendMessageToPC(oCPC, COLOR_RED+UNIGNORE1+ sTarget + "."+COLOR_END);
                                SendMessageToPC(oCTarget, COLOR_RED + sPlayer+UNIGNORE2+COLOR_END);
                            }
                            else FloatingTextStringOnCreature(COLOR_RED+UNIGNORE3+ sTarget + "!"+COLOR_END, oCPC, FALSE);
                        }
                        else FloatingTextStringOnCreature(COLOR_RED+PC_ONLY+COLOR_END, oCPC, FALSE);
                    //}
                    //else FloatingTextStringOnCreature(COLOR_RED+UNIGNORE4+COLOR_END, oCPC, FALSE);
                }
                else if (GetStringLeft(sCText, 3) == "uni") CommandRedirect(oCPC, 8);
                else if (sCText ==  "unanon")
                {
                    DeleteLocalInt(oCPC, "FKY_CHAT_ANON");
                    SendMessageToPC(oCPC, COLOR_RED+UNANON+COLOR_END);
                }
                else if (GetStringLeft(sCText, 3) == "una") CommandRedirect(oCPC, 2);
                else CommandRedirect(oCPC, 1);
                break;
    /*w*/       case 20:
                if ((GetStringLeft(sCText, 2) == "wp") && ENABLE_WEAPON_VISUALS)//weapon visuals
                {
                    sCText = GetStringRight(sCText, GetStringLength(sCText) - 2);
                    nText = FindSubString("ac co el ev fi ho none", sCText);
                    switch (nText)       //0  3  6  9  12 15 18
                    {
                        case -1: CommandRedirect(oCPC, 4); break;
                        case 0: AddItemPropertyVisualEffect(oCPC,ITEM_VISUAL_ACID); break;
                        case 3: AddItemPropertyVisualEffect(oCPC,ITEM_VISUAL_COLD); break;
                        case 6: AddItemPropertyVisualEffect(oCPC,ITEM_VISUAL_ELECTRICAL); break;
                        case 9: AddItemPropertyVisualEffect(oCPC,ITEM_VISUAL_EVIL); break;
                        case 12: AddItemPropertyVisualEffect(oCPC,ITEM_VISUAL_FIRE); break;
                        case 15: AddItemPropertyVisualEffect(oCPC,ITEM_VISUAL_HOLY); break;
                        case 18: RemoveItemPropertyVisualEffect(oCPC); break;
                    }
                }
                else CommandRedirect(oCPC, 1);
                break;
            }
        }
        else FloatingTextStringOnCreature(COLOR_RED+NOT_DEAD+COLOR_END, oCPC, FALSE);//no match
}

void ShoutBlock(object oSBPC, int nSBChannel)
{
    if (nSBChannel == 2) SetLocalString(oSBPC, "NWNX!CHAT!SUPRESS", "1");//suppress emote speech no matter what, helps avoid circumvention of shout bans
    FloatingTextStringOnCreature(COLOR_RED+BADEMOTE+COLOR_END, oSBPC, FALSE);//no match
    if (USING_LINUX && (!GetLocalInt(oSBPC, "FKY_CHAT_EMOTETOGGLE")))
    {
        SetLocalInt(oSBPC, "FKY_CHAT_CONVONUMBER", 80);
        AssignCommand(oSBPC, ClearAllActions(TRUE));
        AssignCommand(oSBPC, ActionStartConversation(oSBPC, "chat_emote", TRUE, FALSE));
    }
}

//                       oPC          sText
void HandleEmotes(object oEPC, string sEText, int nEChannel)
{
    int nText, nSort2;
    string sSort;
    if (!GetIsDead(oEPC))
    {
        sEText = GetStringLowerCase(GetStringRight(sEText, GetStringLength(sEText) - 1));  //23 commands, case insensitive
        sSort = GetStringLeft(sEText, 1);
        nText = FindSubString("abcdefghijklmnopqrstuvwxyz", sSort);
        nSort2 = nText < 0 ? -1 : nText / 5;
        switch (nSort2)
        {
            case -1:
            if (USING_LINUX && (sEText == EMOTE_SYMBOL))//double emote symbol toggles emote popup window on and off
            {
                if (GetLocalInt(oEPC, "FKY_CHAT_EMOTETOGGLE")) DeleteLocalInt(oEPC, "FKY_CHAT_EMOTETOGGLE");
                else SetLocalInt(oEPC, "FKY_CHAT_EMOTETOGGLE", 1);
            }
            //else ShoutBlock(oEPC, nEChannel);
            break;
            case 0:
            switch(nText)
            {
                case 0:/*a*/
                if (sEText == "ag" || sEText == "agree") DoLoopAnimation(oEPC, ANIMATION_LOOPING_LISTEN);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                case 1:/*b*/
                if (sEText =="bg" || sEText == "beg") DoLoopAnimation(oEPC, ANIMATION_LOOPING_TALK_PLEADING);
                else if (sEText == "bn" || sEText == "bend") DoLoopAnimation(oEPC, ANIMATION_LOOPING_GET_LOW);
                else if (sEText == "bw" || sEText == "bow") DoFireForgetAnimation(oEPC, ANIMATION_FIREFORGET_BOW);
                else if (sEText == "bo" || sEText == "bored") DoFireForgetAnimation(oEPC, ANIMATION_FIREFORGET_PAUSE_BORED);
                else if (sEText == "bk" || sEText == "bark") DoBark(oEPC);
                else if (sEText == "bh" || sEText == "belch") DoBelch(oEPC);
                else if (sEText == "bp" || sEText == "burp") DoBurp(oEPC);
                else if (sEText == "bye") DoGoodbye(oEPC);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                case 2:/*c*/
                if (sEText == "cl" || sEText == "celebrate") DoCheer3(oEPC);
                else if (sEText == "ca" || sEText == "cantrip") DoLoopAnimation(oEPC, ANIMATION_LOOPING_CONJURE1);
                else if (sEText == "ch" || sEText == "cheer") DoCheer(oEPC);
                else if (sEText == "ck" || sEText == "chuckle") DoLaugh(oEPC);
                else if (sEText == "ct" || sEText == "chat") DoLoopAnimation(oEPC, ANIMATION_LOOPING_TALK_NORMAL);
                else if (sEText == "cs" || sEText == "cast") DoLoopAnimation(oEPC, ANIMATION_LOOPING_CONJURE2);
                else if (sEText == "cy" || sEText == "curtsy") DoFireForgetAnimation(oEPC, ANIMATION_FIREFORGET_BOW);
                else if (sEText == "co" || sEText == "collapse") DoLoopAnimation(oEPC, ANIMATION_LOOPING_DEAD_FRONT);
                else if (sEText == "cn" || sEText == "chant") DoChant(oEPC);
                else if (sEText == "cr" || sEText == "chortle") DoLaugh2(oEPC);
                else if (sEText == "cg" || sEText == "cough" || sEText == "choke") DoCough(oEPC);
                else if (sEText == "cry") DoCry(oEPC);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                case 3:/*d*/
                if (sEText == "da" || sEText == "dance") DoDance(oEPC);
                else if (sEText == "dd" || sEText == "dead") DoLoopAnimation(oEPC, ANIMATION_LOOPING_DEAD_BACK);
                else if (sEText == "dk" || sEText == "duck") DoFireForgetAnimation(oEPC, ANIMATION_FIREFORGET_DODGE_DUCK);
                else if (sEText == "di" || sEText == "die") DoLoopAnimation(oEPC, ANIMATION_LOOPING_DEAD_FRONT);
                else if (sEText == "dr" || sEText == "drink") DoDrink(oEPC);
                else if (sEText == "dm" || sEText == "demand") DoLoopAnimation(oEPC, ANIMATION_LOOPING_TALK_FORCEFUL);
                else if (sEText == "dg" || sEText == "dodge") DoFireForgetAnimation(oEPC, ANIMATION_FIREFORGET_DODGE_SIDE);
                else if (sEText == "dn" || sEText == "drunk") DoDrunk(oEPC);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                case 4:/*e*/
                if (sEText == "ex" || sEText == "exhausted") DoTired(oEPC);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                default: //ShoutBlock(oEPC, nEChannel);
                break;
            }
            break;
            case 1:
            switch(nText)
            {
                case 5:/*f*/
                if (sEText == "fa" || sEText== "fatigue") DoTired(oEPC);
                else if (sEText == "fd" || sEText == "fakedead") DoFakeDeath(oEPC);
                else if (sEText == "fg" || sEText == "fidget")  DoLoopAnimation(oEPC, ANIMATION_LOOPING_PAUSE2);
                else if (sEText == "fi" || sEText == "fiddle")  DoLoopAnimation(oEPC, ANIMATION_LOOPING_GET_MID);
                else if (sEText == "fl" || sEText == "fall") DoLoopAnimation(oEPC, ANIMATION_LOOPING_DEAD_FRONT);
                else if (sEText == "fp" || sEText == "flop") DoLoopAnimation(oEPC, ANIMATION_LOOPING_DEAD_FRONT);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                case 6:/*g*/
                if ((sEText == "gi" || sEText == "giggle") && (GetGender(oEPC) == GENDER_FEMALE)) DoGiggle(oEPC);
                else if (sEText == "gr" || sEText == "greet") DoFireForgetAnimation(oEPC, ANIMATION_FIREFORGET_GREETING);
                else if (sEText == "gn" || sEText == "groan") DoGroan(oEPC);
                else if (sEText == "gw" || sEText == "guffaw") DoLaugh2(oEPC);
                else if (sEText == "gb" || sEText == "gt" || sEText == "goodnight" || sEText == "goodbye") DoGoodbye(oEPC);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                case 7:/*h*/
                if (sEText == "hm" || sEText == "hum") DoSong(oEPC);
                else if (sEText == "hy" || sEText == "hooray") DoCheer2(oEPC);
                else if (sEText == "hl" || sEText == "hello") DoFireForgetAnimation(oEPC, ANIMATION_FIREFORGET_GREETING);
                else if (sEText == "hw" || sEText == "howl") DoHowl(oEPC);
                else if (sEText == "ht" || sEText == "hoot") DoHoot(oEPC);
                else if (sEText == "hp" || sEText == "hiccup") DoHiccup(oEPC);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                //case 8:/*i*/
                //break;
                //case 9:/*j*/
                //break;
                default: //ShoutBlock(oEPC, nEChannel);
                break;
            }
            break;
            case 2:
            switch(nText)
            {
                case 10:/*k*/
                if (sEText == "kn" || sEText == "kneel") DoLoopAnimation(oEPC, ANIMATION_LOOPING_MEDITATE);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                case 11:/*l*/
                if (sEText == "la" || sEText == "laugh") DoLaugh(oEPC);
                else if (sEText == "lie") DoLoopAnimation(oEPC, ANIMATION_LOOPING_DEAD_BACK);
                else if (sEText == "lk" || sEText == "look") DoLoopAnimation(oEPC, ANIMATION_LOOPING_LOOK_FAR);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                case 12:/*m*/
                if (sEText == "md" || sEText == "meditate") DoLoopAnimation(oEPC, ANIMATION_LOOPING_MEDITATE);
                else if (sEText == "mk" || sEText == "mock") DoTaunt(oEPC);
                else if (sEText == "mn" || sEText == "moan") DoMoan(oEPC);
                else if (sEText == "mw" || sEText == "meow") DoMeow(oEPC);
                else if (sEText == "mo" || sEText == "moo") DoMoo(oEPC);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                case 13:/*n*/
                if (sEText == "nd" || sEText == "nod") DoLoopAnimation(oEPC, ANIMATION_LOOPING_LISTEN);
                else if (sEText == "no") DoHeadShake(oEPC);
                else if (sEText == "np" || sEText == "nap") DoSleep(oEPC);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                case 14:/*o*/
                if (sEText == "ow" || sEText == "ouch") DoOuch(oEPC);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                default: //ShoutBlock(oEPC, nEChannel);
                break;
            }
            break;
            case 3:
            switch(nText)
            {
                case 15:/*p*/
                if (sEText == "pe" || sEText == "peer") DoLoopAnimation(oEPC, ANIMATION_LOOPING_LOOK_FAR);
                else if (sEText == "pl" || sEText == "plead") DoLoopAnimation(oEPC, ANIMATION_LOOPING_TALK_PLEADING);
                else if (sEText == "pr" || sEText == "pray") DoLoopAnimation(oEPC, ANIMATION_LOOPING_MEDITATE);
                else if (sEText == "pn" || sEText == "prone") DoLoopAnimation(oEPC, ANIMATION_LOOPING_DEAD_FRONT);
                else if (sEText == "pu" || sEText == "puke") DoPuke(oEPC);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                //case 16:/*q*/
                //break;
                case 17:/*r*/
                if (sEText == "re" || sEText == "read") DoFireForgetAnimation(oEPC, ANIMATION_FIREFORGET_READ);
                else if (sEText == "rt" || sEText == "rest") DoLoopAnimation(oEPC, ANIMATION_LOOPING_DEAD_BACK);
                else if (sEText == "rr" || sEText == "roar") DoRoar(oEPC);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                case 18:/*s*/
                if (sEText == "sa" || sEText == "salute") DoFireForgetAnimation(oEPC, ANIMATION_FIREFORGET_SALUTE);
                else if (sEText == "sn" || sEText == "scan") DoLoopAnimation(oEPC, ANIMATION_LOOPING_LOOK_FAR);
                else if (sEText == "sc" || sEText == "scratch") DoFireForgetAnimation(oEPC, ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
                else if (sEText == "sg" || sEText == "sing") DoSong(oEPC);
                else if (sEText == "sh" || sEText == "shift") DoLoopAnimation(oEPC, ANIMATION_LOOPING_PAUSE2);
                else if (sEText == "si" || sEText == "sit") DoLoopAnimation(oEPC, ANIMATION_LOOPING_SIT_CROSS);
                else if (sEText == "sip") DoDrink(oEPC);
                else if (sEText == "sl" || sEText == "sleep") DoSleep(oEPC);
                else if (sEText == "snore") DoSnore(oEPC);
                else if (sEText == "sk" || sEText == "smoke") SmokePipe(oEPC);
                else if (sEText == "sp" || sEText == "spasm") DoLoopAnimation(oEPC, ANIMATION_LOOPING_SPASM);
                else if (sEText == "st" || sEText == "steal" || sEText == "sw" || sEText == "swipe") DoFireForgetAnimation(oEPC, ANIMATION_FIREFORGET_STEAL);
                else if (sEText == "so" ||sEText == "stoop") DoLoopAnimation(oEPC, ANIMATION_LOOPING_GET_LOW);
                else if (sEText == "sr" || sEText == "stretch") DoFireForgetAnimation(oEPC, ANIMATION_FIREFORGET_PAUSE_BORED);
                else if (sEText == "sy" || sEText == "sway") DoLoopAnimation(oEPC, ANIMATION_LOOPING_PAUSE_DRUNK);
                else if (sEText == "sm" || sEText == "scream") DoScream(oEPC);
                else if (sEText == "sz" || sEText == "sneeze") DoSneeze(oEPC);
                else if (sEText == "spit") DoSpit(oEPC);
                else if (sEText == "snarl") DoSnarl(oEPC);
                else if (sEText == "screech") DoScreech(oEPC);
                else if (sEText == "sb" || sEText == "sob") DoCry(oEPC);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                case 19:/*t*/
                if (sEText == "ta" || sEText == "taunt") DoTaunt(oEPC);
                else if (sEText == "th" || sEText == "threaten") DoLoopAnimation(oEPC, ANIMATION_LOOPING_TALK_FORCEFUL);
                else if (sEText == "ti" || sEText == "tired") DoTired(oEPC);
                else if (sEText == "tl" || sEText == "talk") DoLoopAnimation(oEPC, ANIMATION_LOOPING_TALK_NORMAL);
                else if (sEText == "tp" || sEText == "trip") DoLoopAnimation(oEPC, ANIMATION_LOOPING_DEAD_FRONT);
                else if (sEText == "tt" || sEText == "toast") DoToast(oEPC);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                default: //ShoutBlock(oEPC, nEChannel);
                break;
            }
            break;
            case 4:
            switch(nText)
            {
                //case 20:/*u*/
                //break;
                case 21:/*v*/
                if (sEText == "vm" || sEText == "vomit") DoPuke(oEPC);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                case 22:/*w*/
                if (sEText == "wa" || sEText == "wave") DoFireForgetAnimation(oEPC, ANIMATION_FIREFORGET_GREETING);
                else if (sEText == "wh" || sEText == "whistle") DoWhistle(oEPC);
                else if (sEText == "wo" || sEText == "worship") DoLoopAnimation(oEPC, ANIMATION_LOOPING_WORSHIP);
                else if (sEText == "wz" || sEText == "woozy") DoDrunk(oEPC);
                else if (sEText == "wl" || sEText == "wail") DoWail(oEPC);
                else if (sEText == "wp" || sEText == "weep") DoCry(oEPC);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                //case 23:/*x*/
                //break;
                case 24:/*y*/
                if (sEText == "yw" || sEText == "yawn") DoYawn(oEPC);
                //else ShoutBlock(oEPC, nEChannel);
                break;
                default: //ShoutBlock(oEPC, nEChannel);
                break;
            }
            break;
            //case 5:
            //switch(nText)
            //{
            //    case 25:/*z*/
            //    break;
            //}
            break;
            default: //ShoutBlock(oEPC, nEChannel);
            break;
        }
    }
    else
    {
        SetLocalString(oEPC, "NWNX!CHAT!SUPRESS", "1");
        FloatingTextStringOnCreature(COLOR_RED+NOT_DEAD_EM+COLOR_END, oEPC, FALSE);
    }
}
//                    oPC           sText
void DoSpamBan(object oSBPC, string sSBText)
{
    string sKey = GetPCPublicCDKey(oSBPC);
    SetLocalString(oSBPC, "NWNX!CHAT!SUPRESS", "1");//mute em
    SetLocalInt(oSBPC, "FKY_CHT_BANSHOUT", TRUE);//temp ban em
    if (GetLocalString(oSBPC, "FKY_CHT_BANREASON") == "") SetLocalString(oSBPC, "FKY_CHT_BANREASON", sSBText);
    //capture the first message that got them busted so that that can't overwrite with something
    //benign to show the dms to get unbanned so they can try again
    if (USING_NWNX_DB) SetPersistentInt(GetModule(), "FKY_CHT_BANSHOUT"+ sKey, TRUE);//permaban em
    else SetCampaignInt("FKY_CHT", "FKY_CHT_BANSHOUT" + sKey, TRUE);                //
    SendMessageToPC(oSBPC, COLOR_RED+PERMBANSHT1+COLOR_END);//tell em
}
string TranslateCommonToLanguage(int nLang, string sText)
{
    string sReturn = "";
    switch(nLang/10)
    {
        case 0:
        switch(nLang)
        {
            case 1: sReturn = ProcessDwarf(sText); break;
            case 2: sReturn = ProcessAlgarondan(sText); break;
            case 3: sReturn = ProcessAlzhedo(sText); break;
            case 4: sReturn = ProcessAquan(sText); break;
            case 5: sReturn = ProcessAssassinsCant(sText); break;
            case 6: sReturn = ProcessAuran(sText); break;
            case 7: sReturn = ProcessChessentan(sText); break;
            case 8: sReturn = ProcessChondathan(sText); break;
            case 9: sReturn = ProcessElven(sText); break;
        }
        break;
        case 1:
        switch(nLang)
        {
            case 10: sReturn = ProcessChultan(sText); break;
            case 11: sReturn = ProcessDamaran(sText); break;
            case 12: sReturn = ProcessDambrathan(sText); break;
            case 13: sReturn = ProcessDrowSign(sText); break;
            case 14: sReturn = ProcessDruidic(sText); break;
            case 15: sReturn = ProcessGnome(sText); break;
            case 16: sReturn = ProcessDurpari(sText); break;
            case 17: sReturn = ProcessGiant(sText); break;
            case 18: sReturn = ProcessGnoll(sText); break;
            case 19: sReturn = ProcessHalardrim(sText); break;
        }
        break;
        case 2:
        switch(nLang)
        {
            case 20: sReturn = ProcessHalruaan(sText); break;
            case 21: sReturn = ProcessIgnan(sText); break;
            case 22: sReturn = ProcessIlluskan(sText); break;
            case 23: sReturn = ProcessHalfling(sText); break;
            case 24: sReturn = ProcessImaskar(sText); break;
            case 25: sReturn = ProcessLantanese(sText); break;
            case 26: sReturn = ProcessMidani(sText); break;
            case 27: sReturn = ProcessMulhorandi(sText); break;
            case 28: sReturn = ProcessNexalan(sText); break;
            case 29: sReturn = ProcessOillusk(sText); break;
        }
        break;
        case 3:
        switch(nLang)
        {
            case 30: sReturn = ProcessRashemi(sText); break;
            case 31: sReturn = ProcessRaumvira(sText); break;
            case 32: sReturn = ProcessDrow(sText); break;
            case 33: sReturn = ProcessSerusan(sText); break;
            case 34: sReturn = ProcessShaaran(sText); break;
            case 35: sReturn = ProcessShou(sText); break;
            case 36: sReturn = ProcessSylvan(sText); break;
            case 37: sReturn = ProcessAnimal(sText); break;
            case 38: sReturn = ProcessTalfiric(sText); break;
            case 39: sReturn = ProcessTashalan(sText); break;
        }
        break;
        case 4:
        switch(nLang)
        {
            case 40: sReturn = ProcessTerran(sText); break;
            case 41: sReturn = ProcessTreant(sText); break;
            case 42: sReturn = ProcessTuigan(sText); break;
            case 43: sReturn = ProcessTurmic(sText); break;
            case 44: sReturn = ProcessCant(sText); break;
            case 45: sReturn = ProcessUluik(sText); break;
            case 46: sReturn = ProcessUndercommon(sText); break;
            case 47: sReturn = ProcessUntheric(sText); break;
            case 48: sReturn = ProcessVaasan(sText); break;
            case 49: sReturn = ProcessGoblin(sText); break;
        }
        break;
        case 5:
        switch(nLang)
        {
            case 50: sReturn = ProcessTroll(sText); break;
            case 51: sReturn = ProcessThriKreen(sText); break;
            case 52: sReturn = ProcessGrimlock(sText); break;
            case 53: sReturn = ProcessHalfOrc(sText); break;
            case 54: sReturn = ProcessKuoToan(sText); break;
            case 55: sReturn = ProcessKenderspeak(sText); break;
            case 56: sReturn = ProcessOrc(sText); break;
            case 57: sReturn = ProcessMinotaur(sText); break;
            case 58: sReturn = ProcessRakshasa(sText); break;
            case 59: sReturn = ProcessStinger(sText); break;
        }
        break;
        case 6:
        switch(nLang)
        {
            case 60: sReturn = ProcessLizardMan(sText); break;
            case 61: sReturn = ProcessIllithid(sText); break;
            case 62: sReturn = ProcessHobgoblin(sText); break;
            case 63: sReturn = ProcessDraconic(sText); break;
            case 64: sReturn = ProcessDuergar(sText); break;
            case 65: sReturn = ProcessBugBear(sText); break;
            case 66: sReturn = ProcessGithzerai(sText); break;
            case 67: sReturn = ProcessKorred(sText); break;
            case 68: sReturn = ProcessSahaguin(sText); break;
            case 69: sReturn = ProcessYuanTi(sText); break;
        }
        break;
        case 7:
        switch(nLang)
        {
            case 70: sReturn = ProcessPixie(sText); break;
            case 71: sReturn = ProcessMagic(sText); break;
            case 72: sReturn = ProcessInfernal(sText); break;
            case 73: sReturn = ProcessSirenSong(sText); break;
            case 74: sReturn = ProcessHengeyokai(sText); break;
            case 75: sReturn = ProcessSvirfneblin(sText); break;
            case 76: sReturn = ProcessHighShou(sText); break;
            case 77: sReturn = ProcessPsionic(sText); break;
            case 78: sReturn = ProcessAverial(sText); break;
            case 79: sReturn = ProcessKobold(sText); break;
        }
        break;
        case 8:
        switch(nLang)
        {
            case 80: sReturn = ProcessNecromantic(sText); break;
            case 81: sReturn = ProcessAbyssal(sText); break;
            case 82: sReturn = ProcessOgre(sText); break;
            case 89: sReturn = ProcessCelestial(sText); break;
        }
        break;
        case 9:
        switch(nLang)
        {
            case 99: sReturn = ProcessLeetspeak(sText); break;
        }
        break;
    }
    return sReturn;
}
void DoLanguageSetupNWNX(object oLPC)
{
    string sSQLName = SQLEncodeSpecialChars(GetName(oLPC));
    string sSQLPlayername = SQLEncodeSpecialChars(GetPCPlayerName(oLPC));
    string sSQLDB = "SELECT name, val FROM pwdata WHERE player = '"+sSQLPlayername+"' AND tag = '"+sSQLName+"' AND name LIKE 'FKY_CHAT_%';";
    SQLExecDirect(sSQLDB);
    while(SQLFetch() != SQL_ERROR)
    {
        SetLocalInt(oLPC, SQLDecodeSpecialChars(SQLGetData(1)), StringToInt(SQLDecodeSpecialChars(SQLGetData(2))));
    }
    if (!GetLocalInt(oLPC, "FKY_CHAT_LANGBASE"))//int that tracks whether they have been tagged
    //as knowing languages based on their starting characteristics (others can be gained later
    //via leveling, teaching, etc) - if this int is absent we'll check the characters race, class,
    //and subrace, and tag him permanently with the languages he can speak.
    {
        switch(GetRacialType(oLPC))
        {
            case RACIAL_TYPE_DWARF: SetLocalInt(oLPC, "FKY_CHAT_LANG1", TRUE); SetPersistentInt(oLPC, "FKY_CHAT_LANG1", TRUE); break;
            case RACIAL_TYPE_ELF:
            case RACIAL_TYPE_HALFELF: SetLocalInt(oLPC, "FKY_CHAT_LANG9", TRUE); SetPersistentInt(oLPC, "FKY_CHAT_LANG9", TRUE); break;
            case RACIAL_TYPE_GNOME: SetLocalInt(oLPC, "FKY_CHAT_LANG15", TRUE); SetPersistentInt(oLPC, "FKY_CHAT_LANG15", TRUE); break;
            case RACIAL_TYPE_HALFLING: SetLocalInt(oLPC, "FKY_CHAT_LANG23", TRUE); SetPersistentInt(oLPC, "FKY_CHAT_LANG23", TRUE); break;
            case RACIAL_TYPE_HUMANOID_ORC:
            case RACIAL_TYPE_HALFORC: SetLocalInt(oLPC, "FKY_CHAT_LANG56", TRUE); SetPersistentInt(oLPC, "FKY_CHAT_LANG56", TRUE); SetLocalInt(oLPC, "FKY_CHAT_LANG53", TRUE); SetPersistentInt(oLPC, "FKY_CHAT_LANG53", TRUE); break;
            case RACIAL_TYPE_HUMANOID_GOBLINOID: SetLocalInt(oLPC, "FKY_CHAT_LANG49", TRUE); SetPersistentInt(oLPC, "FKY_CHAT_LANG49", TRUE); break;
            case RACIAL_TYPE_HUMANOID_REPTILIAN:
            case RACIAL_TYPE_DRAGON: SetLocalInt(oLPC, "FKY_CHAT_LANG63", TRUE); SetPersistentInt(oLPC, "FKY_CHAT_LANG63", TRUE); break;
        }
        if (GetLevelByClass(CLASS_TYPE_RANGER, oLPC) || GetLevelByClass(CLASS_TYPE_DRUID, oLPC))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG37", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG37", TRUE);
        }
        if (GetLevelByClass(CLASS_TYPE_ROGUE, oLPC))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG44", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG44", TRUE);
        }
        if (GetLevelByClass(CLASS_TYPE_ASSASSIN, oLPC))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG5", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG5", TRUE);
        }
        if (GetLevelByClass(CLASS_TYPE_DRUID, oLPC))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG14", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG14", TRUE);
        }
        if ((GetLevelByClass(CLASS_TYPE_WIZARD, oLPC) || GetLevelByClass(CLASS_TYPE_SORCERER, oLPC) || GetLevelByClass(CLASS_TYPE_PALEMASTER, oLPC)))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG71", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG71", TRUE);
            if (GetLevelByClass(CLASS_TYPE_PALEMASTER, oLPC))
            {
                SetLocalInt(oLPC, "FKY_CHAT_LANG80", TRUE);
                SetPersistentInt(oLPC, "FKY_CHAT_LANG80", TRUE);
            }
        }
        string sPCSubrace = GetSubRace(oLPC);
        if (SubraceSpeaksDrow(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG32", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG32", TRUE);
        }
        if (SubraceSpeaksAnimal(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG37", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG37", TRUE);
        }
        if (SubraceSpeaksGoblin(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG49", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG49", TRUE);
        }
        if (SubraceSpeaksOrcish(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG56", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG56", TRUE);
        }
        if (SubraceSpeaksDraconic(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG63", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG63", TRUE);
        }
        if (SubraceSpeaksInfernal(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG72", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG72", TRUE);
        }
        if (SubraceSpeaksAbyssal(sPCSubrace) && ((sPCSubrace != "Tiefling") || (!GetLocalInt(oLPC, "FKY_CHAT_LANG72"))))//if Tieflings speak Infernal they don't speak abyssal
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG81", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG81", TRUE);
        }
        if (SubraceSpeaksCelestial(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG89", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG89", TRUE);
        }
        if (SubraceSpeaksLeetspeak(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG99", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG99", TRUE);
        }
        if (SubraceSpeaksAquan(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG4", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG4", TRUE);
        }
        if (SubraceSpeaksAuran(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG6", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG6", TRUE);
        }
        if (SubraceSpeaksGiant(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG17", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG17", TRUE);
        }
        if (SubraceSpeaksGnoll(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG18", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG18", TRUE);
        }
        if (SubraceSpeaksIgnan(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG21", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG21", TRUE);
        }
        if (SubraceSpeaksTerran(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG40", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG40", TRUE);
        }
        if (SubraceSpeaksTreant(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG41", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG41", TRUE);
        }
        if (SubraceSpeaksSylvan(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG36", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG36", TRUE);
        }
        if (SubraceSpeaksDrowSign(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG13", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG13", TRUE);
        }
        if (SubraceSpeaksUndercommon(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG46", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG46", TRUE);
        }
        if (SubraceSpeaksTroll(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG50", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG50", TRUE);
        }
        if (SubraceSpeaksThriKreen(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG51", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG51", TRUE);
        }
        if (SubraceSpeaksGrimlock(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG52", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG52", TRUE);
        }
        if (SubraceSpeaksKuoToan(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG54", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG54", TRUE);
        }
        if (SubraceSpeaksKenderspeak(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG55", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG55", TRUE);
        }
        if (SubraceSpeaksMinotaur(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG57", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG57", TRUE);
        }
        if (SubraceSpeaksRakshasa(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG58", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG58", TRUE);
        }
        if (SubraceSpeaksStinger(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG59", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG59", TRUE);
        }
        if (SubraceSpeaksLizardMan(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG60", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG60", TRUE);
        }
        if (SubraceSpeaksIllithid(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG61", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG61", TRUE);
        }
        if (SubraceSpeaksHobgoblin(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG62", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG62", TRUE);
        }
        if (SubraceSpeaksDuergar(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG64", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG64", TRUE);
        }
        if (SubraceSpeaksBugBear(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG65", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG65", TRUE);
        }
        if (SubraceSpeaksGithzerai(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG66", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG66", TRUE);
        }
        if (SubraceSpeaksKorred(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG67", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG67", TRUE);
        }
        if (SubraceSpeaksSahaguin(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG68", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG68", TRUE);
        }
        if (SubraceSpeaksYuanTi(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG69", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG69", TRUE);
        }
        if (SubraceSpeaksPixie(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG70", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG70", TRUE);
        }
        if (SubraceSpeaksSirenSong(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG73", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG73", TRUE);
        }
        if (SubraceSpeaksHengeyokai(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG74", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG74", TRUE);
        }
        if (SubraceSpeaksSvirfneblin(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG75", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG75", TRUE);
        }
        if (SubraceSpeaksPsionic(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG77", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG77", TRUE);
        }
        if (SubraceSpeaksAverial(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG78", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG78", TRUE);
        }
        if (SubraceSpeaksKobold(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG79", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG79", TRUE);
        }
        if (SubraceSpeaksOgre(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG82", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG82", TRUE);
        }
        SetPersistentInt(oLPC, "FKY_CHAT_LANGBASE", TRUE);//mark them as having passed through the base
        //languages check so it will not run again in the future
    }
}
void DoLanguageSetupBio(object oLPC)
{
    object oStorage = GetItemPossessedBy(oLPC, TAG_OF_LANGUAGE_STORAGE_OBJECT);
    int nX;
    if (!GetIsObjectValid(oStorage))//object that tracks whether they have been tagged
    //as knowing languages based on their starting characteristics (others can be gained later
    //via leveling, teaching, etc) - if this object is absent we'll check the characters race, class,
    //and subrace, and tag him permanently with the languages he can speak.
    {
        oStorage = CreateItemOnObject(RESREF_OF_LANGUAGE_STORAGE_OBJECT, oLPC);
        SetItemCursedFlag(oStorage, TRUE);
        switch(GetRacialType(oLPC))
        {
            case RACIAL_TYPE_DWARF: SetLocalInt(oLPC, "FKY_CHAT_LANG1", TRUE); SetLocalInt(oStorage, "FKY_CHAT_LANG1", TRUE); break;
            case RACIAL_TYPE_ELF:
            case RACIAL_TYPE_HALFELF: SetLocalInt(oLPC, "FKY_CHAT_LANG9", TRUE); SetLocalInt(oStorage, "FKY_CHAT_LANG9", TRUE); break;
            case RACIAL_TYPE_GNOME: SetLocalInt(oLPC, "FKY_CHAT_LANG15", TRUE); SetLocalInt(oStorage, "FKY_CHAT_LANG15", TRUE); break;
            case RACIAL_TYPE_HALFLING: SetLocalInt(oLPC, "FKY_CHAT_LANG23", TRUE); SetLocalInt(oStorage, "FKY_CHAT_LANG23", TRUE); break;
            case RACIAL_TYPE_HUMANOID_ORC:
            case RACIAL_TYPE_HALFORC: SetLocalInt(oLPC, "FKY_CHAT_LANG56", TRUE); SetLocalInt(oStorage, "FKY_CHAT_LANG56", TRUE); SetLocalInt(oLPC, "FKY_CHAT_LANG53", TRUE); SetLocalInt(oStorage, "FKY_CHAT_LANG53", TRUE); break;
            case RACIAL_TYPE_HUMANOID_GOBLINOID: SetLocalInt(oLPC, "FKY_CHAT_LANG49", TRUE); SetLocalInt(oStorage, "FKY_CHAT_LANG49", TRUE); break;
            case RACIAL_TYPE_HUMANOID_REPTILIAN:
            case RACIAL_TYPE_DRAGON: SetLocalInt(oLPC, "FKY_CHAT_LANG63", TRUE); SetLocalInt(oStorage, "FKY_CHAT_LANG63", TRUE); break;
        }
        if (GetLevelByClass(CLASS_TYPE_RANGER, oLPC) || GetLevelByClass(CLASS_TYPE_DRUID, oLPC))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG37", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG37", TRUE);
        }
        if (GetLevelByClass(CLASS_TYPE_ROGUE, oLPC))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG44", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG44", TRUE);
        }
        if (GetLevelByClass(CLASS_TYPE_ASSASSIN, oLPC))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG5", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG5", TRUE);
        }
        if (GetLevelByClass(CLASS_TYPE_DRUID, oLPC))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG14", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG14", TRUE);
        }
        if ((GetLevelByClass(CLASS_TYPE_WIZARD, oLPC) || GetLevelByClass(CLASS_TYPE_SORCERER, oLPC) || GetLevelByClass(CLASS_TYPE_PALEMASTER, oLPC)))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG71", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG71", TRUE);
            if (GetLevelByClass(CLASS_TYPE_PALEMASTER, oLPC))
            {
                SetLocalInt(oLPC, "FKY_CHAT_LANG80", TRUE);
                SetLocalInt(oStorage, "FKY_CHAT_LANG80", TRUE);
            }
        }
        string sPCSubrace = GetSubRace(oLPC);
        if (SubraceSpeaksDrow(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG32", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG32", TRUE);
        }
        if (SubraceSpeaksAnimal(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG37", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG37", TRUE);
        }
        if (SubraceSpeaksGoblin(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG49", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG49", TRUE);
        }
        if (SubraceSpeaksOrcish(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG56", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG56", TRUE);
        }
        if (SubraceSpeaksDraconic(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG63", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG63", TRUE);
        }
        if (SubraceSpeaksInfernal(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG72", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG72", TRUE);
        }
        if (SubraceSpeaksAbyssal(sPCSubrace) && ((sPCSubrace != "Tiefling") || (!GetLocalInt(oLPC, "FKY_CHAT_LANG72"))))//if Tieflings speak Infernal they don't speak abyssal
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG81", TRUE);
            SetPersistentInt(oLPC, "FKY_CHAT_LANG81", TRUE);
        }
        if (SubraceSpeaksCelestial(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG89", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG89", TRUE);
        }
        if (SubraceSpeaksLeetspeak(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG99", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG99", TRUE);
        }
        if (SubraceSpeaksAquan(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG4", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG4", TRUE);
        }
        if (SubraceSpeaksAuran(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG6", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG6", TRUE);
        }
        if (SubraceSpeaksGiant(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG17", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG17", TRUE);
        }
        if (SubraceSpeaksGnoll(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG18", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG18", TRUE);
        }
        if (SubraceSpeaksIgnan(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG21", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG21", TRUE);
        }
        if (SubraceSpeaksTerran(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG40", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG40", TRUE);
        }
        if (SubraceSpeaksTreant(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG41", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG41", TRUE);
        }
        if (SubraceSpeaksSylvan(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG36", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG36", TRUE);
        }
        if (SubraceSpeaksDrowSign(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG13", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG13", TRUE);
        }
        if (SubraceSpeaksUndercommon(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG46", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG46", TRUE);
        }
        if (SubraceSpeaksTroll(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG50", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG50", TRUE);
        }
        if (SubraceSpeaksThriKreen(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG51", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG51", TRUE);
        }
        if (SubraceSpeaksGrimlock(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG52", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG52", TRUE);
        }
        if (SubraceSpeaksKuoToan(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG54", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG54", TRUE);
        }
        if (SubraceSpeaksKenderspeak(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG55", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG55", TRUE);
        }
        if (SubraceSpeaksMinotaur(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG57", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG57", TRUE);
        }
        if (SubraceSpeaksRakshasa(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG58", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG58", TRUE);
        }
        if (SubraceSpeaksStinger(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG59", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG59", TRUE);
        }
        if (SubraceSpeaksLizardMan(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG60", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG60", TRUE);
        }
        if (SubraceSpeaksIllithid(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG61", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG61", TRUE);
        }
        if (SubraceSpeaksHobgoblin(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG62", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG62", TRUE);
        }
        if (SubraceSpeaksDuergar(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG64", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG64", TRUE);
        }
        if (SubraceSpeaksBugBear(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG65", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG65", TRUE);
        }
        if (SubraceSpeaksGithzerai(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG66", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG66", TRUE);
        }
        if (SubraceSpeaksKorred(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG67", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG67", TRUE);
        }
        if (SubraceSpeaksSahaguin(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG68", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG68", TRUE);
        }
        if (SubraceSpeaksYuanTi(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG69", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG69", TRUE);
        }
        if (SubraceSpeaksPixie(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG70", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG70", TRUE);
        }
        if (SubraceSpeaksSirenSong(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG73", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG73", TRUE);
        }
        if (SubraceSpeaksHengeyokai(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG74", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG74", TRUE);
        }
        if (SubraceSpeaksSvirfneblin(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG75", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG75", TRUE);
        }
        if (SubraceSpeaksPsionic(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG77", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG77", TRUE);
        }
        if (SubraceSpeaksAverial(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG78", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG78", TRUE);
        }
        if (SubraceSpeaksKobold(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG79", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG79", TRUE);
        }
        if (SubraceSpeaksOgre(sPCSubrace))
        {
            SetLocalInt(oLPC, "FKY_CHAT_LANG82", TRUE);
            SetLocalInt(oStorage, "FKY_CHAT_LANG82", TRUE);
        }
    }
    else//they've already been tagged with base languages, so retrieve those tags and set them
    //as locals on the PC
    {
        for (nX = 1; nX < 100; nX++)
        {
            if (GetLocalInt(oStorage, "FKY_CHAT_LANG"+IntToString(nX))) SetLocalInt(oLPC, "FKY_CHAT_LANG"+IntToString(nX), TRUE);
        }
    }
}
void HandleOneLiners(string sOLText, object oOLPC, int nOLChannel)
{
    string sSpeak;
    sOLText = GetStringRight(sOLText, GetStringLength(sOLText) - 2);
    int nPos = FindSubString(sOLText, " ");
    string sSort = GetStringLowerCase(GetStringLeft(sOLText, nPos));
    sOLText = GetStringRight(sOLText, GetStringLength(sOLText) - (nPos+1));
    int nText = GetLanguageNumber(sSort);
    if (nText == -1) FloatingTextStringOnCreature(COLOR_RED+BADLANG+COLOR_END, oOLPC, FALSE);
    else
    {
        if (GetLocalInt(oOLPC, "FKY_CHAT_LANG" + IntToString(nText)))//can they speak it?
        {
            string sConvert = TranslateCommonToLanguage(nText, sOLText);
            string sKnow = COLOR_PURPLE + GetName(oOLPC) + " "+COLOR_END+COLOR_BLUE+"[" + GetNameOfLanguage(nText) + "] " + sOLText + COLOR_END;
            string sLore = COLOR_PURPLE + GetName(oOLPC) + " "+COLOR_END+COLOR_BLUE+"[" + GetNameOfLanguage(nText) + "] " + sConvert + COLOR_END;
            string sHuh = COLOR_PURPLE + GetName(oOLPC) + " "+COLOR_END+COLOR_BLUE+"["+UNKN_LANG+"] " + sConvert + COLOR_END;
            if (nOLChannel == 1)//talk
            {
                SpeakString(sConvert);
                object oListener = GetFirstPC();
                object oArea = GetArea(oOLPC);
                while (GetIsObjectValid(oListener))
                {
                    if (GetArea(oListener) == oArea)
                    {
                        if (GetDistanceBetween(oOLPC, oListener) <= 15.0)
                        {
                            if (GetLocalInt(oListener, "FKY_CHAT_LANG" + IntToString(nText))) sSpeak = sKnow;//can they speak it?
                            else if (LORE_ALLOWS_LANGUAGE_COMPREHENSION && (ModifiedGetIsSkillSuccessful(oListener, SKILL_LORE, GetLoreNeededToComprehendLanguage(nText)))) sSpeak = sKnow;
                            else if (ModifiedGetIsSkillSuccessful(oListener, SKILL_LORE, LORE_NEEDED_TO_RECOGNIZE_LANGUAGE)) sSpeak = sLore;
                            else sSpeak = sHuh;
                            if (SEND_CHANNELS_TO_CHAT_LOG) SendChatLogMessage(oListener, sSpeak, GetMessenger());
                            else SendMessageToPC(oListener, sSpeak);
                        }
                    }
                    oListener = GetNextPC();
                }
            }
            else if (nOLChannel == 6)//party
            {
                object oParty = GetFirstFactionMember(oOLPC);
                while (GetIsObjectValid(oParty))
                {
                    if (GetLocalInt(oParty, "FKY_CHAT_LANG" + IntToString(nText))) sSpeak = sKnow;//can they speak it?
                    else if (LORE_ALLOWS_LANGUAGE_COMPREHENSION && (ModifiedGetIsSkillSuccessful(oParty, SKILL_LORE, GetLoreNeededToComprehendLanguage(nText)))) sSpeak = sKnow;
                    else if (ModifiedGetIsSkillSuccessful(oParty, SKILL_LORE, LORE_NEEDED_TO_RECOGNIZE_LANGUAGE)) sSpeak = sLore;
                    else sSpeak = sHuh;
                    if (SEND_CHANNELS_TO_CHAT_LOG) SendChatLogMessage(oParty, sSpeak, GetMessenger());
                    else SendMessageToPC(oParty, sSpeak);
                    oParty = GetNextFactionMember(oOLPC);
                }
            }
            else FloatingTextStringOnCreature(COLOR_RED+CHAN_LANG+COLOR_END, oOLPC, FALSE);
        }
        else if (nText == 109) FloatingTextStringOnCreature(COLOR_RED+NO_COMMON_OL+COLOR_END, oOLPC, FALSE);
        else FloatingTextStringOnCreature(COLOR_RED+NO_SPEAK+ GetNameOfLanguage(nText) + "!"+COLOR_END, oOLPC, FALSE);
    }
}
void HandleTalkSpeak(string sTSText, object oTSPC, int nVolume = TALKVOLUME_TALK)
{
    string sSpeak;
    string sEscape = ESCAPE_STRING;
    int nEscapeLength = GetStringLength(sEscape);
    int nLang = GetLocalInt(oTSPC, "FKY_CHT_SPEAKING");
    if (nLang)//if they can set this via the relevant !Speak command then we know they can speak it (checked there)
    {
        if (GetStringLeft(sTSText, nEscapeLength) == ESCAPE_STRING)
        {
            sTSText = GetStringRight(sTSText, GetStringLength(sTSText) - nEscapeLength);
            SpeakString(sTSText, nVolume);
            SetLocalString(oTSPC, "NWNX!CHAT!SUPRESS", "1");
        }
        else
        {
            string sConvert = TranslateCommonToLanguage(nLang, sTSText);
            string sKnow = COLOR_PURPLE + GetName(oTSPC) + " "+COLOR_END+COLOR_BLUE+"[" + GetNameOfLanguage(nLang) + "] " + sTSText + COLOR_END;
            string sLore = COLOR_PURPLE + GetName(oTSPC) + " "+COLOR_END+COLOR_BLUE+"[" + GetNameOfLanguage(nLang) + "] " + sConvert + COLOR_END;
            string sHuh = COLOR_PURPLE + GetName(oTSPC) + " "+COLOR_END+COLOR_BLUE+"["+UNKN_LANG+"] " + sConvert + COLOR_END;
            SpeakString(sConvert, nVolume);
            SetLocalString(oTSPC, "NWNX!CHAT!SUPRESS", "1");
            object oListener = GetFirstPC();
            object oArea = GetArea(oTSPC);
            float fRange = 15.0;
            if (nVolume == TALKVOLUME_WHISPER) fRange = 2.5;
            while (GetIsObjectValid(oListener))
            {
                if (GetArea(oListener) == oArea)
                {
                    if (GetDistanceBetween(oTSPC, oListener) <= fRange)
                    {
                    if (GetLocalInt(oListener, "FKY_CHAT_LANG" + IntToString(nLang))) sSpeak = sKnow;//can they speak it?
                    else if (LORE_ALLOWS_LANGUAGE_COMPREHENSION && (ModifiedGetIsSkillSuccessful(oListener, SKILL_LORE, GetLoreNeededToComprehendLanguage(nLang)))) sSpeak = sKnow;
                    else if (ModifiedGetIsSkillSuccessful(oListener, SKILL_LORE, LORE_NEEDED_TO_RECOGNIZE_LANGUAGE)) sSpeak = sLore;
                    else sSpeak = sHuh;
                    if (SEND_CHANNELS_TO_CHAT_LOG) SendChatLogMessage(oListener, sSpeak, GetMessenger());
                    else SendMessageToPC(oListener, sSpeak);
                    }
                }
                oListener = GetNextPC();
            }
        }
    }
    else //they are not currently speaking a language
    {
        if (GetStringLeft(sTSText, nEscapeLength) == ESCAPE_STRING)
        {
            sTSText = GetStringRight(sTSText, GetStringLength(sTSText) - nEscapeLength);
            SpeakString(sTSText, nVolume);
            SetLocalString(oTSPC, "NWNX!CHAT!SUPRESS", "1");
        }
    }
}
void HandlePartySpeak(string sPSText, object oPSPC)
{
    string sSpeak;
    int nLang = GetLocalInt(oPSPC, "FKY_CHT_SPEAKING");
    if (nLang)//if they can set this via the relevant !Speak command then we know they can speak it (checked there)
    {
        string sConvert = TranslateCommonToLanguage(nLang, sPSText);
        string sKnow = COLOR_PURPLE + GetName(oPSPC) + " "+COLOR_END+COLOR_BLUE+"[" + GetNameOfLanguage(nLang) + "] " + sPSText + COLOR_END;
        string sLore = COLOR_PURPLE + GetName(oPSPC) + " "+COLOR_END+COLOR_BLUE+"[" + GetNameOfLanguage(nLang) + "] " + sConvert + COLOR_END;
        string sHuh = COLOR_PURPLE + GetName(oPSPC) + " "+COLOR_END+COLOR_BLUE+"["+UNKN_LANG+"] " + sConvert + COLOR_END;
        SetLocalString(oPSPC, "NWNX!CHAT!SUPRESS", "1");
        object oParty = GetFirstFactionMember(oPSPC);
        while (GetIsObjectValid(oParty))
        {
            if (GetLocalInt(oParty, "FKY_CHAT_LANG" + IntToString(nLang))) sSpeak = sKnow;//can they speak it?
            else if (LORE_ALLOWS_LANGUAGE_COMPREHENSION && (ModifiedGetIsSkillSuccessful(oParty, SKILL_LORE, GetLoreNeededToComprehendLanguage(nLang)))) sSpeak = sKnow;
            else if (ModifiedGetIsSkillSuccessful(oParty, SKILL_LORE, LORE_NEEDED_TO_RECOGNIZE_LANGUAGE)) sSpeak = sLore;
            else sSpeak = sHuh;
            if (SEND_CHANNELS_TO_CHAT_LOG) SendChatLogMessage(oParty, sSpeak, GetMessenger());
            else SendMessageToPC(oParty, sSpeak);
            oParty = GetNextFactionMember(oPSPC);
        }
    }
}
void HandleMetaMessage(string sMMText, object oMMPC)
{
    if (DISALLOW_METASPEECH_WHILE_DEAD && GetIsDead(oMMPC)) FloatingTextStringOnCreature(COLOR_RED+NOMETA1+COLOR_END, oMMPC, FALSE);
    else
    {
        string sInvite = GetLocalString(oMMPC, "FKY_CHT_META_GRP");
        if (sInvite != "")
        {
            SetLocalString(oMMPC, "NWNX!CHAT!SUPRESS", "1");
            sMMText = GetStringRight(sMMText, GetStringLength(sMMText) - 2);
            SendMetaMessage(oMMPC, sInvite, sMMText);
        }
        else FloatingTextStringOnCreature(COLOR_RED+NOMETA2+COLOR_END, oMMPC, FALSE);
    }
}

void HandleVentrilo(string sVText, object oVPC)
{
    SetLocalString(oVPC, "NWNX!CHAT!SUPRESS", "1");
    sVText = GetStringRight(sVText, GetStringLength(sVText) - 2);
    object oTarget = GetLocalObject(oVPC, "FKY_CHT_VENTRILO");
    if (GetIsObjectValid(oTarget)) AssignCommand(oTarget, SpeakString(sVText));
    else FloatingTextStringOnCreature(COLOR_RED+BADVENT+COLOR_END, oVPC, FALSE);
}

string GetCommandString(int nCommand)
{
    string sReturn;
    switch (nCommand)
    {
        case 1: sReturn = COMMAND_SYMBOL + "settail"; break;
        case 2: sReturn = COMMAND_SYMBOL + "setwings"; break;
        case 3: sReturn = COMMAND_SYMBOL + "skillcheck"; break;
        case 4: sReturn = "dm_align_chaos"; break;
        case 5: sReturn = "dm_align_evil"; break;
        case 6: sReturn = "dm_align_good"; break;
        case 7: sReturn = "dm_align_law"; break;
        case 8: sReturn = "dm_fx"; break;
        case 9: sReturn = "dm_fx_loc"; break;
        case 10: sReturn = "dm_setcha"; break;
        case 11: sReturn = "dm_setcon"; break;
        case 12: sReturn = "dm_setdex"; break;
        case 13: sReturn = "dm_setint"; break;
        case 14: sReturn = "dm_setstr"; break;
        case 15: sReturn = "dm_setwis"; break;
        case 16: sReturn = "dm_setfort"; break;
        case 17: sReturn = "dm_setreflex"; break;
        case 18: sReturn = "dm_setwill"; break;
        case 19: sReturn = "dm_change_appear"; break;
        case 20: sReturn = "dm_givexp"; break;
        case 21: sReturn = "dm_takexp"; break;
        case 22: sReturn = "dm_givepartyxp"; break;
        case 23: sReturn = "dm_takepartyxp"; break;
        case 24: sReturn = "dm_givelevel"; break;
        case 25: sReturn = "dm_takelevel"; break;
        case 26: sReturn = "dm_givepartylevel"; break;
        case 27: sReturn = "dm_takepartylevel"; break;
        case 28: sReturn = "/l"; break;
        case 29: sReturn = "/m"; break;
        case 30: sReturn = "/v"; break;
        case 31: sReturn = COMMAND_SYMBOL + "setname"; break;
        case 32: sReturn = COMMAND_SYMBOL + "setnameall"; break;
        case 33: sReturn = "dm_create"; break;
        case 34: sReturn = "dm_spawn"; break;
        case 35: sReturn = "dm_sql"; break;
        case 36: sReturn = "dm_getvarint"; break;
        case 37: sReturn = "dm_getvarfloat"; break;
        case 38: sReturn = "dm_getvarstring"; break;
        case 39: sReturn = "dm_getvarmodint"; break;
        case 40: sReturn = "dm_getvarmodfloat"; break;
        case 41: sReturn = "dm_getvarmodstring"; break;
        case 42: sReturn = "dm_settime"; break;
        case 70: sReturn = "dm_setvarint"; break;
        case 71: sReturn = "dm_setvarfloat"; break;
        case 72: sReturn = "dm_setvarstring"; break;
        case 73: sReturn = "dm_setvarmodint"; break;
        case 74: sReturn = "dm_setvarmodfloat"; break;
        case 75: sReturn = "dm_setvarmodstring"; break;
    }
    return sReturn;
}

void DoCommandCompletion(object oCCPC, string sCCText, int nCommand)
{
    SetLocalString(oCCPC, "NWNX!CHAT!SUPRESS", "1");
    FloatingTextStringOnCreature(sCCText, oCCPC, FALSE);//so they can see what they entered without evading channel blocks
    int nStage = GetLocalInt(oCCPC, "FKY_CHAT_COMMAND_COM_STAGE");
    string sInject = GetLocalString(oCCPC, "FKY_CHAT_COMMAND_COM_TRACKING");
    if (nStage == 1)//add command and text and make the pc speak it
    {
        string sCommand = GetCommandString(nCommand);
        if (nCommand == 8 || nCommand == 9)//vfx numbers are intered after command, followed by dur type, duration, and subtype
        {
            while (GetStringLeft(sCCText, 1) == " ") sCCText = GetStringRight(sCCText, GetStringLength(sCCText) - 1);//parse out left spaces
            while (GetStringRight(sCCText, 1) == " ") sCCText = GetStringLeft(sCCText, GetStringLength(sCCText) - 1);//parse out right spaces
            string sFXType = GetLocalString(oCCPC, "FKY_CHAT_COMMAND_COM_FX_TYPE");
            string sFXSubType = GetLocalString(oCCPC, "FKY_CHAT_COMMAND_COM_FX_SUB");
            if (sFXType == "1") sFXType = sFXType + " " + sInject; //other two types, instant and permanent, already have dur set to 0 - (0 0 and 2 0)
            if (sFXSubType != "") sFXType = sFXType + " " + sFXSubType;
            sCommand = sCommand + " " + sCCText + " " + sFXType;
        }
        else
        {
            while (GetStringLeft(sCCText, 1) == " ") sCCText = GetStringRight(sCCText, GetStringLength(sCCText) - 1);//parse out left spaces
            if (sInject != "") sCommand = sCommand + " " + sInject;
            sCommand = sCommand + " " + sCCText;
        }
        //variable cleanup
        DeleteLocalInt(oCCPC, "FKY_CHAT_COMMAND_COMPLETE");
        DeleteLocalInt(oCCPC, "FKY_CHAT_COMMAND_COM_STAGE");
        DeleteLocalString(oCCPC, "FKY_CHAT_COMMAND_COM_TRACKING");
        DeleteLocalString(oCCPC, "FKY_CHAT_COMMAND_COM_FX_TYPE");
        DeleteLocalString(oCCPC, "FKY_CHAT_COMMAND_COM_FX_SUB");
        DeleteLocalInt(oCCPC, "FKY_CHAT_COMMAND_COM_FX_FUNC");//shouldn't ever still be here by now, just a failsafe
        DeleteLocalString(oCCPC, "FKY_CHAT_COMMAND_COM_MENU");//shouldn't ever still be here by now, just a failsafe
        //////////////////
        SetLocalString(oCCPC, "FKY_CHAT_COMMAND_EXE", sCommand);//set the command to speak on them
        DelayCommand(0.1, ExecuteScript("fky_chat_command", oCCPC));//this ensures the spoken string fires the chat script again
    }
    else if (nStage == 2)
    {
        string sPrompt;
        while (GetStringLeft(sCCText, 1) == " ") sCCText = GetStringRight(sCCText, GetStringLength(sCCText) - 1);//parse out left spaces
        while (GetStringRight(sCCText, 1) == " ") sCCText = GetStringLeft(sCCText, GetStringLength(sCCText) - 1);//parse out right spaces
        if (nCommand > 69) sPrompt = COMCOM17;
        else sPrompt = COMCOM5;
        SetLocalString(oCCPC, "FKY_CHAT_COMMAND_COM_TRACKING", sCCText);
        SetLocalInt(oCCPC, "FKY_CHAT_COMMAND_COM_STAGE", 1);//signal transition to last input stage
        FloatingTextStringOnCreature(COLOR_GOLD+sPrompt+COLOR_END, oCCPC, FALSE);
    }
}

void DoStealth(object oSPC, object oSTarget, string sSText, int nSChannel, string sSLogMessageTarget)
{
    SetLocalString(oSPC, "NWNX!CHAT!SUPRESS", "1");
    SendMessageToPC(oSPC, DMSTEALTH1);
    if (SEND_CHANNELS_TO_CHAT_LOG) SendChatLogMessage(oSTarget, COLOR_PURPLE+GetName(oSPC)+COLOR_END+COLOR_WHITE+DMSTEALTH2+sSText, GetMessenger());
    else SendMessageToPC(oSTarget, COLOR_PURPLE+GetName(oSPC)+COLOR_END+COLOR_WHITE+DMSTEALTH2+sSText);
    if (TEXT_LOGGING_ENABLED) DoLogging(oSPC, sSLogMessageTarget, nSChannel, sSText);
    DoCleanup(oSPC);
}

void HandleOtherSpeech(object oHOPC, object oHOTarget, string sHOText, int nHOChannel, string sHOLogMessageTarget)
{
        string sHOTarget, sEscape;
        switch(nHOChannel)//all speech besides emotes, player commands, and metachannels - sort by channel
        {
////////////Player speaker channels from 1-14
/*talk*/    case 1:
            if (ENABLE_METALANGUAGE_CONVERSION)
            {
                if (GetStringLowerCase(sHOText) == "lol" )
                {
                    SpeakString(LOL);
                    SetLocalString(oHOPC, "NWNX!CHAT!SUPRESS", "1");
                }
                else if (ENABLE_LANGUAGES) HandleTalkSpeak(sHOText, oHOPC);
            }
            else if (ENABLE_LANGUAGES) HandleTalkSpeak(sHOText, oHOPC);
            break;
/*shout*/   case 2:
            if (GetLocalInt(oHOPC, "FKY_CHT_BANSHOUT"))//check for shout ban
            {
                SetLocalString(oHOPC, "NWNX!CHAT!SUPRESS", "1");//mute em
                SendMessageToPC(oHOPC, COLOR_RED+BANNEDSHT+COLOR_END);//tell em
            }
            else if (GetIsSpam(sHOText) && SPAMBLOCK_ENABLED && (!VerifyDMKey(oHOPC)) && (!VerifyAdminKey(oHOPC))) DoSpamBan(oHOPC, sHOText);//check for advertising spam
            break;
/*whisper*/ case 3:
            if (ENABLE_LANGUAGES) HandleTalkSpeak(sHOText, oHOPC, TALKVOLUME_WHISPER);
            break;
/*tell*/    case 4:
            sHOTarget = GetPCPlayerName(oHOPC);
            if (GetLocalInt(oHOTarget, "FKY_CHT_IGNORE" + sHOTarget))//check for ignore
            {
                SetLocalString(oHOPC, "NWNX!CHAT!SUPRESS", "1");//mute em
                SendMessageToPC(oHOPC, COLOR_RED + GetName(oHOTarget)+ISIGNORED+COLOR_END);//tell em
            }
            //HandleDMTraffic(oHOPC, oHOTarget, sHOText, sHOLogMessageTarget, nHOChannel);//handles dm traffic and tell forwarding//now handled earlier
            DMTellForwarding(oHOPC, sHOLogMessageTarget, sHOText, nHOChannel); //check for tell options
            break;
/*party*/   case 6:
            if (ENABLE_LANGUAGES) HandlePartySpeak(sHOText, oHOPC);
            break;
/*dm*/      case 14:
            if (GetLocalInt(oHOPC, "FKY_CHT_BANDM"))//check for DM ban
            {
                SetLocalString(oHOPC, "NWNX!CHAT!SUPRESS", "1");//mute em
                SendMessageToPC(oHOPC, COLOR_RED+BANNEDDM+COLOR_END);//tell em
            }
            if (DM_PLAYERS_HEAR_DM) DMChannelForwardToDMs(oHOPC, sHOText);//check for dm players hearing dm
            if (ADMIN_PLAYERS_HEAR_DM) DMChannelForwardToAdmins(oHOPC, sHOText);//check for admin players hearing dm
            break;
////////////DM speaker channels from 17-30
/*talk*/    //case 17:
/*shout*/   //case 18:
/*whisper*/ //case 19:
/*tell*/    case 20:
            //HandleDMTraffic(oHOPC, oHOTarget, sHOText, sHOLogMessageTarget, nHOChannel);//handles dm traffic and tell forwarding//now handled earlier
            DMTellForwarding(oHOPC, sHOLogMessageTarget, sHOText, nHOChannel); //check for tell options
            break;
/*party*/   //case 22:
/*dm*/      case 30:
            if (DM_PLAYERS_HEAR_DM) DMChannelForwardToDMs(oHOPC, sHOText); //check for dm players hearing dm
            if (ADMIN_PLAYERS_HEAR_DM) DMChannelForwardToAdmins(oHOPC, sHOText);//check for admin players hearing dm
            break;
        }
        if (ENABLE_PERMANENT_CHANNEL_MUTING && GetIsChannelSuppressed(nHOChannel) && (!VerifyDMKey(oHOPC)) && (!VerifyAdminKey(oHOPC)) && (GetIsPC(oHOPC) || (!PERMANENT_CHANNEL_MUTING_FOR_PC_ONLY))) SetLocalString(oHOPC, "NWNX!CHAT!SUPRESS", "1");//if the channel is always suppressed then suppress it
        else if (DISALLOW_SPEECH_WHILE_DEAD && GetIsChannelDeadSuppressed(nHOChannel) && GetIsDead(oHOPC) && (!VerifyDMKey(oHOPC)) && (!VerifyAdminKey(oHOPC))) SetLocalString(oHOPC, "NWNX!CHAT!SUPRESS", "1");//otherwise suppress it when they are dead if it is deadsuppressed
        else if (DISALLOW_SPEECH_WHILE_SILENCED && GetIsChannelSilencedSuppressed(nHOChannel) && GetIsSilenced(oHOPC) && (!VerifyDMKey(oHOPC)) && (!VerifyAdminKey(oHOPC))) SetLocalString(oHOPC, "NWNX!CHAT!SUPRESS", "1");//otherwise suppress it when they are silenced if it is silencedsuppressed
}

//void main(){}

