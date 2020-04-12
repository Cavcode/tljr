//::///////////////////////////////////////////////
//:: Turn Undead
//:: NW_S2_TurnDead
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks domain powers and class to determine
    the proper turning abilities of the casting
    character.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 2, 2001
//:: Updated On: Jul 15, 2003 - Georg Zoeller
//:://////////////////////////////////////////////
//:: MODIFIED MARCH 5 2003 for Blackguards
//:: MODIFIED JULY 24 2003 for Planar Turning to include turn resistance hd

void main()
{
    //int nClericLevel = GetLevelByClass(CLASS_TYPE_CLERIC);
    int nPaladinLevel = GetLevelByClass(CLASS_TYPE_PALADIN);
    int nBlackguardlevel = GetLevelByClass(CLASS_TYPE_BLACKGUARD);
    int nTotalLevel =  nPaladinLevel + nBlackguardlevel;
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
    //int nTurnLevel = nClericLevel;
    //int nClassLevel = nClericLevel;

    // GZ: Since paladin levels stack when turning, blackguard levels should stack as well
    // GZ: but not with the paladin levels (thus else if).
    //if((nBlackguardlevel - 2) > 0 && (nBlackguardlevel > nPaladinLevel))
    //{
    //    nClassLevel += (nBlackguardlevel - 2);
    //    nTurnLevel  += (nBlackguardlevel - 2);
    //}
    //else if((nPaladinLevel - 2) > 0)
    //{
    //    nClassLevel += (nPaladinLevel -2);
    //    nTurnLevel  += (nPaladinLevel - 2);
    //}

    //Flags for bonus turning types
    //int nElemental = GetHasFeat(FEAT_AIR_DOMAIN_POWER) + GetHasFeat(FEAT_EARTH_DOMAIN_POWER) + GetHasFeat(FEAT_FIRE_DOMAIN_POWER) + GetHasFeat(FEAT_WATER_DOMAIN_POWER);
    //int nVermin = GetHasFeat(FEAT_PLANT_DOMAIN_POWER);// + GetHasFeat(FEAT_ANIMAL_COMPANION);
    //int nConstructs = GetHasFeat(FEAT_DESTRUCTION_DOMAIN_POWER);
    //int nGoodOrEvilDomain =  GetHasFeat(FEAT_GOOD_DOMAIN_POWER) + GetHasFeat(FEAT_EVIL_DOMAIN_POWER);
    //int nPlanar = GetHasFeat(854);

    //Flag for improved turning ability
    //int nSun = GetHasFeat(FEAT_SUN_DOMAIN_POWER);

    //Make a turning check roll, modify if have the Sun Domain
    int nChrMod = GetAbilityModifier(ABILITY_CHARISMA);
    int nTurnCheck = d20() + nChrMod;              //The roll to apply to the max HD of undead that can be turned --> nTurnLevel
    int nTurnHD = d6(2) + nChrMod + nTotalLevel;   //The number of HD of undead that can be turned.


    //Gets all creatures in a 20m radius around the caster and turns them or not.  If the creatures
    //HD are 1/2 or less of the nClassLevel then the creature is destroyed.
    int nCnt = 1;
    int nHD, nRacial, nHDCount, bValid, nDamage;
    nHDCount = 0;
    //effect eVis = EffectVisualEffect(VFX_IMP_SUNSTRIKE);
    effect eVisTurn = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_POSITIVE);
    effect eDamage = EffectDamageIncrease(15);
    //effect eTurned = EffectTurned();
    effect eDur = EffectTemporaryHitpoints(nMagnitude * 20);
    effect eDur1 = EffectAttackIncrease(nMagnitude);
    effect eLink = EffectLinkEffects(eVisTurn, eDur);
    eLink = EffectLinkEffects(eLink, eDur1);
    //effect eDeath = SupernaturalEffect(EffectDeath(TRUE));

    //effect eImpactVis = EffectVisualEffect(VFX_FNF_LOS_HOLY_30);
    //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpactVis, GetLocation(OBJECT_SELF));

    //Get nearest enemy within 20m (60ft)
    //Why are you using GetNearest instead of GetFirstObjectInShape
    object oTarget = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE , OBJECT_SELF, nCnt,CREATURE_TYPE_PERCEPTION , PERCEPTION_SEEN);

    while(GetIsObjectValid(oTarget) && GetDistanceToObject(oTarget) <= 15.0)
    {
        if(GetIsFriend(oTarget))
        {
            if(GetRacialType(oTarget)== RACIAL_TYPE_CONSTRUCT)
            {
                bValid = FALSE;
            }
            else
            {
                bValid = TRUE;
            }

            //Apply results of the turn
            if( bValid == TRUE)
            {
                        if(nMagnitude == 5)
                        {
                            eLink = EffectLinkEffects(eLink, eDamage);
                        }
                        //Turn the target
                        //Fire cast spell at event for the specified target
                        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELLABILITY_AURA_OF_COURAGE));
                        //AssignCommand(oTarget, ActionMoveAwayFromObject(OBJECT_SELF, TRUE));
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(5 + nTotalLevel));
            }
            bValid = FALSE;
        }
        nCnt++;
        oTarget = GetNearestCreature(CREATURE_TYPE_IS_ALIVE,TRUE, OBJECT_SELF, nCnt,CREATURE_TYPE_PERCEPTION , PERCEPTION_SEEN);
    }
}
