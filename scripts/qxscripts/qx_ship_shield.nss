#include "nw_i0_spells"


#include "x2_inc_spellhook"

void main()
{

/*
  Spellcast Hook Code
  Added 2003-06-20 by Georg
  If you want to make changes to all spells,
  check x2_inc_spellhook.nss to find out more

*/

    if (!X2PreSpellCastCode())
    {
    // If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    }

// End of Spell Cast Hook


    //Declare major variables
    int nDuration = 20;
    object oTarget = GetSpellTargetObject();
    int nDamage = 400;
    object oPC = OBJECT_SELF;
    int nPower = GetLocalInt(oPC, "SHIP_POWER");
    //effect eVis2 = EffectVisualEffect(VFX_DUR_GLOW_BLUE);
    effect eStone = EffectDamageReduction(50, DAMAGE_POWER_PLUS_TEN, nDamage);
    effect eVis = EffectVisualEffect(VFX_DUR_GLOW_BLUE);

    if (nPower > 0)
        {
        //Link the texture replacement and the damage reduction effect
        effect eLink = EffectLinkEffects(eVis, eStone);

        //Remove effects from target if they have Greater Stoneskin cast on them already.
        RemoveEffectsFromSpell(oTarget, SPELL_GREATER_STONESKIN);

        //Apply the linked effect
        //ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oTarget);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, HoursToSeconds(nDuration));
        SetLocalInt(oPC, "SHIP_POWER", nPower-1);
        FloatingTextStringOnCreature("Your ship has enough power for "+IntToString(nPower-1)+" more shield or turbo laser use(s)", oPC, FALSE);
        }
    else
        {
        FloatingTextStringOnCreature("Your ship is out of power, land on a planet to recharge the power for your shields and turbo lasers", oPC, FALSE);
        }
}
