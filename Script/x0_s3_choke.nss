
#include "qx_inc_spells"
void main()
{

    //Declare major variables
    effect eAOE = EffectAreaOfEffect(AOE_PER_DARKNESS);
    location lTarget = GetSpellTargetLocation();
    int nDuration = 5;

    //SendMessageToPC(GetLastSpellCaster(), "Smoke Grenade");
    //Create the AOE object at the selected location
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, RoundsToSeconds(nDuration));
}

