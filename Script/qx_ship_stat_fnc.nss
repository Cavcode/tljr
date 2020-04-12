//::///////////////////////////////////////////////
//:: Name       Ship System Stat Functions
//:: FileName   qx_ship_stat_fnc
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
       ship
*/
//:://////////////////////////////////////////////
//:: Created By:    Quixsilver
//:: Created On:    02/24/2009
//:://////////////////////////////////////////////

#include "qx_ship_stat_inc"
#include "qx_ship_config"
//void main(){}
/////////// FUNCTION DECLARATIONS ////////////////

// Update the Ship Deed's (oItem) Description
// based on current ship configuration
void UpdateDeedShipStatDescription(object oItem);

// Implement!!!
// Installs oUgrade onto the ship designated by oItem Ship Deed
// bUpdateAllObjects set to TRUE will attempt to update and synchronize the
// upgrade across all ship objects (Creature, Area, Item, PC)
// Returns TRUE on success and FALSE on failure.
int InstallShipStatUpgrade(object oPC, object oItem, object oUpgrade);

// Returns the ShipStatsBasicStruct
// (the ship properties of most concern during combat, etc..)
// IMPLEMENT!!!
//    ship.nWeapon1Projectile     = GetLocalInt(oObject, VAR_SHIP_WEAPON1_PROJECTILE);
//    ship.nWeapon1Special        = GetLocalInt(oObject, VAR_SHIP_WEAPON1_SPECIAL);
struct ShipStatsBasicStruct GetShipStatsBasicStruct(object oObject);

// Returns the ShipStatsAdvancedStruct
// (nearly all ship properties)
// IMPLEMENT!!!
//    ship.nWeapon1Projectile     = GetLocalInt(oObject, VAR_SHIP_WEAPON1_PROJECTILE);
//    ship.nWeapon1Special        = GetLocalInt(oObject, VAR_SHIP_WEAPON1_SPECIAL);
struct ShipStatsAdvancedStruct GetShipStatsAdvancedStruct(object oObject);

// ** ONLY USE THIS TO COPY BASIC SHIP STATS TO ANOTHER OBJECT THAT DOESN'T NEED THE ADVANCED STATS **
// Set the basic ship stats of oObject to whatever is in the basic ship struct
void SetShipStatsBasic(object oObject, struct ShipStatsBasicStruct ship);

// ** ONLY USE THIS TO UPDATE CORE SHIP ITEMS (Ship DEEDs)**
// Set the advanced ship stats of oObject to whatever is in the advanced ship struct
void SetShipStatsAdvanced(object oObject, struct ShipStatsAdvancedStruct ship);

// Returns the Name of the ShipType
// Returns "Unknown Ship" on error
string GetShipTypeName(int nShipType);

// Gets the ships currently used power
//
// (Can get rid of and convert to STRUCT???)
int GetShipCurrentUsedPower(object oObject);

// Returns the Accuracy for this weapon type
int GetShipWeaponAccuracy(int nWeaponTargeting);

// Returns the SPELL_SHAPE_* for this weapon type
int GetShipWeaponSpellShape(int nWeaponTargeting);

// Returns the text description of the weapon mount
// possible return values are:
// Fixed Mount, 60-degree Turret, 360-degree Turret, and Unknown Type
string GetShipWeaponMountName(int nWeaponTargeting);

// Returns %Speed increase for ship
int GetShipSpeed(struct ShipStatsAdvancedStruct ship);

// Returns %Evasion increase for ship
int GetShipEvasion(struct ShipStatsAdvancedStruct ship);

// Returns the MOVEMENT_RATE_* for this ship type
int GetShipSpeedBase(int nShipType);

// Returns the base Hitpoints for SHIP_TYPE_*
int GetShipHitpointsBase(int nShipType);

// Returns the base cargo capacity for SHIP_TYPE_*
int GetShipCargoCapacityBase(int nShipType);

// Returns the location fDistance from lCurrent in fDirection
location GetRangeEndLocation(location lCurrent,float fDirection,float fDistance,float fOffFacing = 0.0,float fOffZ = 0.0f);

// Set oPC's stats to those of the ship
void SetShipStats(object oPC, struct ShipStatsBasicStruct myship);

// Remove Ship Effects from oPC
void RemoveShipStats(object oPC);

//////////// IMPLEMENTATION /////////////////

location GetRangeEndLocation(location lCurrent,float fDirection,float fDistance,float fOffFacing = 0.0,float fOffZ = 0.0f)
{
    vector vThrow = fDistance *VectorNormalize( AngleToVector(fDirection));
    vThrow.z += fOffZ;
    return Location( GetAreaFromLocation( lCurrent), GetPositionFromLocation( lCurrent) +vThrow, GetFacingFromLocation( lCurrent) + fOffFacing);
}

void RemoveShipStats(object oPC)
{
    effect eRemove = GetFirstEffect(oPC);
    while (GetIsEffectValid(eRemove) == TRUE)
    {
        RemoveEffect(oPC, eRemove);

        eRemove = GetNextEffect(oPC);
    }

    if (NWNX_Creature_GetKnowsFeat(oPC,1345) == FALSE)
    {
        NWNX_Creature_RemoveFeat(oPC, 1345);
    }
    if (NWNX_Creature_GetKnowsFeat(oPC, 1346) == FALSE)
    {
        NWNX_Creature_RemoveFeat(oPC, 1346);
    }
}

void SetShipStats(object oPC, struct ShipStatsBasicStruct myship)
{
    effect eLink, eTemp, eRemove;

    eRemove = GetFirstEffect(oPC);
    while (GetIsEffectValid(eRemove) == TRUE)
    {
        RemoveEffect(oPC, eRemove);

        eRemove = GetNextEffect(oPC);
    }

    if (myship.nSpeed >= 0)
    {
        eLink = EffectMovementSpeedIncrease(myship.nSpeed);
    }
    else
    {
        eLink = EffectMovementSpeedDecrease(myship.nSpeed);
    }

    if (GetMaxHitPoints(oPC) < myship.nHitpoints)
    {
        eTemp = EffectTemporaryHitpoints(myship.nHitpoints);
        eLink = EffectLinkEffects(eLink, eTemp);
    }

    NWNX_Creature_SetMovementRate(oPC, myship.nBaseSpeed);
    eLink = SupernaturalEffect(eLink);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oPC);

    if (NWNX_Creature_GetKnowsFeat(oPC,1345) == FALSE)
    {
        NWNX_Creature_AddFeat(oPC, 1345);
    }
    if (NWNX_Creature_GetKnowsFeat(oPC,1346) == FALSE)
    {
        NWNX_Creature_AddFeat(oPC, 1346);
    }
}

