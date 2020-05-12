const int AURA_DEATH = 1;
const int AURA_HEAL = 2;
const int AURA_STR = 3;
const int AURA_CON = 4;
const int AURA_ATT = 5;
const int AURA_DIVINE = 6;
const int AURA_ICE = 7;
const int AURA_LIT = 8;
const int AURA_ACID = 9;
#include "x2_inc_switches"
#include "rr_cepv2wings"

// iPowerType                            / i*                              / iSubType
// ITEM_PROPERTY_ABILITY_BONUS           / Points                          / ABILITY_*
// ITEM_PROPERTY_AC_BONUS                / Points                          / NA
// ITEM_PROPERTY_ATTACK_BONUS            / Points                          / NA
// ITEM_PROPERTY_BONUS_FEAT              / IP_CONST_FEAT_*                 / NA
// ITEM_PROPERTY_CAST_SPELL              / IP_CONST_CASTSPELL_NUMUSES_*    / IP_CONST_CASTSPELL_*
// ITEM_PROPERTY_DAMAGE_BONUS            / IP_CONST_DAMAGEBONUS_*          / IP_CONST_DAMAGETYPE_*
// ITEM_PROPERTY_DAMAGE_REDUCTION        / IP_CONST_DAMAGEREDUCTION_*      / IP_CONST_DAMAGESOAK_*
// ITEM_PROPERTY_DAMAGE_RESISTANCE       / IP_CONST_DAMAGERESIST_*         / IP_CONST_DAMAGETYPE_*
// ITEM_PROPERTY_DARKVISION              / 1/0 (Y/N)                       / NA
// ITEM_PROPERTY_ENHANCEMENT_BONUS       / Points                          / NA
// ITEM_PROPERTY_FREEDOM_OF_MOVEMENT     / 1/0 (Y/N)                       / NA
// ITEM_PROPERTY_HASTE                   / 1/0 (Y/N)                       / NA
// ITEM_PROPERTY_HOLY_AVENGER            / 1/0 (Y/N)                       / NA
// ITEM_PROPERTY_IMMUNITY_MISCELLANEOUS  / IP_CONST_IMMUNITYMISC_*         / NA
// ITEM_PROPERTY_IMMUNITY_SPECIFIC_SPELL / IP_CONST_IMMUNITYSPELL_*        / NA
// ITEM_PROPERTY_IMPROVED_EVASION        / 1/0 (Y/N)                       / NA
// ITEM_PROPERTY_KEEN                    / 1/0 (Y/N)                       / NA
// ITEM_PROPERTY_LIGHT                   / IP_CONST_LIGHTBRIGHTNESS_*      / IP_CONST_LIGHTCOLOR_*
// ITEM_PROPERTY_MASSIVE_CRITICALS       / IP_CONST_DAMAGEBONUS_*          / NA
// ITEM_PROPERTY_MIGHTY                  / Points                          / NA
// ITEM_PROPERTY_REGENERATION            / Points                          / NA
// ITEM_PROPERTY_REGENERATION_VAMPIRIC   / Points                          / NA
// ITEM_PROPERTY_SAVING_THROW_BONUS      / Points                          / IP_CONST_SAVEBASETYPE_*
// ITEM_PROPERTY_SKILL_BONUS             / Points                          / SKILL_*
// ITEM_PROPERTY_SPELL_RESISTANCE        / IP_CONST_SPELLRESISTANCEBONUS_* / NA
// ITEM_PROPERTY_TRUE_SEEING             / 1/0 (Y/N)                       / NA
// ITEM_PROPERTY_VISUALEFFECT            / 1/0 (Y/N)                       / ITEM_VISUAL_*
void AddPower(int iPowerType, object oPC, object oItem, int i1, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10, int i11, int i12, int i13, int iSubType);

// EFFECT_TYPE_CONCEALMENT
// EFFECT_TYPE_MOVEMENT_SPEED_INCREASE
// EFFECT_TYPE_ULTRAVISION
// EFFECT_TYPE_VISUALEFFECT
void AddPowerToPC(int iPowerType, object oPC, object oItem, int i1, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10, int i11, int i12, int i13);

