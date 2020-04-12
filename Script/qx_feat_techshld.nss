// The Tech Specialist uses a device to cast an electrical net around their allies,
// creating a defensive field to deflect incoming damage and help resist certain elements.
// All allies within the aura gain +1 AC and 5 /- resistance to fire, acid, cold and sonic
// damage per every five Tech Specialist level.


void main()
{
    int nTotalLevel =  GetLevelByClass(CLASS_TYPE_WIZARD);
    int nMagnitude;

    if (nTotalLevel > 24)
    {
        nMagnitude = 6;
    }
    else if (nTotalLevel > 19)
    {
        nMagnitude = 5;
    }
    else if (nTotalLevel > 14)
    {
        nMagnitude = 4;
    }
    else if (nTotalLevel > 9)
    {
        nMagnitude = 3;
    }
    else if (nTotalLevel > 4)
    {
        nMagnitude = 2;
    }
    else
    {
        nMagnitude = 1;
    }


    //Gets all creatures in a 20m radius around the caster and turns them or not.
    int nCnt = 1;
    int bValid = TRUE;
    effect eVisTurn = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_POSITIVE);
    effect eCold = EffectDamageResistance(DAMAGE_TYPE_COLD, nMagnitude);
    effect eFire = EffectDamageResistance(DAMAGE_TYPE_FIRE, nMagnitude);
    effect eSonic = EffectDamageResistance(DAMAGE_TYPE_SONIC, nMagnitude);
    effect eAcid = EffectDamageResistance(DAMAGE_TYPE_ACID, nMagnitude);
    //effect eTurned = EffectTurned();
    effect eAC = EffectACIncrease(nMagnitude);
    effect eVis = EffectVisualEffect(VFX_IMP_SPELL_MANTLE_USE);
    effect eLink;
    eLink = EffectLinkEffects(eLink, eAC);
    eLink = EffectLinkEffects(eLink, eCold);
    eLink = EffectLinkEffects(eLink, eFire);
    eLink = EffectLinkEffects(eLink, eSonic);
    eLink = EffectLinkEffects(eLink, eAcid);


    // Apply to self
     object oTarget = OBJECT_SELF;
     SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELLABILITY_AURA_OF_COURAGE));
     //AssignCommand(oTarget, ActionMoveAwayFromObject(OBJECT_SELF, TRUE));
     ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
     float fVisDelay = 6.0;
     while (fVisDelay < RoundsToSeconds(5 + nTotalLevel))
     {
     DelayCommand(fVisDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
     fVisDelay += 6.0;
     }
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(5 + nTotalLevel));

    //Get nearest enemy within 20m (60ft)
    //Why are you using GetNearest instead of GetFirstObjectInShape
    oTarget = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE , OBJECT_SELF, nCnt,CREATURE_TYPE_PERCEPTION , PERCEPTION_SEEN);

    while(GetIsObjectValid(oTarget) && GetDistanceToObject(oTarget) <= 15.0)
    {
        if(GetIsFriend(oTarget))
        {

            bValid = TRUE;

            //Apply results of the turn
            if( bValid == TRUE)
            {
                        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELLABILITY_AURA_OF_COURAGE));
                        //AssignCommand(oTarget, ActionMoveAwayFromObject(OBJECT_SELF, TRUE));
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
                        int nCounter = 1;
                        fVisDelay = 6.0;
                        while (fVisDelay < RoundsToSeconds(5 + nTotalLevel))
                        {
                            DelayCommand(fVisDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                            fVisDelay += 6.0;
                        }
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(5 + nTotalLevel));
            }
            bValid = FALSE;
        }
        nCnt++;
        oTarget = GetNearestCreature(CREATURE_TYPE_IS_ALIVE,TRUE, OBJECT_SELF, nCnt,CREATURE_TYPE_PERCEPTION , PERCEPTION_SEEN);
    }
}