int GetShipSpeed(struct ShipStatsAdvancedStruct ship)
{
    int nSpeed;
    nSpeed = ship.nEngineSpeed - ship.nCargoModSpeedDecrease;
    return nSpeed;
}

int GetShipEvasion(struct ShipStatsAdvancedStruct ship)
{
    int nEvasion;
    nEvasion = ship.nShields - ship.nCargoModEvasionDecrease;

    if (nEvasion < 0){ nEvasion = 0; }

    return nEvasion;
}

int GetShipHitpointsBase(int nShipType)
{
    int nHP;

    switch (nShipType)
    {
        case SHIP_TYPE_E_WING:      nHP= FIGHTER_HP; break;
        case SHIP_TYPE_A_WING:      nHP= FIGHTER_HP; break;
        case SHIP_TYPE_B_WING:      nHP= BOMBER_HP; break;
        case SHIP_TYPE_TIE_I:       nHP= FIGHTER_HP; break;
        case SHIP_TYPE_TIE_F:       nHP= FIGHTER_HP; break;
        case SHIP_TYPE_TIE_B:       nHP= BOMBER_HP; break;
        case SHIP_TYPE_FIRESPRAY:   nHP= TRANSPORT_HP; break;
        case SHIP_TYPE_NABOO_F:     nHP= FIGHTER_HP; break;
        case SHIP_TYPE_Y_WING:      nHP= BOMBER_HP; break;
        case SHIP_TYPE_X_WING:      nHP= FIGHTER_HP; break;
        case SHIP_TYPE_LAMBDA:      nHP= TRANSPORT_HP; break;
        case SHIP_TYPE_YT2400:      nHP= TRANSPORT_HP;break;
        case SHIP_TYPE_ISD1:        nHP= CAP_LARGE_HP; break;
        case SHIP_TYPE_MON_CRUISE:  nHP= CAP_LARGE_HP; break;
        case SHIP_TYPE_TARTAN_CR:   nHP= CAP_MEDIUM_HP; break;
        case SHIP_TYPE_DEATHSTAR:   nHP= CAP_LARGE_HP; break;
        case VEHICLE_TYPE_ATST:     nHP= CAP_MEDIUM_HP; break;
        default: nHP= 300; break;
    }
    return nHP;
}

int GetShipCargoCapacityBase(int nShipType)
{
    int nCargo;

    switch (nShipType)
    {
        case SHIP_TYPE_E_WING:      nCargo= FIGHTER_CARGO_BASE_CAPACITY; break;
        case SHIP_TYPE_A_WING:      nCargo= FIGHTER_CARGO_BASE_CAPACITY; break;
        case SHIP_TYPE_B_WING:      nCargo= BOMBER_CARGO_BASE_CAPACITY; break;
        case SHIP_TYPE_TIE_I:       nCargo= FIGHTER_CARGO_BASE_CAPACITY; break;
        case SHIP_TYPE_TIE_F:       nCargo= FIGHTER_CARGO_BASE_CAPACITY; break;
        case SHIP_TYPE_TIE_B:       nCargo= BOMBER_CARGO_BASE_CAPACITY; break;
        case SHIP_TYPE_FIRESPRAY:   nCargo= TRANSPORT_CARGO_BASE_CAPACITY; break;
        case SHIP_TYPE_NABOO_F:     nCargo= FIGHTER_CARGO_BASE_CAPACITY; break;
        case SHIP_TYPE_Y_WING:      nCargo= BOMBER_CARGO_BASE_CAPACITY; break;
        case SHIP_TYPE_X_WING:      nCargo= FIGHTER_CARGO_BASE_CAPACITY; break;
        case SHIP_TYPE_LAMBDA:      nCargo= TRANSPORT_CARGO_BASE_CAPACITY; break;
        case SHIP_TYPE_YT2400:      nCargo= TRANSPORT_CARGO_BASE_CAPACITY; break;
        case SHIP_TYPE_ISD1:        nCargo= CAP_LARGE_CARGO_BASE_CAPACITY; break;
        case SHIP_TYPE_MON_CRUISE:  nCargo= CAP_LARGE_CARGO_BASE_CAPACITY; break;
        case SHIP_TYPE_TARTAN_CR:   nCargo= CAP_MEDIUM_CARGO_BASE_CAPACITY; break;
        case SHIP_TYPE_DEATHSTAR:   nCargo= CAP_LARGE_CARGO_BASE_CAPACITY; break;
        case VEHICLE_TYPE_ATST:     nCargo= CAP_MEDIUM_CARGO_BASE_CAPACITY; break;
        default: nCargo= 10; break;
    }
    return nCargo;
}

void SetShipStatsBasic(object oObject, struct ShipStatsBasicStruct ship)
{
    SetLocalInt(oObject, VAR_SHIP_ACCURACY, ship.nAccuracy);
    SetLocalInt(oObject, VAR_SHIP_EVASION, ship.nEvasion);
    SetLocalInt(oObject, VAR_SHIP_HITPOINTS, ship.nHitpoints);
    SetLocalInt(oObject, VAR_SHIP_SPEED, ship.nSpeed);
    SetLocalInt(oObject, VAR_SHIP_POWER, ship.nPower);
    SetLocalInt(oObject, VAR_SHIP_WEAPON1_DAMAGE, ship.nWeapon1Damage);
    SetLocalInt(oObject, VAR_SHIP_WEAPON1_CAPACITY, ship.nWeapon1Capacity);
    SetLocalInt(oObject, VAR_SHIP_WEAPON1_ROF, ship.nWeapon1Rate);
    SetLocalInt(oObject, VAR_SHIP_WEAPON1_PROJECTILE, ship.nWeapon1Projectile);
    SetLocalInt(oObject, VAR_SHIP_WEAPON1_SPECIAL, ship.nWeapon1Special);
    SetLocalInt(oObject, VAR_SHIP_WEAPON2_DAMAGE, ship.nWeapon2Damage);
    SetLocalInt(oObject, VAR_SHIP_WEAPON2_CAPACITY, ship.nWeapon2Capacity);
    SetLocalInt(oObject, VAR_SHIP_WEAPON2_ROF, ship.nWeapon2Rate);
    SetLocalInt(oObject, VAR_SHIP_WEAPON2_PROJECTILE, ship.nWeapon2Projectile);
    SetLocalInt(oObject, VAR_SHIP_WEAPON2_SPECIAL, ship.nWeapon2Special);
}

