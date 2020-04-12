//void main(){}

#include "pug_inc"
#include "x2_inc_itemprop"
#include "nwnx_creature"
#include "nwnx_effect"

const int FEAT_MARTIAL_ARTS = 1303;
const int FEAT_MARTIAL_ARTS_IMP = 1304;
const int FEAT_MARTIAL_ARTS_DEFENSIVE = 1305;
const int FEAT_GEARHEAD = 1306;
const int FEAT_ILLICIT_BARTER = 1310;
const int FEAT_SKILL_EMPHASIS_SCOUNDREL = 1311;
const int FEAT_SHARP_EYE = 1313;
const int FEAT_ARMOR_OPTIMIZATION = 1314;
const int FEAT_CONDITIONING = 1315;
const int FEAT_CONDITIONING_IMP = 1316;
const int FEAT_DUELING = 1317;
const int FEAT_DUELING_IMP = 1318;

const int SPELL_GEARHEAD = 1800;
const int SPELL_ILLICIT_BARTER = 1801;
const int SPELL_SKILL_EMPHASIS = 1802;
const int SPELL_MARTIAL_ARTS = 1803;
const int SPELL_MARTIAL_ARTS_IMP = 1804;
const int SPELL_DUELING = 1805;
const int SPELL_SHARP_EYE = 1806;
const int SPELL_ARMOR_OPTIMIZATION = 1807;


// Main Driver Function for Passives
void CheckFeats(object oPC);
// Passives - General
void CheckCustomFeats(object oPC);
// Skills
void CheckCustomSkills(object oPC);
// Saves
void CheckCustomSaves(object oPC);
// Handle Martial Arts Feats
void CheckMartialArts(object oPC);

////////////////////// FUNCTIONS //////////////////////////////////////
void CheckFeats(object oPC)
{
    // Main Driver Function
    CheckCustomSaves(oPC);
    CheckCustomSkills(oPC);
    CheckCustomFeats(oPC);
    CheckMartialArts(oPC);
    DelayCommand(2.0, CheckCustomFeats(oPC));
}

