void main()
{
object oPC = GetPCSpeaker();
object oTarget = GetLocalObject(oPC, "DM_TARGET");

        SetLocalInt(oTarget, "DEAD", FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(oTarget)), oTarget);
}