void SetShipStatsAdvanced(object oObject, struct ShipStatsAdvancedStruct ship)
{
    SetLocalInt(oObject, VAR_SHIP_ACCURACY, ship.nTargeting);
    SetLocalInt(oObject, VAR_SHIP_EVASION, ship.nShields);
    SetLocalInt(oObject, VAR_SHIP_HITPOINTS, ship.nHitpoints);
    SetLocalInt(oObject, VAR_SHIP_SPEED, GetShipSpeed(ship));
    SetLocalInt(oObject, VAR_SHIP_POWER, ship.nPower);
    SetLocalInt(oObject, VAR_SHIP_CARGO_BASE, ship.nCargoBaseCapacity);
    SetLocalInt(oObject, VAR_SHIP_CARGOMOD, ship.nCargoModCapacity);
    SetLocalInt(oObject, VAR_SHIP_CARGOMOD_SPEED_DECREASE, ship.nCargoModSpeedDecrease);
    SetLocalInt(oObject, VAR_SHIP_CARGOMOD_EVASION_DECREASE, ship.nCargoModEvasionDecrease);
    SetLocalString(oObject, VAR_SHIP_CARGOMOD_NAME, ship.sCargoModName);
    SetLocalString(oObject, VAR_SHIP_POWER_NAME, ship.sPowerName);
    SetLocalString(oObject, VAR_SHIP_POWER_RESREF, ship.sPowerResRef);
    SetLocalInt(oObject, VAR_SHIP_ENGINE, ship.nEngineSpeed);
    SetLocalString(oObject, VAR_SHIP_ENGINE_NAME, ship.sEngineName);
    SetLocalString(oObject, VAR_SHIP_ENGINE_RESREF, ship.sEngineResRef);
    SetLocalInt(oObject, VAR_SHIP_HYPERMOD, ship.nHyperMod);
    SetLocalString(oObject, VAR_SHIP_HYPERMOD_NAME, ship.sHyperModName);
    SetLocalString(oObject, VAR_SHIP_HYPERMOD_RESREF, ship.sHyperModResRef);
    SetLocalInt(oObject, VAR_SHIP_SHIELDS, ship.nShields);
    SetLocalString(oObject, VAR_SHIP_SHIELDS_NAME, ship.sShieldsName);
    SetLocalString(oObject, VAR_SHIP_SHIELDS_RESREF, ship.sShieldsResRef);
    SetLocalInt(oObject, VAR_SHIP_TARGETING, ship.nTargeting);
    SetLocalString(oObject, VAR_SHIP_TARGETING_NAME, ship.sTargetingName);
    SetLocalString(oObject, VAR_SHIP_TARGETING_RESREF, ship.sTargetingResRef);
    SetLocalInt(oObject, VAR_SHIP_WEAPON1_DAMAGE, ship.nWeapon1Damage);
    SetLocalInt(oObject, VAR_SHIP_WEAPON1_TARGETING, ship.nWeapon1Targeting);
    SetLocalInt(oObject, VAR_SHIP_WEAPON1_CAPACITY, ship.nWeapon1Capacity);
    SetLocalInt(oObject, VAR_SHIP_WEAPON1_ROF, ship.nWeapon1Rate);
    SetLocalInt(oObject, VAR_SHIP_WEAPON1_PROJECTILE, ship.nWeapon1Projectile);
    SetLocalInt(oObject, VAR_SHIP_WEAPON1_SPECIAL, ship.nWeapon1Special);
    SetLocalString(oObject, VAR_SHIP_WEAPON1_NAME, ship.sWeapon1Name);
    SetLocalString(oObject, VAR_SHIP_WEAPON1_RESREF, ship.sWeapon1ResRef);
    SetLocalInt(oObject, VAR_SHIP_WEAPON2_DAMAGE, ship.nWeapon2Damage);
    SetLocalInt(oObject, VAR_SHIP_WEAPON2_TARGETING, ship.nWeapon2Targeting);
    SetLocalInt(oObject, VAR_SHIP_WEAPON2_CAPACITY, ship.nWeapon2Capacity);
    SetLocalInt(oObject, VAR_SHIP_WEAPON2_ROF, ship.nWeapon2Rate);
    SetLocalInt(oObject, VAR_SHIP_WEAPON2_PROJECTILE, ship.nWeapon2Projectile);
    SetLocalInt(oObject, VAR_SHIP_WEAPON2_SPECIAL, ship.nWeapon2Special);
    SetLocalString(oObject, VAR_SHIP_WEAPON2_NAME, ship.sWeapon2Name);
    SetLocalString(oObject, VAR_SHIP_WEAPON2_RESREF, ship.sWeapon2ResRef);

    SetLocalInt(oObject, VAR_SHIP_ENGINE_POWER, ship.nEnginePower);
    SetLocalInt(oObject, VAR_SHIP_HYPERMOD_POWER, ship.nHyperModPower);
    SetLocalInt(oObject, VAR_SHIP_SHIELDS_POWER, ship.nShieldsPower);
    SetLocalInt(oObject, VAR_SHIP_TARGETING_POWER, ship.nTargetingPower);
    SetLocalInt(oObject, VAR_SHIP_WEAPON1_POWER, ship.nWeapon1Power);
    SetLocalInt(oObject, VAR_SHIP_WEAPON2_POWER, ship.nWeapon2Power);
}

int GetShipWeaponAccuracy(int nWeaponTargeting)
{
    int accuracy;
    switch (nWeaponTargeting)
    {
        case 1: accuracy    = 10; break;
        case 2: accuracy    = 0; break;
        case 3: accuracy    = -10; break;
        default: accuracy   = 0; break;
    }
    return accuracy;
}

int GetShipWeaponSpellShape(int nWeaponTargeting)
{
    int shape;
    switch (nWeaponTargeting)
    {
        case 1: shape   = SHAPE_SPELLCYLINDER; break;
        case 2: shape   = SHAPE_SPELLCONE; break;
        case 3: shape   = SHAPE_SPHERE; break;
        default: shape  = SHAPE_SPELLCYLINDER; break;
    }
    return shape;
}

string GetShipWeaponMountName(int nWeaponTargeting)
{
    string mount;
    switch (nWeaponTargeting)
    {
        case 1: mount   = "Fixed Mount"; break;
        case 2: mount   = "60-degree Turret"; break;
        case 3: mount   = "360-degree Turret"; break;
        default: mount  = "Unknown Type"; break;
    }
    return mount;
}

