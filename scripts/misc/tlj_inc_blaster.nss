// This is a library holding functions dealing with blasters

#include "tlj_inc_generic"
#include "x2_inc_itemprop"
#include "tlj_inc_attacked"

// FUNCTION DECLARATIONS ///////////////////////////////////////////////////////

// This function is meant to be called when unequipping oBlaster from oPC's
// inventory slot. It saves the remaining rounds, if any, so that they may be
// used again when the same weapon is equipped.
//
// Use RecallBlasterRounds() function to return the stored rounds.
void StoreBlasterRounds(object oPC, object oBlaster);

// This function is intended to be called from the OnEquip script event.
// It retrieves the rounds stored away with StoreBlasterRounds() function on
// oBlaster and equips them as actual ammunition in oPC's inventory slot.
void RecallBlasterRounds(object oPC, object oBlaster);

// Unload the the ammunition that is currently loaded in oPC's currently
// held blaster. This basically just destroys the ammo clip that is equipped
// in the appropriate ammo inventory slot.
void UnloadBlaster();

// Called from the blaster actions feat. This function loads oPC's currently
// held blaster with any valid ammo in oPC's inventory.
//
// Note that if an NPC is passed into the oPC parameter, then this function
// will IGNORE the ammo requirement entirely.
void ReloadBlaster(object oBlaster=OBJECT_INVALID, int nRecalledRounds=0);

// This returns the correct ammo INVENTORY_SLOT_* constant for oBlaster. Will
// return -1 on error.
int GetBlasterAmmoSlot(object oBlaster);

// This will return TRUE if there are rounds loaded into oBlaster. It checks
// to see if there is a clip in the appropriate ammo slot.
int IsBlasterLoaded(object oPC, object oBlaster, int nMinRounds=1);

// Decrement the remaining ammunition of oBlaster by nAmount.
void DecrementAmmo(object oBlaster, int nAmount);

// Use a special shot specific to the blaster that is being fired.
void UseBlasterSpecialShot(object oTarget);

// FUNCTION DEFINITIONS ////////////////////////////////////////////////////////

void StoreBlasterRounds(object oPC, object oBlaster) {

    // Variable declaration
    int nSlot = GetBlasterAmmoSlot(oBlaster);
    int nRounds;
    int nBaseItem = GetBaseItemType(oBlaster);

    // Check if we have any rounds left, and how many.
    object oRounds = GetItemInSlot(nSlot, oPC);
    if (GetIsObjectValid(oRounds)) {
        nRounds = GetItemStackSize(oRounds);

        // Destroy the rounds.
        DestroyObject(oRounds);
    }
    // Save the remaining rounds, if any, as a local variable onto the blaster.
    SetLocalInt(oBlaster, "REMAINING_BLASTER_ROUNDS", nRounds);
}

void RecallBlasterRounds(object oPC, object oBlaster) {
    int nRounds = GetLocalInt(oBlaster, "REMAINING_BLASTER_ROUNDS");
    if (nRounds > 0) {
        AssignCommand(oPC, ReloadBlaster(oBlaster, nRounds));
    }
}

void UnloadBlaster() {
    PlaySound("reload");

    // -----------------------------------------------------------------------
    // Grab the blaster item that oPC is currently holding. If not valid,
    // then give an error message saying so.
    // -----------------------------------------------------------------------
    object oBlaster = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF);
    if (!GetIsObjectValid(oBlaster)) {
        FloatingTextStringOnCreature("You are not holding a blaster.", OBJECT_SELF, FALSE);
    }
    // -----------------------------------------------------------------------
    // In this switch/case, we look up the base item type of oBlaster
    // then determine which ammo slot to use from there.
    // -----------------------------------------------------------------------
    int nSlot = GetBlasterAmmoSlot(oBlaster);
    // -----------------------------------------------------------------------
    // Now that we have the right slot, we destroy the remaining rounds, if any.
    // If none found, then give an error message. We will still attempt to
    // remove any variables set from StoreBlasterRounds() function.
    // -----------------------------------------------------------------------
    DeleteLocalInt(oBlaster, "REMAINING_BLASTER_ROUNDS");
    object oRounds = GetItemInSlot(nSlot, OBJECT_SELF);
    if (GetIsObjectValid(oRounds)) {
        DestroyObject(oRounds);
    }
    else {
        FloatingTextStringOnCreature("This blaster is already unloaded.", OBJECT_SELF, FALSE);
    }
}