// Damage / heal aura values:
// DC10 - 1, 2
// DC20 - 3, 4
// DC30 - 5, 6
// DC40 - 7, 8, 9, 10, 11, 12, 13
// All damage is d4()
//
// For Elemental Auras:
// 1 = 1    / 2 = 2     / 3 = 1d4
// 4 = 1d6  / 5 = 1d8   / 6 = 2d4
// 7 = 1d10 / 8 = 1d12  / 9 = 2d6
// 10 = 2d8 / 11 = 2d10 / 12 = 2d12
// 13 = 2
//
// AURA_DEATH      - Drains life from enemies/neutrals and gives it to you
// AURA_HEAL       - Heals your friends and damages undead
// AURA_STR        - Gives a strength bonus to friends
// AURA_CON        - Gives a constitution bonus to friends
// AURA_ATT        - Gives an attack bonus to friends
// AURA_DIVINE     - Gives friends extra divine damage on their weapon
// AURA_ICE        - Gives friends extra ice damage on their weapon
// AURA_LIT        - Gives friends extra electrical damage on their weapon
// AURA_ACID       - Gives friends extra acid damage on their weapon
void AddAuraToPC(int iPowerType, object oPC, object oItem, int i1, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10, int i11, int i12, int i13);

// CREATURE_WING_TYPE_ANGEL
// CREATURE_WING_TYPE_BAT
// CREATURE_WING_TYPE_BIRD
// CREATURE_WING_TYPE_BUTTERFLY
// CREATURE_WING_TYPE_DEMON
// CREATURE_WING_TYPE_DRAGON
// CREATURE_WING_TYPE_NONE
// * cep 2.0 wings can also be used here
void AddWingsToPC(int iPowerType, object oPC, object oItem, int i1, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10, int i11, int i12, int i13);

void ItemSet();
void RecalculatePowers(object oPC);
void RemoveAllItemSetProperties();
int GetNumberOfSetItems(string sSet, object oPC);
string GetItemSet(object oItem);
void RemoveAllTempIPs(object oItem);
void RemoveAllEffectsByCreator(object oPC, object oItem);

void RemoveAllItemSetProperties()
{
  object oItem = GetPCItemLastEquipped();
  object oPC = GetPCItemLastEquippedBy();
  if (GetUserDefinedItemEventNumber() == X2_ITEM_EVENT_UNEQUIP)
  {
    oItem = GetPCItemLastUnequipped();
    oPC = GetPCItemLastUnequippedBy();
    DelayCommand(0.1f, RemoveAllTempIPs(oItem));
    DelayCommand(0.1f, RemoveAllEffectsByCreator(oPC, oItem));
  }
  string sSet = GetItemSet(oItem);
  int i;
  for(i=0;i<14;i++)
  {
    oItem = GetItemInSlot(i, oPC);
    if (GetItemSet(oItem) == sSet)
    {
      RemoveAllTempIPs(oItem);
      RemoveAllEffectsByCreator(oPC, oItem);
    }
  }
  oItem = GetFirstItemInInventory(oPC);
  while(GetIsObjectValid(oItem))
  {
    if (GetItemSet(oItem) == sSet)
    {
      RemoveAllTempIPs(oItem);
      RemoveAllEffectsByCreator(oPC, oItem);
    }
    oItem = GetNextItemInInventory(oPC);
  }

  int iWings = GetLocalInt(oPC, "Wings");
  SetCreatureWingType(iWings, oPC);
}

