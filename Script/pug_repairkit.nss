#include "pug_inc"
void main()
{
object oPC = GetItemActivator();
object oTarget = GetItemActivatedTarget();
object oItem = GetItemActivated();
int nPower = GetLocalInt(oItem, "REPAIR_STRENGTH");
int nLevel = GetHitDice(oPC);
int nRepair = GetSkillRank(28, oTarget, FALSE);
int nHP = GetCurrentHitPoints(oTarget);
int nMax = GetMaxHitPoints(oTarget);
int nHeal = nLevel + nPower * nRepair;
int nStatus;
object oShip = GetObjectByTag("PL_S_"+GetStringLeft(GetTag(oTarget),3));

if (GetIsObjectValid(oShip) == TRUE)
    {
    nStatus = GetLocalInt(oShip, GetTag(oTarget));
    }

if (GetIsObjectValid(oTarget)==TRUE && GetObjectType(oTarget) == OBJECT_TYPE_CREATURE && GetRacialType(oTarget) == RACIAL_TYPE_CONSTRUCT && GetTag(oItem) == "pug_repairkit")
    {
    if ( (nMax-nHP) <= nHeal )
        {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHeal), oTarget);
        }
    else if ( (nMax-nHP) > nHeal )
        {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nMax-nHP), oTarget);
        }
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_HIT_ELECTRICAL), oTarget);
    }

//For repairing capital ships
else if (GetLocalInt(oTarget, "REPAIR") > 0 && GetIsObjectValid(oTarget)==TRUE && GetObjectType(oTarget) == OBJECT_TYPE_PLACEABLE && GetLocalInt(oTarget, "MAX_POWER") > 0 && GetTag(oItem) == "pug_repairkit" )
    {
    FloatingTextStringOnCreature("This unit is already being repaired", oPC, FALSE);
    }
else if (GetIsObjectValid(oTarget)==TRUE && GetLocalInt(oTarget, "REPAIR") <= 0 && GetObjectType(oTarget) == OBJECT_TYPE_PLACEABLE && GetLocalInt(oTarget, "MAX_POWER") > 0 && GetTag(oItem) == "pug_repairkit" )
    {
    FloatingTextStringOnCreature("Repairing", oPC, FALSE);
    SetLocalInt(oTarget, "REPAIR", GetLocalInt(oTarget, "REPAIR")+nHeal+20);
    DelayCommand(2.0, RepairUnit(oShip, oTarget));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_HIT_ELECTRICAL), oTarget);
    }
else
    {
    FloatingTextStringOnCreature("You must use a repair kit on a droid or damaged ship system", oPC, FALSE);
    }
}