int GetShipSpeedBase(int nShipType)
{
    int nSpeed;

    switch (nShipType)
    {
        case SHIP_TYPE_E_WING:      nSpeed = FIGHTER_SPEED; break; //1300
        case SHIP_TYPE_A_WING:      nSpeed = FIGHTER_SPEED; break; //1300
        case SHIP_TYPE_B_WING:      nSpeed = BOMBER_SPEED; break; //950
        case SHIP_TYPE_TIE_I:       nSpeed = FIGHTER_SPEED; break; //1250
        case SHIP_TYPE_TIE_F:       nSpeed = FIGHTER_SPEED; break; //1200
        case SHIP_TYPE_TIE_B:       nSpeed = BOMBER_SPEED; break; //850
        case SHIP_TYPE_FIRESPRAY:   nSpeed = TRANSPORT_SPEED; break; //1000
        case SHIP_TYPE_NABOO_F:     nSpeed = FIGHTER_SPEED; break; //1100
        case SHIP_TYPE_Y_WING:      nSpeed = BOMBER_SPEED; break; //1000
        case SHIP_TYPE_X_WING:      nSpeed = FIGHTER_SPEED; break; //1100
        case SHIP_TYPE_LAMBDA:      nSpeed = TRANSPORT_SPEED; break; //850
        case SHIP_TYPE_YT2400:      nSpeed = TRANSPORT_SPEED; break; //800
        case SHIP_TYPE_ISD1:        nSpeed = CAP_LARGE_SPEED; break; //
        case SHIP_TYPE_MON_CRUISE:  nSpeed = CAP_LARGE_SPEED; break; //
        case SHIP_TYPE_TARTAN_CR:   nSpeed = CAP_MEDIUM_SPEED; break; //
        case SHIP_TYPE_DEATHSTAR:   nSpeed = CAP_LARGE_SPEED; break; //
        case VEHICLE_TYPE_ATST:     nSpeed = CAP_MEDIUM_SPEED; break; //
        default: nSpeed = CAP_LARGE_SPEED; break;
    }
    return nSpeed;
}

string GetShipTypeName(int nShipType)
{
    string sShipTypeName = "";

    switch (nShipType)
    {
        case SHIP_TYPE_E_WING:      sShipTypeName = "E-Wing starfighter"; break;
        case SHIP_TYPE_A_WING:      sShipTypeName = "A-Wing starfighter"; break;
        case SHIP_TYPE_B_WING:      sShipTypeName = "B-Wing starfighter"; break;
        case SHIP_TYPE_TIE_I:       sShipTypeName = "TIE Interceptor"; break;
        case SHIP_TYPE_TIE_F:       sShipTypeName = "TIE Fighter"; break;
        case SHIP_TYPE_TIE_B:       sShipTypeName = "TIE Bomber"; break;
        case SHIP_TYPE_FIRESPRAY:   sShipTypeName = "Firespray starship"; break;
        case SHIP_TYPE_NABOO_F:     sShipTypeName = "N-1 starfighter"; break;
        case SHIP_TYPE_Y_WING:      sShipTypeName = "Y-Wing starfighter"; break;
        case SHIP_TYPE_X_WING:      sShipTypeName = "X-Wing starfighter"; break;
        case SHIP_TYPE_LAMBDA:      sShipTypeName = "Lambda shuttle"; break;
        case SHIP_TYPE_YT2400:      sShipTypeName = "YT-2400 light freighter"; break;
        case SHIP_TYPE_ISD1:        sShipTypeName = "Imperial Star Destroyer"; break;
        case SHIP_TYPE_MON_CRUISE:  sShipTypeName = "Mon Calamari Star Cruiser"; break;
        case SHIP_TYPE_TARTAN_CR:   sShipTypeName = "E-Wing starfighter"; break;
        case SHIP_TYPE_DEATHSTAR:   sShipTypeName = "E-Wing starfighter"; break;
        case VEHICLE_TYPE_ATST:     sShipTypeName = "E-Wing starfighter"; break;
        default: sShipTypeName = "Unknown Ship"; break;
    }
    return sShipTypeName;
}

struct ShipStatsBasicStruct GetShipStatsBasicStruct(object oObject)
{
    struct ShipStatsBasicStruct ship;
    int nEvasion = GetLocalInt(oObject, VAR_SHIP_EVASION) - GetLocalInt(oObject, VAR_SHIP_CARGOMOD_EVASION_DECREASE);
    if (nEvasion < 0){ nEvasion = 0; }

    ship.nShipType              = GetLocalInt(oObject, VAR_SHIP_TYPE);
    ship.nAccuracy              = GetLocalInt(oObject, VAR_SHIP_ACCURACY);
    ship.nEvasion               = nEvasion;
    ship.nHitpoints             = GetShipHitpointsBase(ship.nShipType);
    ship.nSpeed                 = ship.nSpeed;
    ship.nBaseSpeed             = GetShipSpeedBase(ship.nShipType);
    ship.nPower                 = GetLocalInt(oObject, VAR_SHIP_POWER);
    ship.nPowerUsed             = GetShipCurrentUsedPower(oObject);
    ship.nCargoCapacity         = GetLocalInt(oObject, VAR_SHIP_CARGO_BASE) + GetLocalInt(oObject, VAR_SHIP_CARGOMOD);
    ship.nWeapon1Damage         = GetLocalInt(oObject, VAR_SHIP_WEAPON1_DAMAGE);
    ship.nWeapon1SpellShape     = GetShipWeaponSpellShape(GetLocalInt(oObject, VAR_SHIP_WEAPON1_TARGETING));
    ship.nWeapon1Accuracy       = GetShipWeaponAccuracy(GetLocalInt(oObject, VAR_SHIP_WEAPON1_TARGETING));
    ship.nWeapon1Capacity       = GetLocalInt(oObject, VAR_SHIP_WEAPON1_CAPACITY);
    ship.nWeapon1Rate           = GetLocalInt(oObject, VAR_SHIP_WEAPON1_ROF);
    ship.nWeapon1Projectile     = GetLocalInt(oObject, VAR_SHIP_WEAPON1_PROJECTILE);
    ship.nWeapon1Special        = GetLocalInt(oObject, VAR_SHIP_WEAPON1_SPECIAL);
    ship.nWeapon2Damage         = GetLocalInt(oObject, VAR_SHIP_WEAPON2_DAMAGE);
    ship.nWeapon2SpellShape     = GetShipWeaponSpellShape(GetLocalInt(oObject, VAR_SHIP_WEAPON2_TARGETING));
    ship.nWeapon2Accuracy       = GetShipWeaponAccuracy(GetLocalInt(oObject, VAR_SHIP_WEAPON2_TARGETING));
    ship.nWeapon2Capacity       = GetLocalInt(oObject, VAR_SHIP_WEAPON2_CAPACITY);
    ship.nWeapon2Rate           = GetLocalInt(oObject, VAR_SHIP_WEAPON2_ROF);
    ship.nWeapon2Projectile     = GetLocalInt(oObject, VAR_SHIP_WEAPON2_PROJECTILE);
    ship.nWeapon2Special        = GetLocalInt(oObject, VAR_SHIP_WEAPON2_SPECIAL);

    return ship;
}

struct ShipStatsAdvancedStruct GetShipStatsAdvancedStruct(object oObject)
{
    struct ShipStatsAdvancedStruct ship;

