#include "rr_itemsets"

void AddLit(object oTarget, object oPC);
void MultipleAuraCheck(object oPC);
int HasLit(object oWeapon, object oPC);

void main()
{
  object oPC = GetItemPossessor(GetAreaOfEffectCreator());
  MultipleAuraCheck(oPC);
  location lPC = GetLocation(oPC);
  object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 5.0f, lPC);
  while(GetIsObjectValid(oTarget))
  {
    if (!GetIsEnemy(oTarget, oPC)) AddLit(oTarget, oPC);
    oTarget = GetNextObjectInShape(SHAPE_SPHERE, 5.0f, lPC);
  }
}

void MultipleAuraCheck(object oPC)
{
  int iNumAuras = 0;
  effect e = GetFirstEffect(oPC);
  while(GetIsEffectValid(e))
  {
    if (GetEffectType(e) == EFFECT_TYPE_AREA_OF_EFFECT)
    {
      iNumAuras += 1;
      if (iNumAuras > 1) RemoveEffect(oPC, e);
    }
    e = GetNextEffect(oPC);
  }
}

int HasLit(object oWeapon, object oPC)
{
  itemproperty ip = GetFirstItemProperty(oWeapon);
  while(GetIsItemPropertyValid(ip))
  {
    if (GetItemPropertyDurationType(ip) == DURATION_TYPE_TEMPORARY)
    {
      if (GetItemPropertyType(ip) == ITEM_PROPERTY_DAMAGE_BONUS)
      {
        if (GetItemPropertySubType(ip) == IP_CONST_DAMAGETYPE_ELECTRICAL) return TRUE;
      }
    }
    ip = GetNextItemProperty(oWeapon);
  }
  return FALSE;
}

void AddLit(object oTarget, object oPC)
{
  object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget);
  if (!GetIsObjectValid(oWeapon)) return;
  if (HasLit(oWeapon, oPC)) return;
  int iPower = GetLocalInt(oPC, "AuraPower");
  AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE), oTarget));
  int i = 1;
  switch(iPower)
  {
  case 1:
    i = IP_CONST_DAMAGEBONUS_1;
    break;
  case 2:
    i = IP_CONST_DAMAGEBONUS_2;
    break;
  case 3:
    i = IP_CONST_DAMAGEBONUS_1d4;
    break;
  case 4:
    i = IP_CONST_DAMAGEBONUS_1d6;
    break;
  case 5:
    i = IP_CONST_DAMAGEBONUS_1d8;
    break;
  case 6:
    i = IP_CONST_DAMAGEBONUS_2d4;
    break;
  case 7:
    i = IP_CONST_DAMAGEBONUS_1d10;
    break;
  case 8:
    i = IP_CONST_DAMAGEBONUS_1d12;
    break;
  case 9:
    i = IP_CONST_DAMAGEBONUS_2d6;
    break;
  case 10:
    i = IP_CONST_DAMAGEBONUS_2d8;
    break;
  case 11:
    i = IP_CONST_DAMAGEBONUS_2d10;
    break;
  case 12:
    i = IP_CONST_DAMAGEBONUS_2d12;
    break;
  case 13:
    i = 30;
  }
  AddItemProperty(DURATION_TYPE_TEMPORARY, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ELECTRICAL, i), oWeapon, 30.0f);
}
