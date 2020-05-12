#include "nwnx_creature"

const int NW_FM_BAT_APP     = 10015;     //Assassin
const int NW_FM_CRAG_APP    = 9000;      //Battle
const int NW_FM_HELL_APP    = 10016;     //Spider
const int NW_FM_IMP_APP     = 2187;      //Sentry
const int NW_FM_FIRE_APP    = 2155;     //Astromech

const int SKILL_REPAIR      = 28;

const int bDebug = TRUE;

void main()
{
    object oDroid = OBJECT_SELF;
    string sTag = GetTag(oDroid);
    object oPC  = GetMaster(oDroid);
    int iLvl = GetLevelByClass(CLASS_TYPE_WIZARD, oPC);
    int iSkill = GetSkillRank(SKILL_REPAIR , oPC);
    object oBlaster;

    if (bDebug)
    {
        SendMessageToPC(oPC, "In qx_familiars");
    }

    //Assassin Droid
    if(GetSubString(sTag,0,9) == "NW_FM_BAT")
    {
        SetCreatureAppearanceType(oDroid, NW_FM_BAT_APP);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_MARTIAL);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_CREATURE);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_DRUID);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_ELF);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_EXOTIC);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_MONK);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_ROGUE);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_SIMPLE);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_WIZARD);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_CHARISMA, 4);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_CONSTITUTION, 6 + iLvl/2);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_DEXTERITY, 10 + iLvl);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_INTELLIGENCE, 6 + iLvl/2);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_STRENGTH, 6 + iLvl/2);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_WISDOM, 4);
        DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAttackIncrease(iLvl/2)), oDroid));
        DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectDamage(iLvl/2)), oDroid));
        NWNX_Creature_SetSoundset(oDroid,855);
        SetPortraitId(oDroid,2221);
        NWNX_Creature_SetRacialType(oDroid,RACIAL_TYPE_CONSTRUCT);
        NWNX_Creature_SetSize(oDroid, CREATURE_SIZE_MEDIUM);
        oBlaster = CreateItemOnObject("fam_blaster_lg1", oDroid);
        SetDroppableFlag(oBlaster, FALSE);
        DelayCommand(2.0,AssignCommand(oDroid, ActionEquipItem(oBlaster, INVENTORY_SLOT_RIGHTHAND)));
    }

    //Battle Droid
    if(GetSubString(sTag,0,9) == "NW_FM_CRA")
    {
        SetCreatureAppearanceType(oDroid, NW_FM_CRAG_APP);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_MARTIAL);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_CREATURE);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_DRUID);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_ELF);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_EXOTIC);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_MONK);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_ROGUE);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_SIMPLE);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_WIZARD);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_CHARISMA, 4);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_CONSTITUTION, 10 + iLvl);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_DEXTERITY, 10 + iLvl/2);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_INTELLIGENCE, 6 + iLvl/2);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_STRENGTH, 10 + iLvl/2);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_WISDOM, 4);
        NWNX_Creature_SetBaseAC(oDroid, 15 + iLvl/2);
        //SetMaxHitPoints(oDroid, iLvl * 12);
        //SetCurrentHitPoints(oDroid, iLvl * 12 + iLvl * 2);
        NWNX_Creature_SetSoundset(oDroid,855);
        SetPortraitId(oDroid,2119);
        NWNX_Creature_SetRacialType(oDroid,RACIAL_TYPE_CONSTRUCT);
        NWNX_Creature_SetSize(oDroid, CREATURE_SIZE_MEDIUM);
        oBlaster = CreateItemOnObject("fam_blaster_lg1", oDroid);
        SetDroppableFlag(oBlaster, FALSE);
        DelayCommand(2.0,AssignCommand(oDroid, ActionEquipItem(oBlaster, INVENTORY_SLOT_RIGHTHAND)));
    }

    //Spider Droid
    if(GetSubString(sTag,0,9) == "NW_FM_HEL")
    {
        SetCreatureAppearanceType(oDroid, NW_FM_HELL_APP);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_MARTIAL);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_CREATURE);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_DRUID);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_ELF);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_EXOTIC);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_MONK);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_ROGUE);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_SIMPLE);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_WIZARD);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_CHARISMA, 4);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_CONSTITUTION, 6 + iLvl);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_DEXTERITY, 6 + iLvl);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_INTELLIGENCE, 6 + iLvl/2);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_STRENGTH, 6 + iLvl);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_WISDOM, 4);
        NWNX_Creature_SetSoundset(oDroid,924);
        SetPortraitId(oDroid,2089);
        NWNX_Creature_SetRacialType(oDroid,RACIAL_TYPE_CONSTRUCT);
        NWNX_Creature_SetSize(oDroid, CREATURE_SIZE_MEDIUM);
        oBlaster = CreateItemOnObject("fam_blaster_lg1", oDroid);
        SetDroppableFlag(oBlaster, FALSE);
        DelayCommand(2.0,AssignCommand(oDroid, ActionEquipItem(oBlaster, INVENTORY_SLOT_RIGHTHAND)));
    }

    //Sentry Droid
    if(GetSubString(sTag,0,9) == "NW_FM_IMP")
    {
        SetCreatureAppearanceType(oDroid, NW_FM_IMP_APP);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_MARTIAL);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_CREATURE);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_DRUID);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_ELF);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_EXOTIC);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_MONK);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_ROGUE);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_SIMPLE);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_WIZARD);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_CHARISMA, 4);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_CONSTITUTION, 6 + iLvl/2);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_DEXTERITY, 6 + iLvl);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_INTELLIGENCE, 6 + iLvl);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_STRENGTH, 6 + iLvl/2);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_WISDOM, 4);
        NWNX_Creature_SetSkillRank(oDroid, SKILL_HIDE, iLvl);
        NWNX_Creature_SetSkillRank(oDroid, SKILL_MOVE_SILENTLY, iLvl);
        NWNX_Creature_SetSkillRank(oDroid, SKILL_LISTEN, iLvl);
        NWNX_Creature_SetSkillRank(oDroid, SKILL_SEARCH, iLvl);
        NWNX_Creature_SetSkillRank(oDroid, SKILL_SPOT, iLvl);
        NWNX_Creature_AddFeat(oDroid, FEAT_HIDE_IN_PLAIN_SIGHT);
        NWNX_Creature_SetSoundset(oDroid,850);
        SetPortraitId(oDroid,318);
        NWNX_Creature_SetRacialType(oDroid,RACIAL_TYPE_CONSTRUCT);
        NWNX_Creature_SetSize(oDroid, CREATURE_SIZE_MEDIUM);
        oBlaster = CreateItemOnObject("fam_blaster_lg1", oDroid);
        SetDroppableFlag(oBlaster, FALSE);
        DelayCommand(2.0,AssignCommand(oDroid, ActionEquipItem(oBlaster, INVENTORY_SLOT_RIGHTHAND)));
    }

    //Astromech Droid
    if(GetSubString(sTag,0,9) == "NW_FM_FIR")
    {
        SetCreatureAppearanceType(oDroid, NW_FM_FIRE_APP);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_MARTIAL);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_CREATURE);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_DRUID);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_ELF);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_EXOTIC);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_MONK);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_ROGUE);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_SIMPLE);
        NWNX_Creature_AddFeat(oDroid, FEAT_WEAPON_PROFICIENCY_WIZARD);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_CHARISMA, 4);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_CONSTITUTION, 10 + iLvl/2);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_DEXTERITY, 6 + iLvl/2);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_INTELLIGENCE, 10 + iLvl);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_STRENGTH, 6 + iLvl/2);
        NWNX_Creature_SetRawAbilityScore(oDroid, ABILITY_WISDOM, 4 + iLvl/2);
        NWNX_Creature_SetSkillRank(oDroid, SKILL_REPAIR, iLvl);
        NWNX_Creature_SetSkillRank(oDroid, SKILL_SEARCH, iLvl/2);
        NWNX_Creature_SetSkillRank(oDroid, SKILL_SPOT, iLvl/2);
        NWNX_Creature_SetSkillRank(oDroid, SKILL_OPEN_LOCK, iLvl);
        NWNX_Creature_SetSkillRank(oDroid, SKILL_DISABLE_TRAP, iLvl);
        NWNX_Creature_SetSkillRank(oDroid, SKILL_LISTEN, iLvl/2);
        NWNX_Creature_SetSkillRank(oDroid, SKILL_SET_TRAP, iLvl);
        NWNX_Creature_SetSkillRank(oDroid, SKILL_USE_MAGIC_DEVICE, iLvl/2);
        NWNX_Creature_SetSoundset(oDroid,213);
        SetPortraitId(oDroid,3782);
        NWNX_Creature_SetRacialType(oDroid,RACIAL_TYPE_CONSTRUCT);
        NWNX_Creature_SetSize(oDroid, CREATURE_SIZE_MEDIUM);
        oBlaster = CreateItemOnObject("fam_blaster_lg1", oDroid);
        SetDroppableFlag(oBlaster, FALSE);
        DelayCommand(2.0,AssignCommand(oDroid, ActionEquipItem(oBlaster, INVENTORY_SLOT_RIGHTHAND)));
    }

}
