#include "x0_i0_spells"
#include "x2_inc_toollib"
#include "x2_inc_spellhook"
#include "pug_inc"

const string TRAP_DAMAGE = "TRAP_DAMAGE";
const int SKILL_CRAFT_MECHANICAL = 38;
const int SKILL_CRAFT_ELECTRONIC = 37;
const int SKILL_CRAFT_CHEMICAL = 36;

// called in module acquire item script
// will convert minor traps that have been
// customized for RotR to their custom counterparts
// note: this is primarily for recovering traps
void ConvertTrap(object oItem, object oPC);

// used to take over or disable turrets
void HackTurret(object oPC, object oTurret, int bTakeOver = FALSE);

// Does a damage type grenade (splash only)
// nDamage will be applied as a decreasing
// percentage as the distance grows from the center
// I.E. impact point = 1 * nDamage
// I.E. Others = (fExplosionRadius - Distance) / fExplosionRadius * nDamage
void DoGrenadeQX(int nSpellID, int nDamage, int vSmallHit, int vRingHit, int nDamageType, float fExplosionRadius , int nObjectFilter, int nRacialType=RACIAL_TYPE_ALL);

// Does a damage type grenade (splash only)
// nDamage will be applied as a decreasing
// percentage as the distance grows from the center
// I.E. impact point = 1 * nDamage
// I.E. Others = (fExplosionRadius - Distance) / fExplosionRadius * nDamage
void DoExplosiveMineQX(location lLocation, int nSpellID, int nDamage, int vSmallHit, int vRingHit, int nDamageType, float fExplosionRadius , int nObjectFilter, int nRacialType=RACIAL_TYPE_ALL);

// Fire the repeating impact effect
void RunFireImpact(int nSpellID, object oTarget, int nDamage);

// A different approach for timing these spells that has the positive side
// effects of making the spell dispellable as well.
// I am using the VFX applied by the spell to track the remaining duration
// instead of adding the remaining runtime on the stack.
// This function returns FALSE if a delayed Spell effect from nSpell_ID has
// expired. See x2_s0_bigby4.nss for details
int QXGetDelayedSpellEffectsExpired(int nSpell_ID, object oTarget);

// Removes all effects from nID without paying attention to the caster as
// the spell can from only one caster anyway
// By default, it will only cancel magical effects
void QXRemoveSpellEffects(int nID,object oTarget, int bMagicalEffectsOnly = TRUE);

// freezes the target in ice or carbonite or whatever
void QXDoFreeze(int nRounds, object oTarget, int nSpellID);

// * Does a stinking cloud. If oTarget is Invalid, then does area effect, otherwise
// * just attempts on otarget
void QXspellsStinkingCloud(int nDC = 6, object oTarget = OBJECT_INVALID);


