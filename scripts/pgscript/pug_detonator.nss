void main()
{
/*object oPC = GetItemActivator();
object oDetn = GetItemActivated();
object oBomb = GetLocalObject(oDetn, "BOMB");

if (GetTag(GetArea(oPC)) == GetTag(GetArea(oBomb)) && GetTag(oDetn) == "pug_detonator" && GetLocalInt(oBomb, "EXPLODED") == FALSE)
    {
    SetLocalInt(oBomb, "EXPLODED", TRUE);
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_LARGE, GetLocation(oBomb), TRUE, OBJECT_TYPE_ALL);
    effect eExplode = EffectVisualEffect(VFX_FNF_FIREBALL);
    effect eHit = EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_FIRE);
    int nStr = GetLocalInt(OBJECT_SELF, "BOMB_STR");
    int nDamage; effect eDam;

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, GetLocation(oBomb));

        while (GetIsObjectValid(oTarget) == TRUE)
            {
            nDamage = d6(nStr);
            eDam = EffectDamage(nDamage, DAMAGE_TYPE_FIRE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eHit, oTarget);
            if (GetIsPC(oTarget) == FALSE)
                {
                SetPCDislike(oPC, oTarget);
                //AdjustReputation(oPC, oTarget, -50);
                }
            oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_LARGE, GetLocation(oBomb), TRUE, OBJECT_TYPE_ALL);
            }
    DestroyObject(oBomb);
    DestroyObject(oDetn);
    }
else
    {
    FloatingTextStringOnCreature("You must be in the same area as the bomb to detonate it", oPC, FALSE);
    }
  */
}