void CheckCustomSkills(object oPC)
{
    int nAmount;
    effect eSkill, eLink;
    effect eRemove;

    // Remove Skill Bonuses given below to prevent stacking
    eRemove = GetFirstEffect(oPC);
    while (GetIsEffectValid(eRemove) == TRUE)
    {
        if (GetEffectSpellId(eRemove) == SPELL_GEARHEAD ||
            GetEffectSpellId(eRemove) == SPELL_ILLICIT_BARTER ||
            GetEffectSpellId(eRemove) == SPELL_SKILL_EMPHASIS)
            {
                RemoveEffect(oPC, eRemove);
            }
        eRemove = GetNextEffect(oPC);
    }
    // Apply appropriate Skill Bonuses
    if (GetHasFeat(FEAT_GEARHEAD, oPC) == TRUE)
        {
            eSkill = EffectSkillIncrease(28,2);
            eLink = EffectSkillIncrease(7,2);
            eLink = EffectLinkEffects(eLink, eSkill);
            eLink = SupernaturalEffect(eLink);
            struct NWNX_EffectUnpacked effectO = NWNX_Effect_UnpackEffect(eLink);
            effectO.nSpellId = SPELL_GEARHEAD;
            eLink = NWNX_Effect_PackEffect(effectO);
            //SetEffectSpellId(eLink,SPELL_GEARHEAD);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oPC);
        }
    if (GetHasFeat(FEAT_ILLICIT_BARTER, oPC) == TRUE)
        {
            eSkill = EffectSkillIncrease(20,5);
            eLink = eSkill;
            eLink = SupernaturalEffect(eLink);
            struct NWNX_EffectUnpacked effectO = NWNX_Effect_UnpackEffect(eLink);
            effectO.nSpellId = SPELL_ILLICIT_BARTER;
            eLink = NWNX_Effect_PackEffect(effectO);
            //SetEffectSpellId(eLink,SPELL_ILLICIT_BARTER);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oPC);
        }
    if (GetHasFeat(FEAT_SKILL_EMPHASIS_SCOUNDREL, oPC) == TRUE)
        {
            eSkill = EffectSkillIncrease(1,3);
            eLink  = EffectSkillIncrease(2,3);
            eLink  = EffectLinkEffects(eLink, eSkill);
            eSkill = EffectSkillIncrease( 4, 3);
            eLink  = EffectLinkEffects(eLink, eSkill);
            eSkill = EffectSkillIncrease( 5, 3);
            eLink  = EffectLinkEffects(eLink, eSkill);
            eSkill = EffectSkillIncrease( 6, 3);
            eLink  = EffectLinkEffects(eLink, eSkill);
            eSkill = EffectSkillIncrease( 7, 3);
            eLink  = EffectLinkEffects(eLink, eSkill);
            eSkill = EffectSkillIncrease( 8, 3);
            eLink  = EffectLinkEffects(eLink, eSkill);
            eSkill = EffectSkillIncrease( 9, 3);
            eLink  = EffectLinkEffects(eLink, eSkill);
            eSkill = EffectSkillIncrease( 10, 3);
            eLink  = EffectLinkEffects(eLink, eSkill);
            eSkill = EffectSkillIncrease( 12, 3);
            eLink  = EffectLinkEffects(eLink, eSkill);
            eSkill = EffectSkillIncrease( 14, 3);
            eLink  = EffectLinkEffects(eLink, eSkill);
            eSkill = EffectSkillIncrease( 15, 3);
            eLink  = EffectLinkEffects(eLink, eSkill);
            eSkill = EffectSkillIncrease( 17, 3);
            eLink  = EffectLinkEffects(eLink, eSkill);
            eSkill = EffectSkillIncrease( 19, 3);
            eLink  = EffectLinkEffects(eLink, eSkill);
            eLink = SupernaturalEffect(eLink);
            struct NWNX_EffectUnpacked effectO = NWNX_Effect_UnpackEffect(eLink);
            effectO.nSpellId = SPELL_SKILL_EMPHASIS;
            eLink = NWNX_Effect_PackEffect(effectO);
            //SetEffectSpellId(eLink,SPELL_SKILL_EMPHASIS);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oPC);
        }
} // End CheckCustomSkills()

