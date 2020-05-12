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
    if (ENABLE_LANGUAGES)//check to see if they gained a level in a language class, and if so, add that language
    {
        object oPC = GetPCLevellingUp();
        if (USING_NWNX_DB)
        {
            if ((GetLevelByClass(CLASS_TYPE_RANGER, oPC) || GetLevelByClass(CLASS_TYPE_DRUID, oPC)) && (!GetLocalInt(oPC, "FKY_CHAT_LANG37")))
            {
                SetLocalInt(oPC, "FKY_CHAT_LANG37", TRUE);
                SetPersistentInt(oPC, "FKY_CHAT_LANG37", TRUE);
            }
            if (GetLevelByClass(CLASS_TYPE_ROGUE, oPC) && (!GetLocalInt(oPC, "FKY_CHAT_LANG44")))
            {
                SetLocalInt(oPC, "FKY_CHAT_LANG44", TRUE);
                SetPersistentInt(oPC, "FKY_CHAT_LANG44", TRUE);
            }
            if (GetLevelByClass(CLASS_TYPE_ASSASSIN, oPC) && (!GetLocalInt(oPC, "FKY_CHAT_LANG5")))
            {
                SetLocalInt(oPC, "FKY_CHAT_LANG5", TRUE);
                SetPersistentInt(oPC, "FKY_CHAT_LANG5", TRUE);
            }
            if (GetLevelByClass(CLASS_TYPE_DRUID, oPC) && (!GetLocalInt(oPC, "FKY_CHAT_LANG14")))
            {
                SetLocalInt(oPC, "FKY_CHAT_LANG14", TRUE);
                SetPersistentInt(oPC, "FKY_CHAT_LANG14", TRUE);
            }
            if ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) || GetLevelByClass(CLASS_TYPE_SORCERER, oPC) || GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)) && (!GetLocalInt(oPC, "FKY_CHAT_LANG71")))
            {
                SetLocalInt(oPC, "FKY_CHAT_LANG71", TRUE);
                SetPersistentInt(oPC, "FKY_CHAT_LANG71", TRUE);
            }
            if (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC) && (!GetLocalInt(oPC, "FKY_CHAT_LANG80")))
            {
                SetLocalInt(oPC, "FKY_CHAT_LANG80", TRUE);
                SetPersistentInt(oPC, "FKY_CHAT_LANG80", TRUE);
            }
        }
        else
        {
            object oStorage = GetItemPossessedBy(oPC, TAG_OF_LANGUAGE_STORAGE_OBJECT);
            if ((GetLevelByClass(CLASS_TYPE_RANGER, oPC) || GetLevelByClass(CLASS_TYPE_DRUID, oPC)) && (!GetLocalInt(oPC, "FKY_CHAT_LANG37")))
            {
                SetLocalInt(oPC, "FKY_CHAT_LANG37", TRUE);
                SetLocalInt(oStorage, "FKY_CHAT_LANG37", TRUE);
            }
            if (GetLevelByClass(CLASS_TYPE_ROGUE, oPC) && (!GetLocalInt(oPC, "FKY_CHAT_LANG44")))
            {
                SetLocalInt(oPC, "FKY_CHAT_LANG44", TRUE);
                SetLocalInt(oStorage, "FKY_CHAT_LANG44", TRUE);
            }
            if (GetLevelByClass(CLASS_TYPE_ASSASSIN, oPC) && (!GetLocalInt(oPC, "FKY_CHAT_LANG5")))
            {
                SetLocalInt(oPC, "FKY_CHAT_LANG5", TRUE);
                SetLocalInt(oStorage, "FKY_CHAT_LANG5", TRUE);
            }
            if (GetLevelByClass(CLASS_TYPE_DRUID, oPC) && (!GetLocalInt(oPC, "FKY_CHAT_LANG14")))
            {
                SetLocalInt(oPC, "FKY_CHAT_LANG14", TRUE);
                SetLocalInt(oStorage, "FKY_CHAT_LANG14", TRUE);
            }
            if ((GetLevelByClass(CLASS_TYPE_WIZARD, oPC) || GetLevelByClass(CLASS_TYPE_SORCERER, oPC) || GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)) && (!GetLocalInt(oPC, "FKY_CHAT_LANG71")))
            {
                SetLocalInt(oPC, "FKY_CHAT_LANG71", TRUE);
                SetLocalInt(oStorage, "FKY_CHAT_LANG71", TRUE);
            }
            if (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC) && (!GetLocalInt(oPC, "FKY_CHAT_LANG80")))
            {
                SetLocalInt(oPC, "FKY_CHAT_LANG80", TRUE);
                SetLocalInt(oStorage, "FKY_CHAT_LANG80", TRUE);
            }
        }
    }
}
