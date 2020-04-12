// Overriding Minor Gas Trap
//
// Gas Trap

#include "qx_inc_spells"
void main()
{
    object oPC = GetTrapCreator(OBJECT_SELF);
    //Declare major variables
    effect eAOE = EffectAreaOfEffect(AOE_PER_FOGSTINK, "qx_grenade_gas", "qx_grenadehb_gas", "");
    location lTarget = GetLocation(GetEnteringObject());
    int nDuration = d4(2);
    effect eImpact = EffectVisualEffect(259);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, lTarget);

    //Create the AOE object at the selected location
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, RoundsToSeconds(nDuration));
}