void CheckCustomSaves(object oPC)
{
    int temp = 0;
    if (GetHasFeat(FEAT_CONDITIONING, oPC) == TRUE && GetCampaignInt("starwarsfeats", "FEAT_"+IntToString(FEAT_CONDITIONING), oPC) == FALSE)
        {
        temp = NWNX_Creature_GetBaseSavingThrow(oPC,SAVING_THROW_WILL);
        temp += 1;
        NWNX_Creature_SetBaseSavingThrow(oPC,SAVING_THROW_WILL, temp);

        temp = NWNX_Creature_GetBaseSavingThrow(oPC,SAVING_THROW_FORT);
        temp += 1;
        NWNX_Creature_SetBaseSavingThrow(oPC,SAVING_THROW_FORT, temp);

        temp = NWNX_Creature_GetBaseSavingThrow(oPC,SAVING_THROW_REFLEX);
        temp += 1;
        NWNX_Creature_SetBaseSavingThrow(oPC,SAVING_THROW_REFLEX, temp);

        SetCampaignInt("starwarsfeats", "FEAT_"+IntToString(FEAT_CONDITIONING), TRUE,oPC);
        }
    else if (GetHasFeat(FEAT_CONDITIONING, oPC) == FALSE && GetCampaignInt("starwarsfeats", "FEAT_"+IntToString(FEAT_CONDITIONING), oPC) == TRUE)
        {
        temp = NWNX_Creature_GetBaseSavingThrow(oPC,SAVING_THROW_WILL);
        temp -= 1;
        NWNX_Creature_SetBaseSavingThrow(oPC,SAVING_THROW_WILL, temp);

        temp = NWNX_Creature_GetBaseSavingThrow(oPC,SAVING_THROW_FORT);
        temp -= 1;
        NWNX_Creature_SetBaseSavingThrow(oPC,SAVING_THROW_FORT, temp);

        temp = NWNX_Creature_GetBaseSavingThrow(oPC,SAVING_THROW_REFLEX);
        temp -= 1;
        NWNX_Creature_SetBaseSavingThrow(oPC,SAVING_THROW_REFLEX, temp);

        SetCampaignInt("starwarsfeats", "FEAT_"+IntToString(FEAT_CONDITIONING), FALSE,oPC);
        }
    if (GetHasFeat(FEAT_CONDITIONING_IMP, oPC) == TRUE && GetCampaignInt("starwarsfeats", "FEAT_"+IntToString(FEAT_CONDITIONING_IMP), oPC) == FALSE)
        {
        temp = NWNX_Creature_GetBaseSavingThrow(oPC,SAVING_THROW_WILL);
        temp += 3;
        NWNX_Creature_SetBaseSavingThrow(oPC,SAVING_THROW_WILL, temp);

        temp = NWNX_Creature_GetBaseSavingThrow(oPC,SAVING_THROW_FORT);
        temp += 3;
        NWNX_Creature_SetBaseSavingThrow(oPC,SAVING_THROW_FORT, temp);

        temp = NWNX_Creature_GetBaseSavingThrow(oPC,SAVING_THROW_REFLEX);
        temp += 3;
        NWNX_Creature_SetBaseSavingThrow(oPC,SAVING_THROW_REFLEX, temp);

        SetCampaignInt("starwarsfeats", "FEAT_"+IntToString(FEAT_CONDITIONING_IMP), TRUE,oPC);
        }
    else if (GetHasFeat(FEAT_CONDITIONING_IMP, oPC) == FALSE && GetCampaignInt("starwarsfeats", "FEAT_"+IntToString(FEAT_CONDITIONING_IMP), oPC) == TRUE)
        {
        temp = NWNX_Creature_GetBaseSavingThrow(oPC,SAVING_THROW_WILL);
        temp -= 3;
        NWNX_Creature_SetBaseSavingThrow(oPC,SAVING_THROW_WILL, temp);

        temp = NWNX_Creature_GetBaseSavingThrow(oPC,SAVING_THROW_FORT);
        temp -= 3;
        NWNX_Creature_SetBaseSavingThrow(oPC,SAVING_THROW_FORT, temp);

        temp = NWNX_Creature_GetBaseSavingThrow(oPC,SAVING_THROW_REFLEX);
        temp -= 3;
        NWNX_Creature_SetBaseSavingThrow(oPC,SAVING_THROW_REFLEX, temp);

        SetCampaignInt("starwarsfeats", "FEAT_"+IntToString(FEAT_CONDITIONING_IMP), FALSE,oPC);
        }
} // End CheckCustomSaves()

