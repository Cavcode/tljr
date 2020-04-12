#include "rr_itemsets"

// Drain effects
void Drain(object oPC, object oTarget);
void MultipleAuraCheck(object oPC);

void main()
{
  object oPC = GetItemPossessor(GetAreaOfEffectCreator());
  MultipleAuraCheck(oPC);
  location lPC = GetLocation(oPC);
  object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 5.0f, lPC);
  while(GetIsObjectValid(oTarget))
  {
    Drain(oPC, oTarget);
    oTarget = GetNextObjectInShape(SHAPE_SPHERE, 5.0f, lPC);
  }
}

void Drain(object oPC, object oTarget)
{
  if (oPC == oTarget) return;
  if (GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD) return;
  if ((!GetIsEnemy(oPC, oTarget)) && !GetIsPC(oTarget)) return;
  int iPower = GetLocalInt(oPC, "AuraPower");
  int i = d4(iPower);
  if (!FortitudeSave(oTarget, iPower * 8, SAVING_THROW_TYPE_DEATH, oPC))
  {
    SendMessageToPC(oTarget, "You can feel evil eminating from " + GetName(oPC));
    AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDamage(i, DAMAGE_TYPE_NEGATIVE), oTarget));
    if (GetCurrentHitPoints(oPC) != GetMaxHitPoints(oPC)) AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectHeal(i), oPC));
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