/////////////////////// FUNCTIONS /////////////////////////////////////////////
void DoGrenadeQX(int nSpellID, int nDamage, int vSmallHit, int vRingHit, int nDamageType, float fExplosionRadius , int nObjectFilter, int nRacialType=RACIAL_TYPE_ALL)
{
    //Declare major variables  ( fDist / (3.0f * log( fDist ) + 2.0f) )
    object oTarget = GetSpellTargetObject();
    float fMultiplier;
    effect eVis = EffectVisualEffect(vSmallHit);
    location lTarget = GetSpellTargetLocation();
    float fDistance;
    float fDelay;
    int nTargetRacialType;

    if(GetIsObjectValid(oTarget))
    {
        lTarget = GetLocation(oTarget);
    }

    effect eExplode = EffectVisualEffect(vRingHit);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, lTarget);
    oTarget = GetFirstObjectInShape(SHAPE_SPHERE, fExplosionRadius, lTarget, FALSE, nObjectFilter);
    //Cycle through the targets within the spell shape until an invalid object is captured.
    while (GetIsObjectValid(oTarget))
    {
        //AssignCommand(oTarget, SpeakString("I have been bombed by SpellID " + IntToString(nSpellID) , TALKVOLUME_SHOUT));

        fDistance = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget));
        float fDelay = fDistance/20;
        nTargetRacialType = GetRacialType(oTarget);
        //Roll damage for each target
        fMultiplier = (fExplosionRadius - fDistance) / fExplosionRadius;
        nDamage = FloatToInt(IntToFloat(nDamage) * fMultiplier);

        //Set the damage effect
        effect eDam = EffectDamage(nDamage, nDamageType);

        // chance of combustion for fire damage grenades
        if(!MySavingThrow(SAVING_THROW_REFLEX, oTarget, d20(4)) && (nDamageType == DAMAGE_TYPE_FIRE))
        {
            int nDuration = d4(2);
            effect eDur = EffectVisualEffect(498);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, oTarget, RoundsToSeconds(nDuration));
            RunFireImpact(nSpellID, oTarget, d6(3));
        }
        // chance of freezing for cold damage grenades
        if(!MySavingThrow(SAVING_THROW_REFLEX, oTarget, d20(4)) && (nDamageType == DAMAGE_TYPE_COLD))
        {
            int nDuration = d4(2);
            QXDoFreeze(nDuration, oTarget, nSpellID);
        }
        // chance of stunning droids for electric damage grenades
        if(!MySavingThrow(SAVING_THROW_WILL, oTarget, d20(4)) && (nDamageType == DAMAGE_TYPE_ELECTRICAL) && nTargetRacialType == RACIAL_TYPE_CONSTRUCT)
        {
            int nDuration = d4(2);
            effect eStun = EffectStunned();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eStun, oTarget, RoundsToSeconds(nDuration));
        }
        // chance of deafness from sonic grenades
        if(!MySavingThrow(SAVING_THROW_FORT, oTarget, d20(2)) && (nDamageType == DAMAGE_TYPE_SONIC))
        {
            int nDuration = d4(2);
            effect eDeaf = EffectDeaf();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDeaf, oTarget, RoundsToSeconds(nDuration));
        }
        // chance of knockdown from sonic grenades
        if(!MySavingThrow(SAVING_THROW_REFLEX, oTarget, d20(3)) && (nDamageType == DAMAGE_TYPE_SONIC))
        {
            int nDuration = d4(2);
            effect eKD = EffectKnockdown();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKD, oTarget, RoundsToSeconds(nDuration));
        }
        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId()));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));

       //Select the next target within the spell shape.
       oTarget = GetNextObjectInShape(SHAPE_SPHERE, fExplosionRadius, lTarget, FALSE, nObjectFilter);
    }
}

void DoExplosiveMineQX(location lLocation, int nSpellID, int nDamage, int vSmallHit, int vRingHit, int nDamageType, float fExplosionRadius , int nObjectFilter, int nRacialType=RACIAL_TYPE_ALL)
{
    //Declare major variables  ( fDist / (3.0f * log( fDist ) + 2.0f) )
    object oTarget;
    float fMultiplier;
    effect eVis = EffectVisualEffect(vSmallHit);
    location lTarget = lLocation;
    float fDistance;
    float fDelay;
    int nTargetRacialType;

    effect eExplode = EffectVisualEffect(vRingHit);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, lTarget);
    oTarget = GetFirstObjectInShape(SHAPE_SPHERE, fExplosionRadius, lTarget, FALSE, nObjectFilter);
    //Cycle through the targets within the spell shape until an invalid object is captured.
    while (GetIsObjectValid(oTarget))
    {
        //AssignCommand(oTarget, SpeakString("I have been bombed by SpellID " + IntToString(nSpellID) , TALKVOLUME_SHOUT));

        fDistance = GetDistanceBetweenLocations(lTarget, GetLocation(oTarget));
        float fDelay = fDistance/20;
        nTargetRacialType = GetRacialType(oTarget);
        //Roll damage for each target
        fMultiplier = (fExplosionRadius - fDistance) / fExplosionRadius;
        nDamage = FloatToInt(IntToFloat(nDamage) * fMultiplier);

        //Set the damage effect
        effect eDam = EffectDamage(nDamage, nDamageType);
        // chance of combustion for fire damage grenades
        if(!MySavingThrow(SAVING_THROW_REFLEX, oTarget, d20(4)) && (nDamageType == DAMAGE_TYPE_FIRE))
        {
            int nDuration = d4(2);
            effect eDur = EffectVisualEffect(498);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, oTarget, RoundsToSeconds(nDuration));
            RunFireImpact(nSpellID, oTarget, d6(3));
        }
        // chance of freezing for cold damage grenades
        if(!MySavingThrow(SAVING_THROW_REFLEX, oTarget, d20(4)) && (nDamageType == DAMAGE_TYPE_COLD))
        {
            int nDuration = d4(2);
            QXDoFreeze(nDuration, oTarget, nSpellID);
        }
        // chance of stunning droids for electric damage grenades
        if(!MySavingThrow(SAVING_THROW_WILL, oTarget, d20(4)) && (nDamageType == DAMAGE_TYPE_ELECTRICAL) && nTargetRacialType == RACIAL_TYPE_CONSTRUCT)
        {
            int nDuration = d4(2);
            effect eStun = EffectStunned();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eStun, oTarget, RoundsToSeconds(nDuration));
        }
        // chance of deafness from sonic grenades
        if(!MySavingThrow(SAVING_THROW_FORT, oTarget, d20(4)) && (nDamageType == DAMAGE_TYPE_SONIC))
        {
            int nDuration = d4(2);
            effect eDeaf = EffectDeaf();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDeaf, oTarget, RoundsToSeconds(nDuration));
        }
        // chance of knockdown from sonic grenades
        if(!MySavingThrow(SAVING_THROW_REFLEX, oTarget, d20(3)) && (nDamageType == DAMAGE_TYPE_SONIC))
        {
            int nDuration = d4(2);
            effect eKD = EffectKnockdown();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKD, oTarget, RoundsToSeconds(nDuration));
        }
        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId()));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));

       //Select the next target within the spell shape.
       oTarget = GetNextObjectInShape(SHAPE_SPHERE, fExplosionRadius, lTarget, FALSE, nObjectFilter);
    }
}


