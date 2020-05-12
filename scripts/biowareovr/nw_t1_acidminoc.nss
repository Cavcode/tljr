// Overriding Blob of Acid trap

// Smoke Mine


#include "qx_inc_spells"
void main()
{
    object oTarget = GetEnteringObject();
    effect eAOE = EffectAreaOfEffect(AOE_PER_DARKNESS);
    location lTarget = GetLocation(OBJECT_SELF);
    int nDuration = d2(3);

    //SendMessageToPC(GetLastSpellCaster(), "Smoke Grenade");
    //Create the AOE object at the selected location
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, RoundsToSeconds(nDuration));
}


