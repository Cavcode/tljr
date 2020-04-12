
#include "tlj_inc_generic"

// FUNCTION DECLARATIONS ///////////////////////////////////////////////////////

// This function is called from the shooter and makes the target attempt to
// deflect, and possibly redirect, a blaster bolt.
void DeflectBlasterBolt(object oAttacker, int nDamageDealt);

void ResistVibroweapon(object oAttacker, int nDamageDealt);

void PointBlankShot(object oAttacker, int nDamageDealt);

void BlasterDroidStun(object oAttacker, int nDamageDealt);

void EventOnAttacked(object oAttacker, int nImpactScriptId);

// FUNCTION DEFINITIONS ////////////////////////////////////////////////////////

void DeflectBlasterBolt(object oAttacker, int nDamageDealt) {

    // If we're holding a lightsaber, then determine our range of view
    // to successfully deflect the blaster bolt.
    if (IsWeaponLightsaber(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF))) {
        if (!GetIsFacingObject(oAttacker, OBJECT_SELF, GetBlasterBoltDeflectRange(OBJECT_SELF) / 2.0)) return;
    }

    int nDeflectPercentile = FloatToInt(100.0 * GetBlasterBoltDeflectPercentile(OBJECT_SELF));
    if (d100() > nDeflectPercentile) return;

    ////////////////////////////////////////////////////////////////////////////
    // Blaster bolt deflection was successful
    ////////////////////////////////////////////////////////////////////////////

    SendMessageToPC(oAttacker, "Blaster bolt was deflected!");
    SendMessageToPC(OBJECT_SELF, "Blaster bolt was deflected!");

    // Deflect sound effect
    effect esDeflect = EffectVisualEffect(SFX_IMP_BLASTER_DEFLECT);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, esDeflect, OBJECT_SELF);

    // Restore the damage dealt.
    effect eHeal = EffectHeal(nDamageDealt);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, OBJECT_SELF);

    ////////////////////////////////////////////////////////////////////////////
    // Now lets redirect the blaster bolt.
    // 50% chance of it going back to the shooter.
    ////////////////////////////////////////////////////////////////////////////

    // Percentile chance of the bolt redirecting back to the shooter
    object oRedirectTarget;
    if (d2() == 1) {
        oRedirectTarget = oAttacker;
    }

    if (oRedirectTarget == OBJECT_INVALID) {
        ////////////////////////////////////////////////////////////////////////////
        // If not going back to the shooter, this section generates a random vector
        // and redirects the bolt to it instead.
        ////////////////////////////////////////////////////////////////////////////

        //SpeakString("BLASTER BOLT REDIRECTED TO VECTOR");

        // Create a random vector within a 10m radius dome infront of the caller.
        vector vBolt = GetChangedPosition(GetPosition(OBJECT_SELF),
                                          10.0,
                                          GetNormalizedDirection(GetFacing(OBJECT_SELF) + IntToFloat(Random(180)-89)));
               vBolt.z += Random(20) - 9;
        // Create a location using our random vector
        location lBolt = Location(GetArea(OBJECT_SELF), vBolt, 0.0);

        oRedirectTarget = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", lBolt);
        DelayCommand(0.3, DestroyObject(oRedirectTarget));
    }
    else {
        ////////////////////////////////////////////////////////////////////////////
        // If it is going back to the shooter, then apply the full damage
        // of the bolt to him/her.
        ////////////////////////////////////////////////////////////////////////////

        //SpeakString("BLASTER BOLT REDIRECTED TO NEW TARGET");

        // Apply the same damage of the blaster bolt to the new target.
        effect eDamage = EffectDamage(nDamageDealt, DAMAGE_TYPE_ENERGY);
        DelayCommand(GetDistanceBetween(OBJECT_SELF, oRedirectTarget)/30, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oRedirectTarget));
    }

    // Apply our redirected blaster bolt visual
    effect eBolt = EffectVisualEffect(VFX_IMP_BLASTER_BOLT);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eBolt, oRedirectTarget);
}

