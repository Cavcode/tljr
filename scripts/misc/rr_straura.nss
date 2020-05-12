#include "rr_itemsets"

void AddStr(object oTarget, object oPC);
void MultipleAuraCheck(object oPC);
int HasStr(object oTarget, object oPC);

void main()
{
  object oPC = GetItemPossessor(GetAreaOfEffectCreator());
  MultipleAuraCheck(oPC);
  location lPC = GetLocation(oPC);
  object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 5.0f, lPC);
  while(GetIsObjectValid(oTarget))
  {
    if (!GetIsEnemy(oTarget, oPC)) AddStr(oTarget, oPC);
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

int HasStr(object oTarget, object oPC)
{
  effect e = GetFirstEffect(oTarget);
  while(GetIsEffectValid(e))
  {
    if (GetEffectType(e) == EFFECT_TYPE_ABILITY_INCREASE)
    {
      if (GetEffectDurationType(e) == DURATION_TYPE_TEMPORARY)
      {
        if (GetEffectCreator(e) == oPC) return TRUE;
      }
    }
    e = GetNextEffect(oTarget);
  }
  return FALSE;
}

void AddStr(object oTarget, object oPC)
{
  int iPower = GetLocalInt(oPC, "AuraPower");
  if (HasStr(oTarget, oPC)) return;
  AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE), oTarget));
  AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAbilityIncrease(ABILITY_STRENGTH, d4(iPower)), oTarget, 30.0f ));
}
