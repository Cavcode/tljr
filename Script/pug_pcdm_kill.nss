void main()
{
object oPC = GetPCSpeaker();
object oTarget = GetLocalObject(oPC, "DM_TARGET");

ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(9000, DAMAGE_TYPE_MAGICAL,DAMAGE_POWER_PLUS_TWENTY), oTarget);
}