    ship.nShipType              = GetLocalInt(oObject, VAR_SHIP_TYPE);
    ship.sShipTypeName          = GetShipTypeName(ship.nShipType);
    ship.nHitpoints             = GetShipHitpointsBase(ship.nShipType);
    ship.nBaseSpeed             = GetShipSpeedBase(ship.nShipType);
    ship.nPower                 = GetLocalInt(oObject, VAR_SHIP_POWER);
    ship.nCargoBaseCapacity     = GetShipCargoCapacityBase(ship.nShipType);
    ship.nCargoModCapacity      = GetLocalInt(oObject, VAR_SHIP_CARGOMOD);
    ship.sCargoModName          = GetLocalString(oObject, VAR_SHIP_CARGOMOD_NAME);
    ship.nCargoCapacity         = ship.nCargoBaseCapacity + ship.nCargoModCapacity;
    ship.nCargoModSpeedDecrease   = GetLocalInt(oObject, VAR_SHIP_CARGOMOD_SPEED_DECREASE);
    ship.nCargoModEvasionDecrease = GetLocalInt(oObject, VAR_SHIP_CARGOMOD_EVASION_DECREASE);
    ship.sPowerName             = GetLocalString(oObject, VAR_SHIP_POWER_NAME);
    ship.sPowerResRef           = GetLocalString(oObject, VAR_SHIP_POWER_RESREF);
    ship.nEngineSpeed           = GetLocalInt(oObject, VAR_SHIP_ENGINE);
    ship.sEngineName            = GetLocalString(oObject, VAR_SHIP_ENGINE_NAME);
    ship.sEngineResRef          = GetLocalString(oObject, VAR_SHIP_ENGINE_RESREF);
    ship.nHyperMod              = GetLocalInt(oObject, VAR_SHIP_HYPERMOD);
    ship.sHyperModName          = GetLocalString(oObject, VAR_SHIP_HYPERMOD_NAME);
    ship.sHyperModResRef        = GetLocalString(oObject, VAR_SHIP_HYPERMOD_RESREF);
    ship.nShields               = GetLocalInt(oObject, VAR_SHIP_SHIELDS);
    ship.sShieldsName           = GetLocalString(oObject, VAR_SHIP_SHIELDS_NAME);
    ship.sShieldsResRef         = GetLocalString(oObject, VAR_SHIP_SHIELDS_RESREF);
    ship.nTargeting             = GetLocalInt(oObject, VAR_SHIP_TARGETING);
    ship.sTargetingName         = GetLocalString(oObject, VAR_SHIP_TARGETING_NAME);
    ship.sTargetingResRef       = GetLocalString(oObject, VAR_SHIP_TARGETING_RESREF);
    ship.nWeapon1Damage         = GetLocalInt(oObject, VAR_SHIP_WEAPON1_DAMAGE);
    ship.nWeapon1Targeting      = GetLocalInt(oObject, VAR_SHIP_WEAPON1_TARGETING);
    ship.nWeapon1SpellShape     = GetShipWeaponSpellShape(ship.nWeapon1Targeting);
    ship.sWeapon1MountName      = GetShipWeaponMountName(ship.nWeapon1Targeting);
    ship.nWeapon1Accuracy       = GetShipWeaponAccuracy(ship.nWeapon1Targeting);
    ship.nWeapon1Capacity       = GetLocalInt(oObject, VAR_SHIP_WEAPON1_CAPACITY);
    ship.nWeapon1Rate           = GetLocalInt(oObject, VAR_SHIP_WEAPON1_ROF);
    ship.nWeapon1Projectile     = GetLocalInt(oObject, VAR_SHIP_WEAPON1_PROJECTILE);
    ship.nWeapon1Special        = GetLocalInt(oObject, VAR_SHIP_WEAPON1_SPECIAL);
    ship.sWeapon1Name           = GetLocalString(oObject, VAR_SHIP_WEAPON1_NAME);
    ship.sWeapon1ResRef         = GetLocalString(oObject, VAR_SHIP_WEAPON1_RESREF);
    ship.nWeapon2Damage         = GetLocalInt(oObject, VAR_SHIP_WEAPON2_DAMAGE);
    ship.nWeapon2Targeting      = GetLocalInt(oObject, VAR_SHIP_WEAPON2_TARGETING);
    ship.nWeapon2SpellShape     = GetShipWeaponSpellShape(ship.nWeapon2Targeting);
    ship.sWeapon2MountName      = GetShipWeaponMountName(ship.nWeapon2Targeting);
    ship.nWeapon2Accuracy       = GetShipWeaponAccuracy(ship.nWeapon2Targeting);
    ship.nWeapon2Capacity       = GetLocalInt(oObject, VAR_SHIP_WEAPON2_CAPACITY);
    ship.nWeapon2Rate           = GetLocalInt(oObject, VAR_SHIP_WEAPON2_ROF);
    ship.nWeapon2Projectile     = GetLocalInt(oObject, VAR_SHIP_WEAPON2_PROJECTILE);
    ship.nWeapon2Special        = GetLocalInt(oObject, VAR_SHIP_WEAPON2_SPECIAL);
    ship.sWeapon2Name           = GetLocalString(oObject, VAR_SHIP_WEAPON2_NAME);
    ship.sWeapon2ResRef         = GetLocalString(oObject, VAR_SHIP_WEAPON2_RESREF);

    ship.nEnginePower           = GetLocalInt(oObject, VAR_SHIP_ENGINE_POWER);
    ship.nHyperModPower         = GetLocalInt(oObject, VAR_SHIP_HYPERMOD_POWER);
    ship.nShieldsPower          = GetLocalInt(oObject, VAR_SHIP_SHIELDS_POWER);
    ship.nTargetingPower        = GetLocalInt(oObject, VAR_SHIP_TARGETING_POWER);
    ship.nWeapon1Power          = GetLocalInt(oObject, VAR_SHIP_WEAPON1_POWER);
    ship.nWeapon2Power          = GetLocalInt(oObject, VAR_SHIP_WEAPON2_POWER);

    ship.nSpeed                 = GetShipSpeed(ship);
    ship.nAccuracy              = GetLocalInt(oObject, VAR_SHIP_ACCURACY);
    ship.nEvasion               = GetShipEvasion(ship);
    ship.nPowerUsed             = GetShipCurrentUsedPower(oObject);

    return ship;
}

