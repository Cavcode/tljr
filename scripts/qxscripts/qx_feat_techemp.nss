
//The Tech Specialist uses a device to create an electro-magnetic field. The field extends in a cone shape and has 2 possible effects:

//- All droid's caught in the fields path must pass a fortitude save against
//  the Tech Specialists Disable Device skill or be stunned for 1 round per
//  Tech Specialist level. (Maximum of 15 rounds.)

//- Some droid's caught in the field may be dominated temporarily.
//  This effect can be enhanced with the Craft Electronic skill.


#include "X0_I0_SPELLS"

void main()
{


    if( GZCanNotUseGazeAttackCheck(OBJECT_SELF))
    {
        return;
    }


    //Declare major variables
    int nLvl = GetLevelByClass(CLASS_TYPE_WIZARD, OBJECT_SELF);
    int nDom = d20(nLvl/5);
    int nCount = nLvl/5;
    int nDuration = nLvl;
    if (nDuration > 15)
    {
        nDuration = 15;
    }
    int nDevice = GetSkillRank(2) + GetAbilityModifier(ABILITY_INTELLIGENCE);
    int nCraft = nDevice + GetSkillRank(37);

    location lTargetLocation = GetSpellTargetLocation();
    object oTarget;
    effect eGaze = EffectDominated();
    effect eStun = EffectStunned();
    effect eVis =  EffectVisualEffect(VFX_COM_HIT_ELECTRICAL);
    effect eMind = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE);
    effect eMindDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    effect eVisDur = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DOMINATED);

    effect eLinkVis = EffectLinkEffects(eDur, eVisDur);
    effect eLinkMind = EffectLinkEffects(eMind, eMindDur);

    //Get first target in spell area
    oTarget = GetFirstObjectInShape(SHAPE_SPELLCONE, 15.0, lTargetLocation, TRUE);
    while(GetIsObjectValid(oTarget))
    {
        if(!GetIsReactionTypeFriendly(oTarget) && oTarget != OBJECT_SELF)
        {
            if (nCount > 0 && d2() == 1)
            {
                //Fire cast spell at event for the specified target
                SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELLABILITY_GAZE_DOMINATE));
                //Determine effect delay
                float fDelay = GetDistanceBetween(OBJECT_SELF, oTarget)/20;
                if(GetIsEnemy(oTarget) &&  GetRacialType(oTarget) == RACIAL_TYPE_CONSTRUCT)
                {
                    if(!MySavingThrow(SAVING_THROW_FORT, oTarget, nCraft, SAVING_THROW_TYPE_NONE, OBJECT_SELF, fDelay))
                    {
                        eGaze = GetScaledEffect(eGaze, oTarget);
                        eLinkVis = EffectLinkEffects(eLinkVis, eGaze);

                        //Apply the VFX impact and effects
                        //DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLinkVis, oTarget, RoundsToSeconds(nDuration)));
                        nCount -= nCount;
                    }
                }
            }
            else
            {
                //Fire cast spell at event for the specified target
                SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELLABILITY_GAZE_STUNNED));
                //Determine effect delay
                float fDelay = GetDistanceBetween(OBJECT_SELF, oTarget)/20;
                if(GetIsEnemy(oTarget))
                {
                    if(!MySavingThrow(SAVING_THROW_FORT, oTarget, nDevice, SAVING_THROW_TYPE_NONE, OBJECT_SELF, fDelay))
                    {
                        eLinkMind = EffectLinkEffects(eLinkMind, eStun);

                        //Apply the VFX impact and effects
                        DelayCommand(fDelay * d4(1), ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                        DelayCommand(fDelay * d4(2), ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                        DelayCommand(fDelay * d4(3), ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLinkMind, oTarget, RoundsToSeconds(nDuration)));
                    }
                }
            }
        }
        //Get next target in spell area
        oTarget = GetNextObjectInShape(SHAPE_SPELLCONE, 15.0, lTargetLocation, TRUE);
    }
}

