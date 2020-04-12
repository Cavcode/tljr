#include "rr_itemsets"

// Heal effects
void Heal(object oPC, object oTarget);
void MultipleAuraCheck(object oPC);

void main()
{
  object oPC = GetItemPossessor(GetAreaOfEffectCreator());
  MultipleAuraCheck(oPC);
  location lPC = GetLocation(oPC);
  object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 5.0f, lPC);
  while(GetIsObjectValid(oTarget))
  {
    Heal(oPC, oTarget);
    oTarget = GetNextObjectInShape(SHAPE_SPHERE, 5.0f, lPC);
  }
}

void Heal(object oPC, object oTarget)
{
  int iPower = GetLocalInt(oPC, "AuraPower");
  int i = d4(iPower);
  if (GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD)
  {
    if (!FortitudeSave(oTarget, iPower * 8, SAVING_THROW_TYPE_DEATH, oPC)) AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDamage(i, DAMAGE_TYPE_POSITIVE), oTarget));
    return;
  }
  if (GetIsEnemy(oPC, oTarget)) return;
  if (GetCurrentHitPoints(oTarget) < GetMaxHitPoints(oTarget)) AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectHeal(i), oTarget));
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