int GetShipCurrentUsedPower(object oObject)
{
    int nPowerUsed;         // SUM(all parts power)
    int nEnginePower        = GetLocalInt(oObject, VAR_SHIP_ENGINE_POWER);
    int nHyperPower         = GetLocalInt(oObject, VAR_SHIP_HYPERMOD_POWER);
    int nShieldsPower       = GetLocalInt(oObject, VAR_SHIP_SHIELDS_POWER);
    int nTargetingPower     = GetLocalInt(oObject, VAR_SHIP_TARGETING_POWER);
    int nWeapon1Power       = GetLocalInt(oObject, VAR_SHIP_WEAPON1_POWER);
    int nWeapon2Power       = GetLocalInt(oObject, VAR_SHIP_WEAPON2_POWER);

    nPowerUsed = nEnginePower + nHyperPower + nShieldsPower +
                      nTargetingPower + nWeapon1Power + nWeapon2Power;
    return nPowerUsed;
}

void UpdateDeedShipStatDescription(object oItem)
{
    int nEvasion, nSpeed;
    struct ShipStatsAdvancedStruct ship = GetShipStatsAdvancedStruct(oItem);
    string sText            = "";
    string sShipType        = "Starship Class: ";
    string sPower           = "Power Plant: ";
    string sEngine          = "Ion Engines: ";
    string sHyper           = "Hyperspace Engine: ";
    string sShields         = "Shielding System: ";
    string sTargeting       = "Targeting System: ";
    string sWeapon1Type     = "Primary Weapon Type: ";
    string sWeapon1Mount    = "Primary Weapon Mount: ";
    string sWeapon1Rate     = "Primary Weapon Rate: ";
    string sWeapon1Capacity = "Primary Weapon Capacity: ";
    string sWeapon2Type     = "Auxiliary Weapon Type: ";
    //string sWeapon2Mount    = "Auxiliary Weapon Mount: ";
    string sWeapon2Rate     = "Auxiliary Weapon Rate: ";
    string sWeapon2Capacity = "Auxiliary Weapon Capacity: ";
    string sCargoMod        = "Cargo Capacity: ";
    string sAccuracy        = "Accuracy: ";
    string sEvasion         = "Evasion: ";
    string sSpeed           = "Speed: ";
    string sHitpoints       = "Hitpoints: ";

    string sWeaponRateName  = "/second";

    if (ship.sPowerName == "")
    {
        sPower += sRedText + "Not-Installed" + sWhiteText + "\n";
    }
    else
    {
        sPower += sDarkYellowText + IntToString(ship.nPowerUsed) + "/"
                            + IntToString(ship.nPower) + sDarkGreyText +
                            "\n   " + ship.sPowerName + "\n" + sWhiteText;
    }
    if (ship.sEngineName == "")
    {
        sEngine += sRedText + "Not-Installed" + sWhiteText + "\n";
    }
    else
    {
        sEngine += sDarkYellowText + "+" + IntToString(ship.nEngineSpeed) + "% Thrust" +
                      sDarkGreyText + "\n   " + ship.sEngineName + "\n" + sWhiteText;
    }
    if (ship.sHyperModName == "")
    {
        sHyper += sRedText + "Not-Installed" + sWhiteText + "\n";
    }
    else
    {
        sHyper += sDarkGreyText + ship.sHyperModName + "\n" + sWhiteText;
    }
    if (ship.sShieldsName == "")
    {
        sShields += sRedText + "Not-Installed" + sWhiteText + "\n";
    }
    else
    {
        sShields += sDarkYellowText + "+" + IntToString(ship.nShields) + "% Evasion" + sDarkGreyText +
                      "\n   " + ship.sShieldsName + "\n" + sWhiteText;
    }
    if (ship.sTargetingName == "")
    {
        sTargeting += sRedText + "Not-Installed" + sWhiteText + "\n";
    }
    else
    {
        sTargeting += sDarkYellowText + "+" + IntToString(ship.nTargeting) + "% Accuracy" + sDarkGreyText +
                      "\n   " + ship.sTargetingName + "\n" + sWhiteText;
    }
    if (ship.sWeapon1Name == "")
    {
        sWeapon1Type += sRedText + "Not-Installed" + sWhiteText + "\n";
    }
    else
    {
        sWeapon1Type += sDarkYellowText + IntToString(ship.nWeapon1Damage) + "d10 Damage" + sDarkGreyText +
                      "\n   " + ship.sWeapon1Name + "\n" + sWhiteText;
        sWeapon1Type += sWeapon1Mount + sDarkYellowText + ship.sWeapon1MountName + sWhiteText + "\n";
        sWeapon1Type += sWeapon1Rate + sDarkYellowText + IntToString(ship.nWeapon1Rate) + sWeaponRateName + sWhiteText + "\n";
        sWeapon1Type += sWeapon1Capacity + sDarkYellowText + IntToString(ship.nWeapon1Capacity) + sWhiteText + "\n";
    }
    if (ship.sWeapon2Name == "")
    {
        sWeapon2Type += sRedText + "Not-Installed" + sWhiteText + "\n";
    }
    else
    {
        sWeapon2Type += sDarkYellowText + IntToString(ship.nWeapon2Damage) + "d10 Damage" + sDarkGreyText +
                      "\n   " + ship.sWeapon2Name + "\n" + sWhiteText;
        //sWeapon2Type += sWeapon2Mount + sDarkYellowText + ship.sWeapon2MountName + sWhiteText + "\n";
        sWeapon2Type += sWeapon2Rate + sDarkYellowText + IntToString(ship.nWeapon2Rate) + sWeaponRateName + sWhiteText + "\n";
        sWeapon2Type += sWeapon2Capacity + sDarkYellowText + IntToString(ship.nWeapon2Capacity) + sWhiteText + "\n";
    }
    if (ship.sCargoModName == "")
    {
        sCargoMod += sDarkYellowText + IntToString(ship.nCargoCapacity) + " Units" + sWhiteText + "\n";
    }
    else
    {
        sCargoMod += sDarkYellowText + IntToString(ship.nCargoCapacity) + " Units" + sDarkGreyText + "\n   " + ship.sCargoModName + "\n" + sWhiteText;
    }

    nSpeed = ship.nEngineSpeed - ship.nCargoModSpeedDecrease;
    string sPlusMinus;
    if (nSpeed < 0){ sPlusMinus = "-"; }
    else { sPlusMinus = "+"; }
    nEvasion = ship.nShields - ship.nCargoModEvasionDecrease;
    if (nEvasion < 0){ nEvasion = 0; }

    sText += sShipType + ship.sShipTypeName + "\n";
    sText += sPower;
    sText += sEngine;
    sText += sHyper;
    sText += sShields;
    sText += sTargeting;
    sText += sWeapon1Type;
    sText += sWeapon2Type;
    sText += sCargoMod;
    sText += "\n";
    sText += sAccuracy + sDarkYellowText + IntToString(ship.nAccuracy) + "%" + "\n" + sWhiteText;
    sText += sEvasion + sDarkYellowText + IntToString(ship.nEvasion) + "%" + "\n" + sWhiteText;
    sText += sSpeed + sDarkYellowText + sPlusMinus + IntToString(nSpeed) + "%" + "\n" + sWhiteText;
    sText += sHitpoints + sDarkYellowText + IntToString(ship.nHitpoints) + " HP" + "\n" + sWhiteText;
    sText += "\n" + GetDescription(oItem, TRUE, FALSE);

    SetDescription(oItem, sText);
}

