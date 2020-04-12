void main()
{
object oPC = OBJECT_SELF;
object oBomb = GetLocalObject(oPC, "BOMB_BLAST");
object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_LARGE, GetLocation(oBomb), TRUE, OBJECT_TYPE_ALL);
effect eExplode = EffectVisualEffect(VFX_FNF_FIREBALL);
effect eHit = EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_FIRE);
int nStr = GetLocalInt(oBomb, "BOMB_STR");
int nDamage; effect eDam;

if (GetTag(oBomb) == "pug_smaldemo") {nDamage = nStr+d20(1);}
else {nDamage = d6(nStr);}

ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, GetLocation(oBomb));

        while (GetIsObjectValid(oTarget) == TRUE)
            {
            if (oTarget != OBJECT_SELF)
                {
                eDam = EffectDamage(nDamage, DAMAGE_TYPE_FIRE);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eHit, oTarget);
                }
            //if (GetIsPC(oTarget) == FALSE)
            //  {
               // SetPCDislike(GetLastKiller(), oTarget);
                //AdjustReputation(GetLastKiller(), oTarget, -50);
               // }
            oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_LARGE, GetLocation(oBomb), TRUE, OBJECT_TYPE_ALL);
            }
}
