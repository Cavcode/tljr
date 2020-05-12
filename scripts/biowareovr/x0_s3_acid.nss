

#include "qx_inc_spells"
void main()
{

    //Declare major variables
    effect eAOE = EffectAreaOfEffect(AOE_PER_FOGSTINK, "qx_grenade_gas", "qx_grenadehb_gas", "");
    location lTarget = GetSpellTargetLocation();
    int nDuration = d4(2);
    effect eImpact = EffectVisualEffect(259);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, lTarget);

    //SendMessageToPC(GetLastSpellCaster(), "Gas Grenade");
    //Create the AOE object at the selected location
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, RoundsToSeconds(nDuration));
}