void ReloadBlaster(object oBlaster=OBJECT_INVALID, int nRecalledRounds=0) {
    if (nRecalledRounds == 0) PlaySound("reload");

    if (oBlaster == OBJECT_INVALID) {
        oBlaster = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
    }
    int bPC = GetIsPC(OBJECT_SELF) && !GetIsDMPossessed(OBJECT_SELF);

    // ------------------------------------------------------------------------
    // First off, check to see which inventory slot we use for our generated
    // rounds by checking the blaster's base item type. Exit out if we're not
    // even holding a blaster at all.
    // ------------------------------------------------------------------------
    int nBaseItem = GetBaseItemType(oBlaster);
    int nSlot;
    string sRoundsResRef;
    switch (nBaseItem) {
        case BASE_ITEM_BLASTER_PISTOL: sRoundsResRef = "rounds_arrows"; nSlot = INVENTORY_SLOT_ARROWS; break;
        case BASE_ITEM_BLASTER_RIFLE: sRoundsResRef = "rounds_arrows"; nSlot = INVENTORY_SLOT_ARROWS; break;
        case BASE_ITEM_ASSAULT_BLASTER: sRoundsResRef = "rounds_bolts"; nSlot = INVENTORY_SLOT_BOLTS; break;
        case BASE_ITEM_HEAVY_BLASTER: sRoundsResRef = "rounds_bolts"; nSlot = INVENTORY_SLOT_BOLTS; break;
        default: {
            if (bPC) FloatingTextStringOnCreature("You are not holding a blaster.", OBJECT_SELF, FALSE);
            else SpeakError("tlj_inc_blaster", "EQUIPPED RANGED WEAPON INVALID");
            return;
        }
    }

    // ----------------------------------------------------------------------
    // Next, we make sure the blaster is not already loaded. If it is, then
    // it's critical we exit out now because in some cases, we may have a bug
    // where oPC is constantly equipping/unequipping ammunition.
    // ----------------------------------------------------------------------
    if (IsBlasterLoaded(OBJECT_SELF, oBlaster)) {
        if (bPC) FloatingTextStringOnCreature("This blaster is already loaded.", OBJECT_SELF, FALSE);
        else SpeakError("tlj_inc_blaster", "RANGED WEAPON ALREADY LOADED");
        return;
    }

    // ------------------------------------------------------------------------
    // Determine what properties go onto our generated rounds by cycling
    // through the item properties on the blaster.
    // ------------------------------------------------------------------------
    int nAmmoType = 0, // 0 = power cell && 1 = magazine
        nRoundCap = 45, // Number of rounds loaded per power cell or magazine
        bAutomatic, // Is the gun automatic or not?
        nImpactScript = IP_CONST_IMPACT_SCRIPT_BLASTER_BOLT, // The script fired on impact
        bDamage1, // Are we using at least one damage type?
        nDamageType1, // What damage type?
        nDamageAmount1, // How much of that type?
        bDamage2, // Are we using two damage types?
        nDamageType2, // What damage type?
        nDamageAmount2, // How much of that damage type?
        bDamage3, // Are we using three damage types?
        nDamageType3, // What damage type?
        nDamageAmount3, // How much of that damage type?
        bDamage4, // Are we using four damage types?
        nDamageType4, // What damage type?
        nDamageAmount4; // How much of that damage type?


    itemproperty ip = GetFirstItemProperty(oBlaster);
    int nipType;
    int nipCostVal;
    while (GetIsItemPropertyValid(ip)) {
        nipType = GetItemPropertyType(ip);

        // Ammunition type && Rounds cap
        if (nipType == ITEM_PROPERTY_AMMO_TYPE) {
            nAmmoType = GetItemPropertySubType(ip);
            nipCostVal = GetItemPropertyCostTableValue(ip);
            switch (nipCostVal) {
                case 0: nRoundCap = 1; break;
                case 1: nRoundCap = 2; break;
                case 2: nRoundCap = 3; break;
                case 3: nRoundCap = 4; break;
                case 4: nRoundCap = 5; break;
                case 5: nRoundCap = 6; break;
                case 6: nRoundCap = 7; break;
                case 7: nRoundCap = 8; break;
                case 8: nRoundCap = 9; break;
                case 9: nRoundCap = 10; break;
                case 10: nRoundCap = 11; break;
                case 11: nRoundCap = 12; break;
                case 12: nRoundCap = 13; break;
                case 13: nRoundCap = 14; break;
                case 14: nRoundCap = 15; break;
                case 15: nRoundCap = 16; break;
                case 16: nRoundCap = 17; break;
                case 17: nRoundCap = 18; break;
                case 18: nRoundCap = 19; break;
                case 19: nRoundCap = 20; break;
                case 20: nRoundCap = 25; break;
                case 21: nRoundCap = 30; break;
                case 22: nRoundCap = 35; break;
                case 23: nRoundCap = 40; break;
                case 24: nRoundCap = 45; break;
                case 25: nRoundCap = 50; break;
                case 26: nRoundCap = 60; break;
                case 27: nRoundCap = 70; break;
                case 28: nRoundCap = 80; break;
                case 29: nRoundCap = 90; break;
                default: break;
            }
        }

        // Rate of fire
        else if (nipType == ITEM_PROPERTY_RATE_OF_FIRE) {
            if (GetItemPropertySubType(ip) == IP_CONST_RATE_OF_FIRE_AUTOMATIC) {
                bAutomatic = TRUE;
            }
        }

        // Impact script
        else if (nipType == ITEM_PROPERTY_BLASTER_IMPACT_SCRIPT) {
            nImpactScript = GetItemPropertySubType(ip);
        }

        // Damage
        else if (nipType == ITEM_PROPERTY_RANGED_DAMAGE) {
            if (!bDamage1) {
                bDamage1 = TRUE;
                nDamageType1 = GetItemPropertySubType(ip);
                nDamageAmount1 = GetItemPropertyCostTableValue(ip);
            }
            else if (!bDamage2) {
                bDamage2 = TRUE;
                nDamageType2 = GetItemPropertySubType(ip);
                nDamageAmount2 = GetItemPropertyCostTableValue(ip);
            }
            else if (!bDamage3) {
                bDamage3 = TRUE;
                nDamageType3 = GetItemPropertySubType(ip);
                nDamageAmount3 = GetItemPropertyCostTableValue(ip);
            }
            else if (!bDamage4) {
                bDamage4 = TRUE;
                nDamageType4 = GetItemPropertySubType(ip);
                nDamageAmount4 = GetItemPropertyCostTableValue(ip);
            }
        }

        ip = GetNextItemProperty(oBlaster);
    }

    // This is incase the ranged weapon does not
    // have any damage properties set on it.
    if (!bDamage1) {
        bDamage1 = TRUE;
        nDamageType1 = DAMAGE_TYPE_ENERGY;
        nDamageAmount1 = IP_CONST_DAMAGEBONUS_20;
    }

    // ----------------------------------------------------------------------
    // If the caller is an NPC, DM controlled or otherwise, OR if we're recalling
    // rounds, then we assume that we have valid ammunition, even if we don't,
    // skipping this next sction entirely.
    // ----------------------------------------------------------------------
    if (bPC && nRecalledRounds < 1) {

        // ----------------------------------------------------------------------
        // Cycle through our inventory in search of valid ammunition.
        // ----------------------------------------------------------------------
        /*if (nAmmoType == -1) {
            FloatingTextStringOnCreature("This blaster has an invalid ammunition type.", OBJECT_SELF, FALSE);
            return;
        }*/

        int bValidAmmo;
        object oAmmo = GetFirstItemInInventory();
        while (GetIsObjectValid(oAmmo)) {
            if (GetTag(oAmmo) == "POWER_CELL") {
                if (nAmmoType == 0) {
                    bValidAmmo = TRUE;
                    break;
                }
            }
            else if (GetTag(oAmmo) == "MAGAZINE") {
                if (nAmmoType == 1) {
                    bValidAmmo = TRUE;
                    break;
                }
            }
            oAmmo = GetNextItemInInventory();
        }
        // ----------------------------------------------------------------------
        // Error message for being unable to locate any valid ammo while
        // cycling through the PC's inventory. Exit out at this point.
        // ----------------------------------------------------------------------
        if (!bValidAmmo) {
            FloatingTextStringOnCreature("You have no ammunition.", OBJECT_SELF, FALSE);
            return;
        }

        // ----------------------------------------------------------------------
        // Remove one from the ammo stack, or if it isn't a stack, then
        // just destroy the item.
        // ----------------------------------------------------------------------
        int nStack = GetItemStackSize(oAmmo);
        if (nStack == 1) DestroyObject(oAmmo);
        else if (nStack > 1) {
            SetItemStackSize(oAmmo, nStack - 1);
        }
    }

    // ----------------------------------------------------------------------
    // Generate the rounds item onto the PC in the correct inventory slot.
    // ----------------------------------------------------------------------
    if (nRecalledRounds != 0) nRoundCap = nRecalledRounds;
    if (nRoundCap <= 0) {
        if (bPC) FloatingTextStringOnCreature("This blaster has an invalid ammunition amount.", OBJECT_SELF, FALSE);
        else SpeakError("tlj_inc_blaster", "INVALID AMMUNITION AMOUNT");
        return;
    }
    object oRounds = CreateItemOnObject(sRoundsResRef, OBJECT_SELF, nRoundCap);
    SetDroppableFlag(oRounds, FALSE);
    itemproperty ipDamageBonus;

    // ----------------------------------------------------------------------
    // Create the specific item properties on
    // our generated rounds as determined above
    // ----------------------------------------------------------------------
    itemproperty ipImpactScript = ItemPropertyImpactScript(nImpactScript);
    IPSafeAddItemProperty(oRounds, ipImpactScript);
    if (bDamage1) {
        itemproperty ipDamage1 = ItemPropertyDamageBonus(nDamageType1, nDamageAmount1);
        IPSafeAddItemProperty(oRounds, ipDamage1);
    }
    if (bDamage2) {
        itemproperty ipDamage2 = ItemPropertyDamageBonus(nDamageType2, nDamageAmount2);
        IPSafeAddItemProperty(oRounds, ipDamage2);
    }
    if (bDamage3) {
        itemproperty ipDamage3 = ItemPropertyDamageBonus(nDamageType3, nDamageAmount3);
        IPSafeAddItemProperty(oRounds, ipDamage3);
    }
    if (bDamage4) {
        itemproperty ipDamage4 = ItemPropertyDamageBonus(nDamageType4, nDamageAmount4);
        IPSafeAddItemProperty(oRounds, ipDamage4);
    }

    // ----------------------------------------------------------------------
    // Equip the rounds into the appropriate inventory slot.
    // ----------------------------------------------------------------------
    ActionEquipItem(oRounds, nSlot);
}