void RunFireImpact(int nSpellID, object oTarget, int nDamage)
{
    int nDam;
     //--------------------------------------------------------------------------
    // Check if the spell has expired (check also removes effects)
    //--------------------------------------------------------------------------
    if (QXGetDelayedSpellEffectsExpired(nSpellID,oTarget))
    {
        return;
    }

    if (GetIsDead(oTarget) == FALSE)
    {

        int nDC = GetLocalInt(oTarget,"XP2_L_SPELL_SAVE_DC_" + IntToString (nSpellID));

        //reflex save for half damage
        if(!MySavingThrow(SAVING_THROW_REFLEX, oTarget, d20(3), SAVING_THROW_TYPE_FIRE))
        {
            nDam = nDamage;

            effect eDmg = EffectDamage(nDam,DAMAGE_TYPE_FIRE);
            effect eVFX = EffectVisualEffect(VFX_IMP_FLAME_S);

            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDmg,oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVFX,oTarget);

            //------------------------------------------------------------------
            // After six seconds (1 round), check damage again
            //------------------------------------------------------------------
            DelayCommand(6.0f,RunFireImpact(nSpellID,oTarget, d6(2)));
        }
        else
        {
            DeleteLocalInt(oTarget,"XP2_L_SPELL_SAVE_DC_" + IntToString (nSpellID));
            QXRemoveSpellEffects(nSpellID, oTarget);
        }
   }
}

//--------------------------------------------------------------------------
// Removes all effects from nID without paying attention to the caster as
// the spell can from only one caster anyway
// By default, it will only cancel magical effects
//--------------------------------------------------------------------------
void QXRemoveSpellEffects(int nID,object oTarget, int bMagicalEffectsOnly = TRUE)
{
    effect eEff = GetFirstEffect(oTarget);
    while (GetIsEffectValid(eEff))
    {
        if (GetEffectSpellId(eEff) == nID)
        {
            if (GetEffectSubType(eEff) != SUBTYPE_MAGICAL && bMagicalEffectsOnly)
            {
                // ignore
            }
            else
            {
                RemoveEffect(oTarget,eEff);
            }
        }
        eEff = GetNextEffect(oTarget);
    }
}

//------------------------------------------------------------------------------
// A different approach for timing these spells that has the positive side
// effects of making the spell dispellable as well.
// I am using the VFX applied by the spell to track the remaining duration
// instead of adding the remaining runtime on the stack
//
// This function returns FALSE if a delayed Spell effect from nSpell_ID has
// expired. See x2_s0_bigby4.nss for details
//------------------------------------------------------------------------------
int QXGetDelayedSpellEffectsExpired(int nSpell_ID, object oTarget)
{
    if (!GetHasSpellEffect(nSpell_ID,oTarget) )
    {
        DeleteLocalInt(oTarget,"XP2_L_SPELL_SAVE_DC_" + IntToString (nSpell_ID));
        return TRUE;
    }

    if (GetIsDead(oTarget))
    {
        DeleteLocalInt(oTarget,"XP2_L_SPELL_SAVE_DC_" + IntToString (nSpell_ID));
        QXRemoveSpellEffects(nSpell_ID, oTarget);
        return TRUE;
    }

    return FALSE;
}