void CheckMartialArts(object oPC)
{
    // Offensive Martial Arts
    object oItem1;
    object oItemC = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oPC);
    object oNewItem;
    int bMA1 = NWNX_Creature_GetKnowsFeat(oPC, FEAT_MARTIAL_ARTS);
    int bMA2 = NWNX_Creature_GetKnowsFeat(oPC, FEAT_MARTIAL_ARTS_IMP);
    int bContinue;

    oItem1 = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oItem1) == TRUE)
    {
        if (oItem1 != oItemC)
        {
            if (GetTag(oItem1) == "MARTIAL_ARTS" || GetTag(oItem1) == "MARTIAL_ARTS_IMP")
            {
                DestroyObject(oItem1);
            }
        }
        oItem1 = GetNextItemInInventory(oPC);
    }

    if (GetLocalInt(oPC, "EQUIP_MARTIAL_ARTS") == FALSE)
    {
    if ((GetTag(oItemC) == "MARTIAL_ARTS" && bMA1 == TRUE) ||
        (GetTag(oItemC) == "MARTIAL_ARTS_IMP" && bMA2 == TRUE))
    {
        bContinue = FALSE;
    }
    else
    {
        oItem1 = GetFirstItemInInventory(oPC);
        while (GetIsObjectValid(oItem1) == TRUE)
        {
            if (GetTag(oItem1) == "MARTIAL_ARTS" || GetTag(oItem1) == "MARTIAL_ARTS_IMP")
            {
                DestroyObject(oItem1);
            }
            oItem1 = GetNextItemInInventory(oPC);
        }

        if (bMA1 || bMA2)
        {
            if (NWNX_Creature_GetKnowsFeat(oPC,FEAT_WEAPON_PROFICIENCY_CREATURE) == FALSE)
            {
                NWNX_Creature_AddFeatByLevel(oPC, FEAT_WEAPON_PROFICIENCY_CREATURE,-1);
            }
        }
        if (bMA2){oNewItem = CreateItemOnObject("MARTIAL_ARTS_IMP", oPC, 1);}
        else if (bMA1){oNewItem = CreateItemOnObject("MARTIAL_ARTS", oPC, 1);}

        if (GetIsObjectValid(oNewItem) == TRUE)
        {
            SetLocalInt(oPC, "EQUIP_MARTIAL_ARTS", TRUE);
            DelayCommand(2.0, SetDroppableFlag(oNewItem, FALSE));
            DelayCommand(2.5, AssignCommand(oPC, ActionEquipItem(oNewItem ,INVENTORY_SLOT_CWEAPON_L)));
            DelayCommand(3.0, SetLocalInt(oPC, "EQUIP_MARTIAL_ARTS", FALSE));
            DelayCommand(3.5, SendMessageToPC(oPC, "Item: " + GetName(GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oPC)) + " equipped successfully."));
        }
      }
    }

    // Defensive Martial Arts
    int temp = 0;

    if (NWNX_Creature_GetKnowsFeat(oPC,FEAT_MARTIAL_ARTS_DEFENSIVE) == TRUE && GetCampaignInt("starwarsfeats", "FEAT_"+IntToString(FEAT_MARTIAL_ARTS_DEFENSIVE), oPC) == FALSE)
    {
        temp = NWNX_Creature_GetBaseAC(oPC);
        temp +=2;
        NWNX_Creature_SetBaseAC(oPC, temp);

        SetCampaignInt("starwarsfeats", "FEAT_"+IntToString(FEAT_MARTIAL_ARTS_DEFENSIVE), TRUE,oPC);
    }
    else if (NWNX_Creature_GetKnowsFeat(oPC,FEAT_MARTIAL_ARTS_DEFENSIVE) == FALSE && GetCampaignInt("starwarsfeats", "FEAT_"+IntToString(FEAT_MARTIAL_ARTS_DEFENSIVE), oPC) == TRUE)
    {
        temp = NWNX_Creature_GetBaseAC(oPC);
        temp -=2;
        NWNX_Creature_SetBaseAC(oPC, temp);

        SetCampaignInt("starwarsfeats", "FEAT_"+IntToString(FEAT_MARTIAL_ARTS_DEFENSIVE), FALSE,oPC);
    }
} // End CheckMartialArts()

