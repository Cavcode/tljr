//::///////////////////////////////////////////////
//:: Implosion
//:: NW_S0_Implosion.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    All persons within a 5ft radius of the spell must
    save at +3 DC or die.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 13, 2001
//:://////////////////////////////////////////////

#include "X0_I0_SPELLS"
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
    object oTarget;
    //int nRoll = d4(GetAbilityModifier(ABILITY_WISDOM,OBJECT_SELF));
    effect eDeath = SupernaturalEffect(EffectDeath(TRUE));
    //effect eDeath = EffectDamage( nRoll , DAMAGE_TYPE_ELECTRICAL, DAMAGE_POWER_NORMAL);
    effect eImplode= EffectVisualEffect(VFX_COM_CHUNK_RED_MEDIUM);
    float fDelay;
    int nCount = 0;
    //Apply the implose effect
    //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImplode, GetSpellTargetLocation());
    //Get the first target in the shape
    oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, GetSpellTargetLocation());
    while (GetIsObjectValid(oTarget) && nCount < 1)
    {
        if (oTarget != OBJECT_SELF && spellsIsTarget(oTarget, SPELL_TARGET_STANDARDHOSTILE, OBJECT_SELF))
        {
           //Fire cast spell at event for the specified target
           SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_IMPLOSION));
           fDelay = GetRandomDelay(0.4, 1.2);
           //Make SR check
           //if (!MyResistSpell(OBJECT_SELF, oTarget, fDelay))
           //{
                //Make Reflex save
                if(!MySavingThrow(SAVING_THROW_FORT, oTarget, GetSpellSaveDC()+3, SAVING_THROW_TYPE_DEATH, OBJECT_SELF, fDelay))
                {
                    //Apply death effect and the VFX impact
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget));
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eImplode, oTarget);
                    nCount += 1;
                }

           //}
       }
       //Get next target in the shape
       oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, GetSpellTargetLocation());
    }
}