void AddPower(int iPowerType, object oPC, object oItem, int i1, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10, int i11, int i12, int i13, int iSubType)
{
  string sSet = GetSubString(GetTag(oItem), 4, 2);
  int i = 0;
  int iNumberOfSetItems = GetNumberOfSetItems(sSet, oPC);
  switch(iNumberOfSetItems)
  {
  case 1: i = i1; break;
  case 2: i = i2; break;
  case 3: i = i3; break;
  case 4: i = i4; break;
  case 5: i = i5; break;
  case 6: i = i6; break;
  case 7: i = i7; break;
  case 8: i = i8; break;
  case 9: i = i9; break;
  case 10: i = i10; break;
  case 11: i = i11; break;
  case 12: i = i12; break;
  case 13: i = i13; break;
  }
  if (i == 0) return;
  switch(iPowerType)
  {
  case ITEM_PROPERTY_ABILITY_BONUS:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyAbilityBonus(iSubType, i), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_AC_BONUS:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyACBonus(i), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_ATTACK_BONUS:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyAttackBonus(i), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_BONUS_FEAT:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyBonusFeat(i), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_CAST_SPELL:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyCastSpell(iSubType, i), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_DAMAGE_BONUS:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyDamageBonus(iSubType, i), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_DAMAGE_REDUCTION:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyDamageReduction(i, iSubType), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_DAMAGE_RESISTANCE:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyDamageResistance(iSubType, i), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_DARKVISION:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyDarkvision(), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_ENHANCEMENT_BONUS:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyEnhancementBonus(i), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_FREEDOM_OF_MOVEMENT:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyFreeAction(), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_HASTE:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyHaste(), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_HOLY_AVENGER:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyHolyAvenger(), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_IMMUNITY_MISCELLANEOUS:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyImmunityMisc(i), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_IMMUNITY_SPECIFIC_SPELL:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertySpellImmunitySpecific(i), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_IMPROVED_EVASION:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyImprovedEvasion(), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_KEEN:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyKeen(), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_LIGHT:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyLight(i, iSubType), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_MASSIVE_CRITICALS:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyMassiveCritical(i), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_MIGHTY:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyMaxRangeStrengthMod(i), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_REGENERATION:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyRegeneration(i), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_REGENERATION_VAMPIRIC:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyVampiricRegeneration(i), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_SAVING_THROW_BONUS:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyBonusSavingThrow(iSubType, i), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_SKILL_BONUS:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertySkillBonus(iSubType, i), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_SPELL_RESISTANCE:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyBonusSpellResistance(i), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_TRUE_SEEING:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyTrueSeeing(), oItem, 38400.0f);
    return;
  case ITEM_PROPERTY_VISUALEFFECT:
    AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyVisualEffect(iSubType), oItem, 38400.0f);
    return;
  }
}

int GetNumberOfSetItems(string sSet, object oPC)
{
  int i;
  int iNumberOfItems = 0;
  for(i=0;i<14;i++)
  {
    if (GetSubString(GetTag(GetItemInSlot(i, oPC)), 4, 2) == sSet) iNumberOfItems += 1;
  }
  if (GetUserDefinedItemEventNumber() == X2_ITEM_EVENT_UNEQUIP) iNumberOfItems -= 1;
  return iNumberOfItems;
}

void ItemSet()
{
  if (GetUserDefinedItemEventNumber() == X2_ITEM_EVENT_EQUIP)
  {
    RemoveAllItemSetProperties();
    RecalculatePowers(GetPCItemLastEquippedBy());
  }
  if (GetUserDefinedItemEventNumber() == X2_ITEM_EVENT_UNEQUIP)
  {
    RemoveAllItemSetProperties();
    RecalculatePowers(GetPCItemLastUnequippedBy());
  }
}

string GetItemSet(object oItem)
{
  return GetSubString(GetTag(oItem), 3, 2);
}

void RemoveAllTempIPs(object oItem)
{
  itemproperty ip = GetFirstItemProperty(oItem);
  while(GetIsItemPropertyValid(ip))
  {
    if (GetItemPropertyDurationType(ip) == DURATION_TYPE_TEMPORARY)
    {
      if (GetItemPropertyType(ip) != ITEM_PROPERTY_ONHITCASTSPELL)
      {
        RemoveItemProperty(oItem, ip);
      }
    }
    ip = GetNextItemProperty(oItem);
  }
}

void RemoveAllEffectsByCreator(object oPC, object oItem)
{
  effect e = GetFirstEffect(oPC);
  while(GetIsEffectValid(e))
  {
    if (GetEffectCreator(e) == oItem) RemoveEffect(oPC, e);
    e = GetNextEffect(oPC);
  }
}

void AddPowerToPC(int iPowerType, object oPC, object oItem, int i1, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10, int i11, int i12, int i13)
{
  string sSet = GetSubString(GetTag(oItem), 4, 2);
  int i = 0;
  int iNumberOfSetItems = GetNumberOfSetItems(sSet, oPC);
  switch(iNumberOfSetItems)
  {
  case 1: i = i1; break;
  case 2: i = i2; break;
  case 3: i = i3; break;
  case 4: i = i4; break;
  case 5: i = i5; break;
  case 6: i = i6; break;
  case 7: i = i7; break;
  case 8: i = i8; break;
  case 9: i = i9; break;
  case 10: i = i10; break;
  case 11: i = i11; break;
  case 12: i = i12; break;
  case 13: i = i13; break;
  }
  if (i == 0) return;
  switch(iPowerType)
  {
  case EFFECT_TYPE_CONCEALMENT:
    AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectConcealment(i)), oPC));
    return;
  case EFFECT_TYPE_MOVEMENT_SPEED_INCREASE:
    AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectMovementSpeedIncrease(i)), oPC));
    return;
  case EFFECT_TYPE_ULTRAVISION:
    AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectUltravision()), oPC));
    return;
  case EFFECT_TYPE_VISUALEFFECT:
    AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(i)), oPC));
    return;
  }
}

