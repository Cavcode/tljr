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
    object oPC = OBJECT_SELF;
    string sCDKey = GetPCPublicCDKey(oPC);
    Speech_OnClientEnter(oPC);
    int nPerm, nPerm2;
    if (USING_NWNX_DB)
    {
        nPerm = GetPersistentInt(GetModule(), "FKY_CHT_BANSHOUT" + sCDKey);
        nPerm2 = GetPersistentInt(GetModule(), "FKY_CHT_BANPLAYER" + sCDKey);;
        if (ENABLE_LANGUAGES) DoLanguageSetupNWNX(oPC);
    }
    else //using Bioware db
    {
        nPerm = GetCampaignInt("FKY_CHT", "FKY_CHT_BANSHOUT" + sCDKey);
        nPerm2 = GetCampaignInt("FKY_CHT", "FKY_CHT_BANPLAYER" + sCDKey);
        if (ENABLE_LANGUAGES) DoLanguageSetupBio(oPC);
    }
    if (nPerm) SetLocalInt(oPC, "FKY_CHT_BANSHOUT", TRUE);
    if (nPerm2 || GetLocalInt(oPC, "FKY_CHT_BANPLAYER")) DoBoot(oPC);//Boot them if Valid Object
    else if (VAULTPATH_CHAT != "")
    {
        string Script = GetLocalString(oPC, "LetoScript");
        if( Script != "" ) SetLocalString(oPC, "LetoScript", "");
    }
}