int GetBlasterAmmoSlot(object oBlaster) {
    int nBaseItem = GetBaseItemType(oBlaster);
    switch (nBaseItem) {
        case BASE_ITEM_BLASTER_PISTOL: return INVENTORY_SLOT_ARROWS;
        case BASE_ITEM_BLASTER_RIFLE: return INVENTORY_SLOT_ARROWS;
        case BASE_ITEM_ASSAULT_BLASTER: return INVENTORY_SLOT_BOLTS;
        case BASE_ITEM_HEAVY_BLASTER: return INVENTORY_SLOT_BOLTS;
    }
    return -1;
}

int IsBlasterLoaded(object oPC, object oBlaster, int nMinRounds=1) {
    int nRounds = GetItemStackSize(GetItemInSlot(GetBlasterAmmoSlot(oBlaster), oPC));
    if (nRounds >= nMinRounds) return TRUE;
    return FALSE;
}

int GetAttackBonusValue(object oWeapon) {
    itemproperty ip = GetFirstItemProperty(oWeapon);

    while (GetIsItemPropertyValid(ip)) {
        if (GetItemPropertyType(ip) == ITEM_PROPERTY_ATTACK_BONUS) {
            return GetItemPropertyCostTableValue(ip);
        }
        GetNextItemProperty(oWeapon);
    }
    return -1;
}