void ResistVibroweapon(object oAttacker, int nDamageDealt) {

}

void PointBlankShot(object oAttacker, int nDamageDealt) {

    // In this function, point blank is defined as 10m or closer.
    if (GetDistanceBetween(OBJECT_SELF, oAttacker) <= 10.0) {

        // Point blank damage when using a carbine or some other assault blaster.
        if (GetBaseItemType(GetLastWeaponUsed(oAttacker)) == BASE_ITEM_ASSAULT_BLASTER) {
            effect eExtraDamage = EffectDamage(nDamageDealt/2, DAMAGE_TYPE_ENERGY, DAMAGE_POWER_ENERGY);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eExtraDamage, OBJECT_SELF);
        }

        // Point blank stun effect.
        if (GetHasFeat(FEAT_FORCE_CONDITIONING_2, OBJECT_SELF)) {
            SendMessageToPC(OBJECT_SELF, "Immune to stun.");
            SendMessageToPC(oAttacker, "Target immune to Stun.");
        }
        else if (!WillSave(OBJECT_SELF, nDamageDealt/2, SAVING_THROW_TYPE_MIND_SPELLS, oAttacker)) {
            effect eStun = EffectStunned();
            effect eVis = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED);
            effect eLink = EffectLinkEffects(eStun, eVis);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, OBJECT_SELF, 9.0);
        }
    }
}

void BlasterDroidStun(object oAttacker, int nDamageDealt) {
    if (GetRacialType(OBJECT_SELF) == RACIAL_TYPE_DROID) {
        if (!WillSave(OBJECT_SELF, nDamageDealt, SAVING_THROW_TYPE_MIND_SPELLS, oAttacker)) {
            effect eStun = EffectStunned();
            effect eVis = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED);
            effect eLink = EffectLinkEffects(eStun, eVis);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, OBJECT_SELF, 9.0);
        }
    }
}

void EventOnAttacked(object oAttacker, int nImpactScriptId) {

    // Are we dead? If so, then exit out.
    if (GetIsDead(OBJECT_SELF)) return;

    // Variable declaration
    int nDamageDealt = GetTotalDamageDealt();

    // Break our concentration
    if (IsConcentrating()) BreakConcentration(nDamageDealt, TRUE);

    switch (nImpactScriptId) {
        case SPELL_IMPACT_BLASTER_BALLISTIC: DeflectBlasterBolt(oAttacker, nDamageDealt); PointBlankShot(oAttacker, nDamageDealt); break;
        case SPELL_IMPACT_BLASTER_BOLT: DeflectBlasterBolt(oAttacker, nDamageDealt); PointBlankShot(oAttacker, nDamageDealt); break;
        case SPELL_IMPACT_BLASTER_CARBONITE: break;
        case SPELL_IMPACT_BLASTER_ION: DeflectBlasterBolt(oAttacker, nDamageDealt); BlasterDroidStun(oAttacker, nDamageDealt); break;
        case SPELL_IMPACT_BLASTER_SONIC: break;
        case SPELL_IMPACT_BLASTER_TURBOLASER: break;
        case SPELL_IMPACT_EXPLODE_ADHESIVE: break;
        case SPELL_IMPACT_EXPLODE_CARBONITE: break;
        case SPELL_IMPACT_EXPLODE_CONCUSSION: break;
        case SPELL_IMPACT_EXPLODE_CRYOBAN: break;
        case SPELL_IMPACT_EXPLODE_FRAG: break;
        case SPELL_IMPACT_EXPLODE_GAS: break;
        case SPELL_IMPACT_EXPLODE_ION: break;
        case SPELL_IMPACT_EXPLODE_PLASMA: break;
        case SPELL_IMPACT_EXPLODE_SONIC: break;
        case SPELL_IMPACT_EXPLODE_THERMAL: break;
        case SPELL_IMPACT_MELEE_VIBROWEAPON: ResistVibroweapon(oAttacker, nDamageDealt); break;
        case SPELL_IMPACT_MELEE_LIGHTSABER: break;
    }
}

//void main() {}
