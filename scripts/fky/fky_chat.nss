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

void main()
{
//////////////////////////////////Declarations//////////////////////////////////
    object oPC = OBJECT_SELF, oTarget;// Speaker = oPC
    string sText, sLogMessage, sLogMessageTarget, sType, sSort;
    int nChannel, nTarget;
/////////////////////////Gather Message and Target Data/////////////////////////
    SetLocalString(oPC, "NWNX!CHAT!TEXT", Speech_GetSpacer()); // Query for chattext
    sText = GetLocalString(oPC, "NWNX!CHAT!TEXT"); // Get chattext
    nChannel = StringToInt(GetStringLeft(sText, 2)); // Get channel
    nTarget = StringToInt(GetSubString(sText, 2, 10)); // Target ID - Return value of -1 is no target. IE, not a tell/privatemessage
    sText = GetStringRight(sText, GetStringLength(sText) - 12);// Remove Target & Channel Info
    if( nTarget != -1 )// Acquire possible target
    {
        oTarget = Speech_GetPlayer(nTarget);
        sLogMessageTarget = "->" + GetName(oTarget) + "(" + GetPCPlayerName(oTarget) + ")";
///////////////////////////////////DM Stealth///////////////////////////////////
        if (GetLocalInt(oTarget, "FKY_CHAT_DMSTEALTH") && (oTarget != oPC)) {DoStealth(oPC, oTarget, sText, nChannel, sLogMessageTarget); return;}
    }
    sType = GetSubString(sText, 0, 1);//this is the primary sorting string, the leftmost letter of the text
///////////////////////////////Command Completion///////////////////////////////
    int nCompletion = GetLocalInt(oPC, "FKY_CHAT_COMMAND_COMPLETE");
    if (nCompletion) DoCommandCompletion(oPC, sText, nCompletion);
////////////////////////////////Speech Processing///////////////////////////////
    else if (sType == EMOTE_SYMBOL) HandleEmotes(oPC, sText, nChannel);//emotes - taken from Emote-Wand V1000 UpDate Scripted By: Butch (with edits)
    else if (sType == COMMAND_SYMBOL) HandleCommands(oPC, oTarget, sText, nChannel);//commands
    else if (sType == "/")// metachannels and languages
    {
        SetLocalString(oPC, "NWNX!CHAT!SUPRESS", "1");
        sText = GetStringRight(sText, GetStringLength(sText) - 1);
        sSort = GetStringLeft(sText, 2);
        if (ENABLE_LANGUAGES && sSort == "l ") HandleOneLiners(sText, oPC, nChannel);//must be a space after the /l
        else if (ENABLE_METACHANNELS && sSort == "m ") HandleMetaMessage(sText, oPC);//must be a space after the /m
        else if ((VerifyDMKey(oPC) || VerifyAdminKey(oPC)) && sSort == "v ") HandleVentrilo(sText, oPC);//must be a space after the /m
        else FloatingTextStringOnCreature(COLOR_RED+BADCHANNEL+COLOR_END, oPC, FALSE);
    }
    else if ((GetStringLowerCase(GetStringLeft(sText, 3)) == "dm_") && (VerifyDMKey(oPC) || VerifyAdminKey(oPC)))
    {
        //HandleDMTraffic(oPC, oTarget, sText);//this has been moved to a new script to allow compiler to digest it
        SetLocalObject(oPC, "FKY_CHAT_DMSHUNT_TARGET", oTarget);//these locals pass the needed values to the new script
        SetLocalString(oPC, "FKY_CHAT_DMSHUNT_TEXT", sText);
        ExecuteScript("fky_chat_dm_comm", oPC);
    }
    else HandleOtherSpeech(oPC, oTarget, sText, nChannel, sLogMessageTarget);
////////////////////////////////////Logging/////////////////////////////////////
    if (TEXT_LOGGING_ENABLED) DoLogging(oPC, sLogMessageTarget, nChannel, sText);
////////////////////////////////////Cleanup/////////////////////////////////////
    DoCleanup(oPC);
}
