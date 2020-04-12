#include "pug_inc"
void main()
{
object oPC = GetLastUsedBy();

        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE, FALSE), oPC);

        DelayCommand(8.0, ActionCastSpellAtObject(SPELL_RESURRECTION, oPC, METAMAGIC_QUICKEN, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));

        DelayCommand(10.0, ApplyRevivePenalty(oPC, TRUE));

}
