#include "pug_inc"
void main()
{
object oPC = GetLastUsedBy();

        //ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE, FALSE), oPC);

        //DelayCommand(8.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oPC));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_CRT_GREEN,FALSE), oPC);
        ApplyRevivePenalty(oPC, TRUE);

}