void CheckCustomFeats(object oPC)
{
    object oItem, oItemOffhand;
    effect eRemove;
    effect eBonus, eLink;
    // Remove Bonuses given below to prevent stacking
    eRemove = GetFirstEffect(oPC);
    while (GetIsEffectValid(eRemove) == TRUE)
    {
        if (GetEffectSpellId(eRemove) == SPELL_SHARP_EYE ||
            GetEffectSpellId(eRemove) == SPELL_DUELING ||
            GetEffectSpellId(eRemove) == SPELL_ARMOR_OPTIMIZATION)
            {
                RemoveEffect(oPC, eRemove);
            }
        eRemove = GetNextEffect(oPC);
    }
    // Apply appropriate Skill Bonuses
    if (NWNX_Creature_GetKnowsFeat(oPC,FEAT_SHARP_EYE) == TRUE)
    {
        oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
        if (GetIsObjectValid(oItem) == TRUE)
        {
            if (GetBaseItemType(oItem) == BASE_ITEM_SLING ||
                GetBaseItemType(oItem) == BASE_ITEM_LONGBOW ||
                GetBaseItemType(oItem) == BASE_ITEM_SHORTBOW ||
                GetBaseItemType(oItem) == BASE_ITEM_THROWINGAXE ||
                GetBaseItemType(oItem) == BASE_ITEM_HEAVYCROSSBOW ||
                GetBaseItemType(oItem) == BASE_ITEM_LIGHTCROSSBOW ||
                GetBaseItemType(oItem) == BASE_ITEM_SHURIKEN ||
                GetBaseItemType(oItem) == BASE_ITEM_DART)
                {
                    eBonus = EffectAttackIncrease(3, ATTACK_BONUS_MISC);
                    eLink = eBonus;
                    eLink = SupernaturalEffect(eLink);
                    struct NWNX_EffectUnpacked effectO = NWNX_Effect_UnpackEffect(eLink);
                    effectO.nSpellId = SPELL_SHARP_EYE;
                    eLink = NWNX_Effect_PackEffect(effectO);
                    //SetEffectSpellId(eLink,SPELL_SHARP_EYE);
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oPC);
                }
        }
    }
    if (NWNX_Creature_GetKnowsFeat(oPC,FEAT_DUELING) == TRUE || NWNX_Creature_GetKnowsFeat(oPC,FEAT_DUELING_IMP) == TRUE)
    {
        oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
        oItemOffhand = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
        int nAB = 0, nAC = 0;
        int bDual1 = NWNX_Creature_GetKnowsFeat(oPC,FEAT_DUELING);
        int bDual2 = NWNX_Creature_GetKnowsFeat(oPC,FEAT_DUELING_IMP);

        if (bDual2){ nAB = 3; nAC = 2; }
        else if (bDual1){ nAB = 1; nAC = 1; }

        if (IPGetIsMeleeWeapon(oItem) && !GetIsObjectValid(oItemOffhand))
        {
            eBonus = EffectAttackIncrease(nAB);
            eLink  = EffectACIncrease(nAC);
            eLink  = EffectLinkEffects(eLink, eBonus);
            eLink  = SupernaturalEffect(eLink);
            struct NWNX_EffectUnpacked effectO = NWNX_Effect_UnpackEffect(eLink);
            effectO.nSpellId = SPELL_DUELING;
            eLink = NWNX_Effect_PackEffect(effectO);
            //SetEffectSpellId(eLink,SPELL_DUELING);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oPC);
        }
    }
    if (NWNX_Creature_GetKnowsFeat(oPC,FEAT_ARMOR_OPTIMIZATION) == TRUE)
    {
        int nAC = 0;
        oItem = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
        if (GetIsObjectValid(oItem) == TRUE){ nAC = GetArmorType(oItem); }

        if (nAC <= 3)
        {
            eBonus = EffectACIncrease(2);
            eLink  = eBonus;
            eLink  = SupernaturalEffect(eLink);
            struct NWNX_EffectUnpacked effectO = NWNX_Effect_UnpackEffect(eLink);
            effectO.nSpellId = SPELL_ARMOR_OPTIMIZATION;
            eLink = NWNX_Effect_PackEffect(effectO);
           //SetEffectSpellId(eLink,SPELL_ARMOR_OPTIMIZATION);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oPC);
        }
    }
} // End CheckCustomFeats()

