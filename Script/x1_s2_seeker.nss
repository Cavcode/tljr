//::///////////////////////////////////////////////
//:: x1_s2_seeker
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Seeker Arrow
     - creates an arrow that automatically hits target.
     - normal arrow damage, based on base item type

     - Must have shortbow or longbow in hand.


     APRIL 2003
     - gave it double damage to balance for the fact
       that since its a spell you are losing
       all your other attack actions

     SEPTEMBER 2003 (GZ)
        Added damage penetration
        Added correct enchantment bonus


*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "X0_I0_SPELLS"
void main()
{
    int nBonus = 0;
    nBonus = GetSkillRank(15, OBJECT_SELF, FALSE)/2;
    effect eExplode = EffectVisualEffect(VFX_FNF_FIREBALL);
    object oTarget = GetSpellTargetObject();
    location lTarget = GetLocation(oTarget);
    float fDelay;
    int nDamage = ArcaneArcherDamageDoneByBow() *2;
    effect eDam;
    effect eVis = EffectVisualEffect(VFX_IMP_FLAME_M);
    object oRocket = GetItemPossessedBy(OBJECT_SELF, "wristrocket1");

if (oRocket != OBJECT_INVALID)
{
    DestroyObject(oRocket);
    if (GetIsObjectValid(oTarget) == TRUE)
    {
        int nDamage = d3(GetLevelByClass(CLASS_TYPE_ARCANE_ARCHER,OBJECT_SELF))+d20(1);
        if (nDamage > 0)
        {
            effect ePhysical = EffectDamage(nDamage, DAMAGE_TYPE_PIERCING,IPGetDamagePowerConstantFromNumber(nBonus));
            effect eMagic = EffectDamage(nBonus, DAMAGE_TYPE_MAGICAL);

          //Fire cast spell at event for the specified target
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, 601));

            ApplyEffectToObject(DURATION_TYPE_INSTANT, ePhysical, oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eMagic, oTarget);

        }
    }
    //Apply the fireball explosion at the location captured above.
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, lTarget);
    //Declare the spell shape, size and the location.  Capture the first target object in the shape.
    oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lTarget, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    //Cycle through the targets within the spell shape until an invalid object is captured.
    while (GetIsObjectValid(oTarget))
    {
        if(spellsIsTarget(oTarget, SPELL_TARGET_SELECTIVEHOSTILE, OBJECT_SELF) == TRUE)
        {

            //Fire cast spell at event for the specified target
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId(), TRUE));
            //Get the distance between the explosion and the target to calculate delay
            fDelay = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget))/20;
                //Set the damage effect
                eDam = EffectDamage(nDamage, DAMAGE_TYPE_FIRE);
                if(nDamage > 0)
                {
                    // Apply effects to the currently selected target.
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                    //This visual effect is applied to the target object not the location as above.  This visual effect
                    //represents the flame that erupts on the target not on the ground.
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                }
        }
       //Select the next target within the spell shape.
       oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lTarget, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    }
}
else
{
    SendMessageToPC(OBJECT_SELF, "Your wrist launcher clicks and you realize it's not loaded");
}
}