// Damage / heal aura values:
// DC10 - 1, 2
// DC20 - 3, 4
// DC30 - 5, 6
// DC40 - 7, 8, 9, 10, 11, 12, 13
// All damage is d4()
//
// For Elemental Auras:
// 1 = 1    / 2 = 2     / 3 = 1d4
// 4 = 1d6  / 5 = 1d8   / 6 = 2d4
// 7 = 1d10 / 8 = 1d12  / 9 = 2d6
// 10 = 2d8 / 11 = 2d10 / 12 = 2d12
// 13 = 2
//
// AURA_DEATH      - Drains life from enemies/neutrals and gives it to you
// AURA_HEAL       - Heals your friends and damages undead
// AURA_STR        - Gives a strength bonus to friends
// AURA_CON        - Gives a constitution bonus to friends
// AURA_ATT        - Gives an attack bonus to friends
// AURA_DIVINE     - Gives friends extra divine damage on their weapon
// AURA_ICE        - Gives friends extra ice damage on their weapon
// AURA_LIT        - Gives friends extra electrical damage on their weapon
// AURA_ACID       - Gives friends extra acid damage on their weapon
void AddAuraToPC(int iPowerType, object oPC, object oItem, int i1, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10, int i11, int i12, int i13)
{
  string sSet = GetSubString(GetTag(oItem), 4, 2);
  int i = 0;
  int iNumberOfSetItems = GetNumberOfSetItems(sSet, oPC);
  switch(iNumberOfSetItems)
  {
  case 1: i = i1; break;
  case 2: i = i2; break;
  case 3: i = i3; break;
  case 4: i = i4; break;
  case 5: i = i5; break;
  case 6: i = i6; break;
  case 7: i = i7; break;
  case 8: i = i8; break;
  case 9: i = i9; break;
  case 10: i = i10; break;
  case 11: i = i11; break;
  case 12: i = i12; break;
  case 13: i = i13; break;
  }
  if (i == 0) return;
  SetLocalInt(oPC, "AuraPower", i);
  switch(iPowerType)
  {
  case AURA_DEATH:
    AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_MOB_CIRCEVIL, "****", "rr_deathaura", "****"), oPC, 38400.0f));
    return;
  case AURA_HEAL:
    AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_MOB_PROTECTION, "****", "rr_healaura", "****"), oPC, 38400.0f));
    return;
  case AURA_STR:
    AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_MOB_PROTECTION, "****", "rr_straura", "****"), oPC, 38400.0f));
    return;
  case AURA_CON:
    AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_MOB_PROTECTION, "****", "rr_conaura", "****"), oPC, 38400.0f));
    return;
  case AURA_ATT:
    AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_MOB_PROTECTION, "****", "rr_attaura", "****"), oPC, 38400.0f));
    return;
  case AURA_DIVINE:
    AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_MOB_PROTECTION, "****", "rr_divaura", "****"), oPC, 38400.0f));
    return;
  case AURA_ICE:
    AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_MOB_PROTECTION, "****", "rr_iceaura", "****"), oPC, 38400.0f));
    return;
  case AURA_LIT:
    AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_MOB_PROTECTION, "****", "rr_litaura", "****"), oPC, 38400.0f));
    return;
  case AURA_ACID:
    AssignCommand(oItem, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_MOB_PROTECTION, "****", "rr_acidaura", "****"), oPC, 38400.0f));
    return;
  }
}

void AddWingsToPC(int iPowerType, object oPC, object oItem, int i1, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10, int i11, int i12, int i13)
{
  string sSet = GetSubString(GetTag(oItem), 4, 2);
  int i = 0;
  int iNumberOfSetItems = GetNumberOfSetItems(sSet, oPC);
  switch(iNumberOfSetItems)
  {
  case 1: i = i1; break;
  case 2: i = i2; break;
  case 3: i = i3; break;
  case 4: i = i4; break;
  case 5: i = i5; break;
  case 6: i = i6; break;
  case 7: i = i7; break;
  case 8: i = i8; break;
  case 9: i = i9; break;
  case 10: i = i10; break;
  case 11: i = i11; break;
  case 12: i = i12; break;
  case 13: i = i13; break;
  }
  if (i == 0) return;
  SetLocalInt(oPC, "Wings", GetCreatureWingType());
  SetCreatureWingType(iPowerType, oPC);
}