void QXDoFreeze(int nRounds, object oTarget, int nSpellID)
{
    int bIsPC = GetIsPC(oTarget);
    int bShowPopup = FALSE;
    float fDuration;

    fDuration = RoundsToSeconds(nRounds); // One Round per hit-die or caster level

    effect ePetrify = EffectPetrify();

    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    effect eDur2 = EffectVisualEffect(VFX_DUR_GLOW_BLUE);
    effect eLink = EffectLinkEffects(eDur, ePetrify);
    eLink = EffectLinkEffects(eLink, eDur2);

        // Let target know the negative spell has been cast
        SignalEvent(oTarget,
        EventSpellCastAt(OBJECT_SELF, nSpellID));

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
        //----------------------------------------------------------
        // GZ: Fix for henchmen statues haunting you when changing
        //     areas. Henchmen are now kicked from the party if
        //     petrified.
        //----------------------------------------------------------
        if (GetAssociateType(oTarget) == ASSOCIATE_TYPE_HENCHMAN)
        {
            FireHenchman(GetMaster(oTarget),oTarget);
        }
        // April 2003: Clearing actions to kick them out of conversation when petrified
        AssignCommand(oTarget, ClearAllActions(TRUE));
}

// * Does a stinking cloud. If oTarget is Invalid, then does area effect, otherwise
// * just attempts on otarget
void QXspellsStinkingCloud(int nDC = 6, object oTarget = OBJECT_INVALID)
{
    effect eStink = EffectDazed();
    effect eMind = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    effect eLink = EffectLinkEffects(eMind, eStink);
    eLink = EffectLinkEffects(eLink, eDur);

    effect eVis = EffectVisualEffect(VFX_IMP_DAZED_S);

    effect eImpact; // * null


    if (GetIsObjectValid(oTarget) == TRUE)
    {
        if (GetRacialType(oTarget) != RACIAL_TYPE_CONSTRUCT)
        {
            //Fire cast spell at event for the specified target
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, GetSpellId()));
            float fDelay = GetRandomDelay(0.75, 1.75);
            //Apply the VFX impact and linked effects
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(2)));
        }
    }
    else
    {
       spellsGenericAreaOfEffect(GetAreaOfEffectCreator(),
            GetLocation(OBJECT_SELF), // * not relevent for persistent area of effect
            SHAPE_CONE, 0.0,          // * not relevent for persistent area of effect
            GetSpellId(), eImpact, eLink, eVis,
            DURATION_TYPE_TEMPORARY, RoundsToSeconds(2), SPELL_TARGET_ALLALLIES,
            TRUE, FALSE, 0, 0, 0, FALSE, OBJECT_TYPE_CREATURE,
            TRUE, FALSE, SAVING_THROW_FORT, SAVING_THROW_TYPE_MIND_SPELLS);
    }
}

void HackTurret(object oPC, object oTurret, int bTakeOver = FALSE)
{
    if(bTakeOver)
    {
        string sFac = GetFaction(oPC, TRUE); object oFac;
        if (sFac == "Fringe")
            {oFac = GetObjectByTag("faction_fringe");}
        else if (sFac == "Rebels")
            {oFac = GetObjectByTag("faction_rebels");}
        else if (sFac == "Empire")
            {oFac = GetObjectByTag("faction_empire");}
        ChangeFaction(oTurret, oFac);
        SendMessageToPC(oPC, "*You have taken control of the turret*");
    }
    else
    {
         SendMessageToPC(oPC, "*You have disabled the turret*");
    }
}

void ConvertTrap(object oItem, object oPC)
{
    string sTag = GetTag(oItem);
    string sResRef;
    int bReplace = FALSE;

    if(sTag == "NW_IT_TRAP021")
    {
        sResRef = "qx_trap_001";
        bReplace = TRUE;
    }
    else if(sTag == "NW_IT_TRAP025")
    {
        sResRef = "qx_trap_002";
        bReplace = TRUE;
    }
    else if(sTag == "NW_IT_TRAP005")
    {
        sResRef = "qx_trap_003";
        bReplace = TRUE;
    }
    else if(sTag == "NW_IT_TRAP017")
    {
        sResRef = "qx_trap_004";
        bReplace = TRUE;
    }
    else if(sTag == "NW_IT_TRAP009")
    {
        sResRef = "qx_trap_005";
        bReplace = TRUE;
    }
    else if(sTag == "NW_IT_TRAP029")
    {
        sResRef = "qx_trap_006";
        bReplace = TRUE;
    }
    else if(sTag == "NW_IT_TRAP013")
    {
        sResRef = "qx_trap_007";
        bReplace = TRUE;
    }
    else if(sTag == "NW_IT_TRAP001") //for turrets
    {
        //DestroyObject(oItem,0.1);
        bReplace = FALSE;
    }

    if(bReplace)
    {
        CreateItemOnObject(sResRef, oPC);
        DestroyObject(oItem,0.1);
    }
}
