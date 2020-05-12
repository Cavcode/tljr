void main()
{
string sFaction = GetTag(OBJECT_SELF);
object oOther = GetFirstPC();
string sBase;
if (sFaction == "PL_S_ISD"){sBase = "pug_isd_1";}
else if (sFaction == "PL_S_MCC"){sBase = "pug_mcc_1";}
effect eDam = EffectDamage(6000, DAMAGE_TYPE_FIRE, DAMAGE_POWER_PLUS_SEVENTEEN);
effect eExplode = EffectVisualEffect(VFX_FNF_FIREBALL);
ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, GetLocation(OBJECT_SELF));
ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, OBJECT_SELF);

    while (GetIsObjectValid(oOther) == TRUE)
        {
        if (GetTag(GetArea(oOther)) == sBase)
            {
            FloatingTextStringOnCreature("Ship Destroyed", oOther, TRUE);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, GetLocation(oOther));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oOther);
            }
        oOther = GetNextPC();
        }
object oDefender = GetFirstObjectInArea(GetArea(GetObjectByTag(sBase)));

    while (GetIsObjectValid(oDefender) == TRUE)
        {
        if (GetObjectType(oDefender) == OBJECT_TYPE_CREATURE)
            {
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, GetLocation(oDefender));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oDefender);
            }
        oDefender = GetNextObjectInArea(GetArea(GetObjectByTag(sBase)));
        }

    effect eExplode1 = EffectVisualEffect(VFX_IMP_PULSE_WIND);
    effect eExplode2 = EffectVisualEffect(VFX_FNF_ELECTRIC_EXPLOSION);

    DelayCommand(1.8, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode1, GetLocation(OBJECT_SELF)));
    DelayCommand(1.8, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode2, GetLocation(OBJECT_SELF)));
    DelayCommand(0.8, AssignCommand(OBJECT_SELF, PlaySound("explosion4")));

ExecuteScript("sf_xp", OBJECT_SELF);
CreateObject(OBJECT_TYPE_PLACEABLE, "deadsoldier", GetLocation(OBJECT_SELF), FALSE, GetTag(OBJECT_SELF));

DestroyObject(OBJECT_SELF);
}
