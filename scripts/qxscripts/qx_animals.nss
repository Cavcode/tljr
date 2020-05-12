#include "nwnx_creature"

const int NW_AC_BADGER_APP      = 1299;     //Korrina
const int NW_AC_WOLF_APP        = 2023;     //MyKal
const int NW_AC_BEAR_APP        = 2020;     //Kath-Hound
const int NW_AC_BOAR_APP        = 2021;     //Kinrath

const int bDebug = TRUE;

void main()
{
    object oAnimal = OBJECT_SELF;
    string sTag = GetTag(oAnimal);
    object oPC  = GetMaster(oAnimal);
    int iLvl = GetLevelByClass(CLASS_TYPE_DRUID, oPC) + GetLevelByClass(CLASS_TYPE_RANGER, oPC);

    if (bDebug)
    {
        SendMessageToPC(oPC, "In qx_animals");
    }

    //Korrina
    if(GetSubString(sTag,0,10) == "NW_AC_BADG")
    {
        SetCreatureAppearanceType(oAnimal, NW_AC_BADGER_APP);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_CHARISMA, 4);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_CONSTITUTION, 10 + iLvl/2);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_DEXTERITY, 14 + iLvl);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_INTELLIGENCE, 6 + iLvl/2);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_STRENGTH, 14 + iLvl);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_WISDOM, 4);
        DelayCommand(20.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAttackIncrease(iLvl/2)), oAnimal));
        DelayCommand(25.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectDamage(iLvl/2)), oAnimal));
        NWNX_Creature_SetSoundset(oAnimal,18);
        SetPortraitId(oAnimal,166);
        //SetRacialType(oDroid,RACIAL_TYPE_CONSTRUCT);
        //SetCreatureSize(oDroid, CREATURE_SIZE_MEDIUM);
        //oBlaster = CreateItemOnObject("fam_blaster_lg1", oDroid);
        //SetDroppableFlag(oBlaster, FALSE);
        //AssignCommand(oDroid, ActionEquipItem(oBlaster, INVENTORY_SLOT_RIGHTHAND));
    }

    //MyKal
    if(GetSubString(sTag,0,10) == "NW_AC_WOLF")
    {
        SetCreatureAppearanceType(oAnimal, NW_AC_WOLF_APP);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_CHARISMA, 4);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_CONSTITUTION, 6 + iLvl/2);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_DEXTERITY, 16 + iLvl);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_INTELLIGENCE, 14 + iLvl/2);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_STRENGTH, 16 + iLvl);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_WISDOM, 4);
        //DelayCommand(20.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAttackIncrease(iLvl/2)), oAnimal));
        //DelayCommand(25.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectDamage(iLvl/2)), oAnimal));
        NWNX_Creature_SetSoundset(oAnimal,6);
        SetPortraitId(oAnimal,145);
        NWNX_Creature_SetSkillRank(oAnimal, SKILL_HIDE, iLvl);
        NWNX_Creature_SetSkillRank(oAnimal, SKILL_MOVE_SILENTLY, iLvl);
        NWNX_Creature_SetSkillRank(oAnimal, SKILL_LISTEN, iLvl);
        NWNX_Creature_SetSkillRank(oAnimal, SKILL_SEARCH, iLvl);
        NWNX_Creature_SetSkillRank(oAnimal, SKILL_SPOT, iLvl);
        //SetRacialType(oDroid,RACIAL_TYPE_CONSTRUCT);
        //SetCreatureSize(oDroid, CREATURE_SIZE_MEDIUM);
        //oBlaster = CreateItemOnObject("fam_blaster_lg1", oDroid);
        //SetDroppableFlag(oBlaster, FALSE);
        //AssignCommand(oDroid, ActionEquipItem(oBlaster, INVENTORY_SLOT_RIGHTHAND));
    }

    //Kath-Hound
    if(GetSubString(sTag,0,10) == "NW_AC_BEAR")
    {
        SetCreatureAppearanceType(oAnimal, NW_AC_BEAR_APP);
        //DelayCommand(20.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAttackIncrease(iLvl/2)), oAnimal));
        //DelayCommand(25.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectDamage(iLvl/2)), oAnimal));
        NWNX_Creature_SetSoundset(oAnimal,919);
        SetPortraitId(oAnimal,184);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_CHARISMA, 4);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_CONSTITUTION, 10 + iLvl);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_DEXTERITY, 14 + iLvl/2);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_INTELLIGENCE, 6 + iLvl/2);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_STRENGTH, 12 + iLvl);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_WISDOM, 4);
        NWNX_Creature_SetBaseAC(oAnimal, 5 + iLvl/2);
        //SetMaxHitPoints(oAnimal, iLvl * 12);
        //SetCurrentHitPoints(oAnimal, iLvl * 12 + iLvl * 2);
    }

    //Kinrath
    if(GetSubString(sTag,0,10) == "NW_AC_BOAR")
    {
        SetCreatureAppearanceType(oAnimal, NW_AC_BOAR_APP);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_CHARISMA, 4);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_CONSTITUTION, 12 + iLvl);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_DEXTERITY, 14 + iLvl);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_INTELLIGENCE, 10 + iLvl/2);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_STRENGTH, 14 + iLvl);
        NWNX_Creature_SetAbilityScore(oAnimal, ABILITY_WISDOM, 4);
        NWNX_Creature_SetMaxHitPointsByLevel(oAnimal, 5, iLvl * 12);
    }
}