void DecrementAmmo(object oBlaster, int nAmount) {
    object oAmmo = GetItemInSlot(GetBlasterAmmoSlot(oBlaster));
    if (GetIsObjectValid(oAmmo)) {
        int nStack = GetItemStackSize(oAmmo);
        if (nStack <= nAmount) DestroyObject(oAmmo);
        else {
            SetItemStackSize(oAmmo, nStack - nAmount);
        }
    }
}

void UseBlasterSpecialShot(object oTarget) {
    PlaySound("fw_blaster");

    object oBlaster = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF);
    string sBlasterTag = GetTag(oBlaster);
    float fRange = GetDistanceBetween(OBJECT_SELF, oTarget);
    int nRoundCost = 100;
    int nShotType, nDamage, nDamageType, nBlastVisual;

    // ----------------------------------------------------------------------
    // First, determine our attack bonus. This will modified it further down.
    // Also note that we do NOT use the attack bonus on the weapon at all.
    // ----------------------------------------------------------------------
    int nAbility = (GetHasFeat(FEAT_ZEN_ARCHERY)) ? ABILITY_WISDOM : ABILITY_DEXTERITY;
    int nAttack = GetBaseAttackBonus(OBJECT_SELF) + GetAbilityModifier(nAbility);
    nAttack = GetModifiedAttackByFeats(OBJECT_SELF, oBlaster, nAttack);

    // ----------------------------------------------------------------------
    // Now we look to see what gun is being fired according to the tag then
    // configure various settings for our special shot. nShotType is used to
    // determine what type of special attack is being used.
    // ----------------------------------------------------------------------

    // Sniper Shot
    if (sBlasterTag == "BR_E11_S") { // E-11 Sniper Rifle
        nShotType = 1;
        nRoundCost = 1;
        nAttack += 12;
        nDamage = (d12(3) + 40) * 6; nDamageType = DAMAGE_TYPE_ENERGY;
    }
    // Blast
    if (sBlasterTag == "HB_CONCUSS") { // Concussion Rifle
        nShotType = 3;
        nRoundCost = 1;
        nDamage = d20(20); nDamageType = DAMAGE_TYPE_ION;
        nBlastVisual = VFX_FNF_CONCUSSION_BLAST;
    }

    // ----------------------------------------------------------------------
    // Let's check for our ammunition requirement. If we don't have the
    // requirement then exit out with an error message.
    // ----------------------------------------------------------------------
    if (IsBlasterLoaded(OBJECT_SELF, oBlaster, nRoundCost)) {
        DecrementAmmo(oBlaster, nRoundCost);
    }
    else {
        FloatingTextStringOnCreature("You don't have enough ammunition.", OBJECT_SELF, FALSE);
        return;
    }

    // ----------------------------------------------------------------------
    // Now that
    // ----------------------------------------------------------------------
    int nConcenDC = 20;
    switch (nShotType) {

        // Sniper Shot
        case 1: {

            // ----------------------------------------------------------------------
            // Check if we're laying down. If we're
            // not, then add a penalty to attack.
            // ----------------------------------------------------------------------

            if (GetPhenoType(OBJECT_SELF) != PHENO_CRAWLING) {
                nAttack += 20;
                nConcenDC -= 20;
            }

            // ----------------------------------------------------------------------
            // Factor range into the attack. For every 10 meters, we multiply
            // the attack by 2. It CAN drop down to zero from here.
            // ----------------------------------------------------------------------
          //  if (fRange <= 10.0) {
               // FloatingTextStringOnCreature("::Too close to target::", OBJECT_SELF, FALSE);
                //return;
           // }
            nAttack += FloatToInt(fRange) / 10;

            // ----------------------------------------------------------------------
            // If we fail a concentration check, then we miss.
            // ----------------------------------------------------------------------

            if (!GetIsSkillSuccessful(OBJECT_SELF, SKILL_CONCENTRATION, nConcenDC)) {
                FloatingTextStringOnCreature("::Missed::", OBJECT_SELF, FALSE);
                return;
            }

            // ----------------------------------------------------------------------
            // Now that all the attack and damage calculations are out of the way,
            // Gather up all the info we need for the attack statistics.
            // ----------------------------------------------------------------------
            int nAC = GetAC(oTarget);
            int nRoll = d20();
            int nTotal = nAC + nRoll;
            string sHitMath = "(" + IntToString(nRoll) + " + " + IntToString(nAttack) + " = " + IntToString(nTotal) + ")";
            string sOurName = GetName(OBJECT_SELF);
            string sTargetName = GetName(oTarget);

            // ----------------------------------------------------------------------
            // Check if our modified attack penetrates the
            // target's AC and apply damage if it does.
            // ----------------------------------------------------------------------
            if (nTotal >= nAC) {
                // Relay the attack statistics.
                SendMessageToPC(OBJECT_SELF,
                    ColorString(sOurName, 153, 255, 255) +
                    ColorString(" attacks " + sTargetName + " : *hit* : " + sHitMath, 255, 102, 1)
                );
                // Apply Damage
                nDamage+=500;
                effect eDamage = EffectDamage(nDamage, nDamageType);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);

                object oAttacker = OBJECT_SELF;
                AssignCommand(oTarget, EventOnAttacked(oAttacker, SPELL_IMPACT_BLASTER_BOLT));
            }
            else {
                // Relay the attack statistics.
                SendMessageToPC(OBJECT_SELF,
                    ColorString(sOurName, 153, 255, 255) +
                    ColorString(" attacks " + sTargetName + " : *miss* : " + sHitMath, 255, 102, 1)
                );
            }
            break;
        }

        // Short Range
        case 2: {

           break;
        }

        // Blast
        case 3: {
            location lTarget;
            location lImpact = GetLocation(oTarget);
            effect eStunVisual = EffectVisualEffect(VFX_IMP_STUN);
            effect eStun = EffectStunned();
            effect eCessate = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
            effect eSplashVisual = EffectVisualEffect(VFX_IMP_MAGBLUE);
            effect eDamage;
            effect eBlast = EffectVisualEffect(nBlastVisual);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eBlast, lImpact);

            // Cycle through all the targets caught within the blast radius
            oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, lImpact, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
            while (GetIsObjectValid(oTarget)) {

                // We only run stuff if the target is alive
                if (!GetIsDead(oTarget)) {

                    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_BLASTER_ACTION_SPECIAL_SHOT));

                    // If the target is a droid then make the target roll a save against stun
                    if (GetRacialType(oTarget) == RACIAL_TYPE_DROID) {
                        if (!WillSave(oTarget, 35)) {
                            eStun = EffectLinkEffects(eCessate, eStun);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eStunVisual, oTarget);
                            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eStun, oTarget, RoundsToSeconds(d6()));
                        }
                    }

                    // Grab the location of the current target and find the distance
                    // between it and the location of the innitial impact of the blast
                    // then use it to adjust splash damage dealt to the target.
                    lTarget = GetLocation(oTarget);
                    nDamage -= FloatToInt(GetDistanceBetweenLocations(lTarget, lImpact) * 100);

                    // Adjust the splash damage by the target's reflex and evasion
                    //nDamage = GetReflexAdjustedDamage(nDamage, oTarget, 35, nSaveType);

                    if (nDamage < 0) {
                        // Apply the splash damage to the target
                        eDamage = EffectDamage(nDamage, nDamageType, DAMAGE_POWER_PLUS_TWENTY);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eSplashVisual, oTarget);
                    }
                }
                oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, lImpact, FALSE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE);
            }
            break;
        }
    }

}
//void main() {}
