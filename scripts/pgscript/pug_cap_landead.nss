void main()
{
object oPC = GetEnteringObject();
string sFaction = GetTag(GetArea(oPC));
string sBase;
if (sFaction == "pug_isd_1" && sFaction != ""){sBase = "PL_S_ISD";}
else if (sFaction == "pug_mcc_1" && sFaction != ""){sBase = "PL_S_MCC";}

object oShip = GetObjectByTag(sBase);
effect eDam = EffectDamage(6000, DAMAGE_TYPE_FIRE, DAMAGE_POWER_PLUS_SEVENTEEN);
effect eExplode = EffectVisualEffect(VFX_FNF_FIREBALL);

if (GetIsObjectValid(oShip) == FALSE && GetLocalInt(GetObjectByTag("ISD_ENGINES"), "TESTING") == FALSE)
    {
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, GetLocation(oPC));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oPC);
    }
}