int InstallShipStatUpgrade(object oPC, object oItem, object oUpgrade)
{
    int nBuild = GetSkillRank(SKILL_BUILD_REPAIR , oPC);
    int nCraft = GetSkillRank(SKILL_CRAFT_MECHANICAL, oPC);
    int nBuildRoll = d20();
    int nCraftRoll = d20();
    struct ShipStatsAdvancedStruct ship = GetShipStatsAdvancedStruct(oItem);
    int nUpgradeType = GetLocalInt(oUpgrade, "SHIP_STAT_TYPE");
    int nUpgradeDC = GetLocalInt(oUpgrade, "SHIP_STAT_INSTALL_DC");
    int nUninstallDC = 25;
    string sUpgradeName = GetName(oUpgrade);
    string sUpgradeResRef = GetResRef(oUpgrade);
    string sItemToCreateResRef = "";
    int nEvasionDecrease = 0;
    int nSpeedDecrease = 0;
    int nCargo = 0;
    int nAccuracy = 0;
    int nPower = 0;
    int nUpgradePower = 0;
    int nNewPower = 0;
    int nEvasion = 0;
    int nHitpoints = 0;

    int bSuccess = FALSE;
    int bCraftSuccess = FALSE;
    int bBuildSuccess = FALSE;
    int bBypassRolls = FALSE;

    if (nCraft + nCraftRoll >= nUpgradeDC || nCraftRoll == 20)
    {
        bCraftSuccess = TRUE;
    }
    if (nCraftRoll == 1)
    {
        bCraftSuccess = FALSE;
    }

    if (nBuild + nBuildRoll >= nUninstallDC || nBuildRoll == 20)
    {
        bBuildSuccess = TRUE;
    }
    if (nBuildRoll == 1)
    {
        bBuildSuccess = FALSE;
    }

    switch (nUpgradeType)
    {
        case VAR_SHIP_STAT_TYPE_CARGOMOD:
        {
            if (ship.sCargoModName != "")
            {
                SendMessageToPC(oPC, sRedText + "*Your ship's structure has already been permanently modified*");
                bSuccess = FALSE;
                bBypassRolls = TRUE;
            }
            else
            {
                if (bCraftSuccess)
                {
                    ship.nCargoModCapacity = GetLocalInt(oUpgrade, VAR_SHIP_CARGOMOD);
                    ship.nCargoModEvasionDecrease = GetLocalInt(oUpgrade, VAR_SHIP_CARGOMOD_EVASION_DECREASE);
                    ship.nCargoModSpeedDecrease = GetLocalInt(oUpgrade, VAR_SHIP_CARGOMOD_SPEED_DECREASE);
                    ship.sCargoModName = sUpgradeName;
                    bSuccess = TRUE;
                }
                else
                {
                    bSuccess = FALSE;
                }
            }
        } break;
        case VAR_SHIP_STAT_TYPE_ENGINE:
        {
            nUpgradePower = GetLocalInt(oUpgrade, VAR_SHIP_ENGINE_POWER);
            nNewPower = ship.nPowerUsed - ship.nEnginePower + nUpgradePower;

            if (nNewPower > ship.nPower)
            {
                SendMessageToPC(oPC, sRedText + "*Your ship's Power Plant is not powerful enough to accomodate this upgrade*");
                bSuccess = FALSE;
                bBypassRolls = TRUE;
            }
            else
            {
                if (bCraftSuccess)
                {
                    if (ship.sEngineName != "")
                    {
                        if (bBuildSuccess)
                        {
                            sItemToCreateResRef = ship.sEngineResRef;
                        }
                    }
                    ship.nEngineSpeed = GetLocalInt(oUpgrade, VAR_SHIP_ENGINE);
                    ship.nEnginePower = nUpgradePower;
                    ship.sEngineName = sUpgradeName;
                    ship.sEngineResRef = sUpgradeResRef;
                    bSuccess = TRUE;
                }
                else
                {
                    bSuccess = FALSE;
                }
            }
        } break;
        case VAR_SHIP_STAT_TYPE_POWER:
        {
            if (bCraftSuccess)
            {
                if (ship.sPowerName != "")
                {
                    if (bBuildSuccess)
                    {
                        sItemToCreateResRef = ship.sPowerResRef;
                    }
                }
                ship.nPower = GetLocalInt(oUpgrade, VAR_SHIP_POWER);
                ship.sPowerName = sUpgradeName;
                ship.sPowerResRef = sUpgradeResRef;
                bSuccess = TRUE;
            }
            else
            {
                bSuccess = FALSE;
            }
        } break;
        case VAR_SHIP_STAT_TYPE_HYPERMOD:
        {
            nUpgradePower = GetLocalInt(oUpgrade, VAR_SHIP_HYPERMOD_POWER);
            nNewPower = ship.nPowerUsed - ship.nHyperModPower + nUpgradePower;

            if (nNewPower > ship.nPower)
            {
                SendMessageToPC(oPC, sRedText + "*Your ship's Power Plant is not powerful enough to accomodate this upgrade*");
                bSuccess = FALSE;
                bBypassRolls = TRUE;
            }
            else
            {
                if (bCraftSuccess)
                {
                    if (ship.sHyperModName != "")
                    {
                        if (bBuildSuccess)
                        {
                            sItemToCreateResRef = ship.sHyperModResRef;
                        }
                    }
                    ship.nHyperMod = GetLocalInt(oUpgrade, VAR_SHIP_HYPERMOD);
                    ship.nHyperModPower = nUpgradePower;
                    ship.sHyperModName = sUpgradeName;
                    ship.sHyperModResRef = sUpgradeResRef;
                    bSuccess = TRUE;
                }
                else
                {
                    bSuccess = FALSE;
                }
            }
        } break;
        case VAR_SHIP_STAT_TYPE_SHIELDS:
        {
            nUpgradePower = GetLocalInt(oUpgrade, VAR_SHIP_SHIELDS_POWER);
            nNewPower = ship.nPowerUsed - ship.nShieldsPower + nUpgradePower;

            if (nNewPower > ship.nPower)
            {
                SendMessageToPC(oPC, sRedText + "*Your ship's Power Plant is not powerful enough to accomodate this upgrade*");
                bSuccess = FALSE;
                bBypassRolls = TRUE;
            }
            else
            {
                if (bCraftSuccess)
                {
                    if (ship.sShieldsName != "")
                    {
                        if (bBuildSuccess)
                        {
                            sItemToCreateResRef = ship.sShieldsResRef;
                        }
                    }
                    ship.nShields = GetLocalInt(oUpgrade, VAR_SHIP_SHIELDS);
                    ship.nShieldsPower = nUpgradePower;
                    ship.sShieldsName = sUpgradeName;
                    ship.sShieldsResRef = sUpgradeResRef;
                    bSuccess = TRUE;
                }
                else
                {
                    bSuccess = FALSE;
                }
            }
        } break;
        case VAR_SHIP_STAT_TYPE_TARGETING:
        {
            nUpgradePower = GetLocalInt(oUpgrade, VAR_SHIP_TARGETING_POWER);
            nNewPower = ship.nPowerUsed - ship.nTargetingPower + nUpgradePower;

            if (nNewPower > ship.nPower)
            {
                SendMessageToPC(oPC, sRedText + "*Your ship's Power Plant is not powerful enough to accomodate this upgrade*");
                bSuccess = FALSE;
                bBypassRolls = TRUE;
            }
            else
            {
                if (bCraftSuccess)
                {
                    if (ship.sTargetingName != "")
                    {
                        if (bBuildSuccess)
                        {
                            sItemToCreateResRef = ship.sTargetingResRef;
                        }
                    }
                    ship.nTargeting = GetLocalInt(oUpgrade, VAR_SHIP_TARGETING);
                    ship.nTargetingPower = nUpgradePower;
                    ship.sTargetingName = sUpgradeName;
                    ship.sTargetingResRef = sUpgradeResRef;
                    bSuccess = TRUE;
                }
                else
                {
                    bSuccess = FALSE;
                }
            }
        } break;
        case VAR_SHIP_STAT_TYPE_WEAPON1:
        {
            nUpgradePower = GetLocalInt(oUpgrade, "SHIP_WEAPON_POWER");
            nNewPower = ship.nPowerUsed - ship.nWeapon1Power + nUpgradePower;

            if (nNewPower > ship.nPower)
            {
                SendMessageToPC(oPC, sRedText + "*Your ship's Power Plant is not powerful enough to accomodate this upgrade*");
                bSuccess = FALSE;
                bBypassRolls = TRUE;
            }
            else
            {
                if (bCraftSuccess)
                {
                    if (ship.sWeapon1Name != "")
                    {
                        if (bBuildSuccess)
                        {
                            sItemToCreateResRef = ship.sWeapon1ResRef;
                        }
                    }
                    ship.nWeapon1Damage = GetLocalInt(oUpgrade, "SHIP_WEAPON_DAMAGE");
                    ship.nWeapon1Rate = GetLocalInt(oUpgrade, "SHIP_WEAPON_ROF");
                    ship.nWeapon1Targeting = GetLocalInt(oUpgrade, "SHIP_WEAPON_TARGETING");
                    ship.nWeapon1Capacity = GetLocalInt(oUpgrade, "SHIP_WEAPON_CAPACITY");
                    ship.nWeapon1Power = nUpgradePower;
                    ship.sWeapon1Name = sUpgradeName;
                    ship.sWeapon1ResRef = sUpgradeResRef;
                    bSuccess = TRUE;
                }
                else
                {
                    bSuccess = FALSE;
                }
            }
        } break;
        case VAR_SHIP_STAT_TYPE_WEAPON2:
        {
            nUpgradePower = GetLocalInt(oUpgrade, "SHIP_WEAPON_POWER");
            nNewPower = ship.nPowerUsed - ship.nWeapon2Power + nUpgradePower;

            if (nNewPower > ship.nPower)
            {
                SendMessageToPC(oPC, sRedText + "*Your ship's Power Plant is not powerful enough to accomodate this upgrade*");
                bSuccess = FALSE;
                bBypassRolls = TRUE;
            }
            else
            {
                if (bCraftSuccess)
                {
                    if (ship.sWeapon2Name != "")
                    {
                        if (bBuildSuccess)
                        {
                            sItemToCreateResRef = ship.sWeapon2ResRef;
                        }
                    }
                    ship.nWeapon2Damage = GetLocalInt(oUpgrade, "SHIP_WEAPON_DAMAGE");
                    ship.nWeapon2Rate = GetLocalInt(oUpgrade, "SHIP_WEAPON_ROF");
                    ship.nWeapon2Targeting = GetLocalInt(oUpgrade, "SHIP_WEAPON_TARGETING");
                    ship.nWeapon2Capacity = GetLocalInt(oUpgrade, "SHIP_WEAPON_CAPACITY");
                    ship.nWeapon2Power = nUpgradePower;
                    ship.sWeapon2Name = sUpgradeName;
                    ship.sWeapon2ResRef = sUpgradeResRef;
                    bSuccess = TRUE;
                }
                else
                {
                    bSuccess = FALSE;
                }
            }
        } break;
    }

    if (!bBypassRolls)
    {
        if (bBuildSuccess && sItemToCreateResRef != "")
        {
            SendMessageToPC(oPC, sGreenText + "Build & Repair - Success: " +
                                        IntToString(nBuild) + " + " + IntToString(nBuildRoll) +
                                        " vs. DC " + IntToString(nUninstallDC));
            CreateItemOnObject(sItemToCreateResRef, oPC);
        }
        else
        {
            SendMessageToPC(oPC, sRedText + "Build & Repair - Failure: " +
                                        IntToString(nBuild) + " + " + IntToString(nBuildRoll) +
                                        " vs. DC " + IntToString(nUninstallDC));
        }

         if (bCraftSuccess)
        {
            SendMessageToPC(oPC, sGreenText + "Craft Mechanical - Success: " +
                                        IntToString(nCraft) + " + " + IntToString(nCraftRoll) +
                                        " vs. DC " + IntToString(nUpgradeDC));
        }
        else
        {
            SendMessageToPC(oPC, sRedText + "Craft Mechanical - Failure: " +
                                        IntToString(nCraft) + " + " + IntToString(nCraftRoll) +
                                        " vs. DC " + IntToString(nUpgradeDC));
            if (nCraftRoll == 1)
            {
                DestroyObject(oUpgrade);
            }
        }
    }

    if (bSuccess)
    {
        DestroyObject(oUpgrade);
        SendMessageToPC(oPC, sGreenText + "*" + sUpgradeName + " Successfully Installed*");
        SetShipStatsAdvanced(oItem, ship);
        DelayCommand(0.1, UpdateDeedShipStatDescription(oItem));
    }
    else
    {
        SendMessageToPC(oPC, sRedText + "*Installation of " + sUpgradeName + " Failed*");
    }
    return bSuccess;
}



