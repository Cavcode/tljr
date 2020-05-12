#include "nwnx_creature"

//void main(){}
// DB Constants
const string SHIP_DB = "SHIP_DB1";
const string SHIP_HP = "SHIP_HP";
const string SHIP_PLAYER_HP = "SHIP_PLAYER_HP";

// Skill Constants
const int SKILL_PILOT               = 27;
const int SKILL_BUILD_REPAIR        = 28;
const int SKILL_CRAFT_MECHANICAL    = 38;

// Pilot Skill Adjustment Multipliers
const float PILOT_ACCURACY_MULTIPIER    = 1.0;
const float PILOT_EVASION_MULTIPIER     = 0.25;

// Color Constants Used in Ship Deeds
const string sDarkYellowText    = "<c¥¥ >";
const string sYellowText        = "<cþþ >";
const string sWhiteText         = "<cþþþ>";
const string sRedText           = "<cþ  >";
const string sGreenText         = "<c þ >";
const string sDarkGreyText      = "<cŒŒŒ>";
// Structs for storing ship stats
struct ShipStatsBasicStruct
{
    int nShipType;
    int nAccuracy;
    int nEvasion;
    int nHitpoints;
    int nSpeed;
    int nBaseSpeed;
    int nPower;
    int nPowerUsed;
    int nCargoCapacity;
    int nWeapon1Damage;
    int nWeapon1SpellShape;
    int nWeapon1Accuracy;
    int nWeapon1Capacity;
    int nWeapon1Rate;
    int nWeapon1Projectile;
    int nWeapon1Special;
    int nWeapon2Damage;
    int nWeapon2SpellShape;
    int nWeapon2Accuracy;
    int nWeapon2Capacity;
    int nWeapon2Rate;
    int nWeapon2Projectile;
    int nWeapon2Special;
    int nCargoModEvasionDecrease;
    int nCargoModSpeedDecrease;
};

struct ShipStatsAdvancedStruct
{
    int nShipType;
    string sShipTypeName;
    int nAccuracy;
    int nEvasion;
    int nHitpoints;
    int nSpeed;
    int nBaseSpeed;
    int nPower;
    int nPowerUsed;
    int nCargoCapacity;
    string sPowerName;
    string sPowerResRef;
    int nEngineSpeed;
    string sEngineName;
    string sEngineResRef;
    int nHyperMod;
    string sHyperModName;
    string sHyperModResRef;
    int nShields;
    string sShieldsName;
    string sShieldsResRef;
    int nTargeting;
    string sTargetingName;
    string sTargetingResRef;
    int nCargoBaseCapacity;
    int nCargoModCapacity;
    int nCargoModEvasionDecrease;
    int nCargoModSpeedDecrease;
    string sCargoModName;
    int nWeapon1Damage;
    int nWeapon1SpellShape;
    string sWeapon1MountName;
    int nWeapon1Targeting;
    int nWeapon1Accuracy;
    int nWeapon1Capacity;
    int nWeapon1Rate;
    int nWeapon1Projectile;
    int nWeapon1Special;
    string sWeapon1Name;
    string sWeapon1ResRef;
    int nWeapon2Damage;
    int nWeapon2SpellShape;
    string sWeapon2MountName;
    int nWeapon2Targeting;
    int nWeapon2Accuracy;
    int nWeapon2Capacity;
    int nWeapon2Rate;
    int nWeapon2Projectile;
    int nWeapon2Special;
    string sWeapon2Name;
    string sWeapon2ResRef;

    int nEnginePower;
    int nHyperModPower;
    int nShieldsPower;
    int nTargetingPower;
    int nWeapon1Power;
    int nWeapon2Power;
};

// Ship Stat Types
const int VAR_SHIP_STAT_TYPE_POWER          = 10;
const int VAR_SHIP_STAT_TYPE_ENGINE         = 20;
const int VAR_SHIP_STAT_TYPE_HYPERMOD       = 40;
const int VAR_SHIP_STAT_TYPE_SHIELDS        = 30;
const int VAR_SHIP_STAT_TYPE_TARGETING      = 50;
const int VAR_SHIP_STAT_TYPE_WEAPON1        = 60;
const int VAR_SHIP_STAT_TYPE_WEAPON2        = 70;
const int VAR_SHIP_STAT_TYPE_CARGOMOD       = 80;

// Ship Stat Variables
const string VAR_SHIP_ACCURACY              = "SHIP_ACCURACY";
const string VAR_SHIP_EVASION               = "SHIP_EVASION";
const string VAR_SHIP_HITPOINTS             = "SHIP_HITPOINTS";
const string VAR_SHIP_SPEED                 = "SHIP_SPEED";
const string VAR_SHIP_TYPE                  = "SHIP_TYPE";
const string VAR_SHIP_POWER                 = "SHIP_POWER";
const string VAR_SHIP_ENGINE                = "SHIP_ENGINE";
// needed? const string VAR_SHIP_ENGINE_SPEED          = "SHIP_ENGINE_SPEED";
const string VAR_SHIP_HYPERMOD              = "SHIP_HYPERMOD";
const string VAR_SHIP_SHIELDS               = "SHIP_SHIELDS";
const string VAR_SHIP_TARGETING             = "SHIP_TARGETING";
const string VAR_SHIP_WEAPON1_TARGETING     = "SHIP_WEAPON1_TARGETING";
const string VAR_SHIP_WEAPON1_ROF           = "SHIP_WEAPON1_ROF";
const string VAR_SHIP_WEAPON1_CAPACITY      = "SHIP_WEAPON1_CAPACITY";
const string VAR_SHIP_WEAPON1_DAMAGE        = "SHIP_WEAPON1_DAMAGE";
const string VAR_SHIP_WEAPON1_PROJECTILE    = "SHIP_WEAPON1_PROJECTILE";
const string VAR_SHIP_WEAPON1_SPECIAL       = "SHIP_WEAPON1_SPECIAL";
const string VAR_SHIP_WEAPON2_TARGETING     = "SHIP_WEAPON2_TARGETING";
const string VAR_SHIP_WEAPON2_ROF           = "SHIP_WEAPON2_ROF";
const string VAR_SHIP_WEAPON2_CAPACITY      = "SHIP_WEAPON2_CAPACITY";
const string VAR_SHIP_WEAPON2_DAMAGE        = "SHIP_WEAPON2_DAMAGE";
const string VAR_SHIP_WEAPON2_PROJECTILE    = "SHIP_WEAPON2_PROJECTILE";
const string VAR_SHIP_WEAPON2_SPECIAL       = "SHIP_WEAPON2_SPECIAL";
const string VAR_SHIP_CARGO_BASE            = "SHIP_CARGO_BASE";
const string VAR_SHIP_CARGOMOD              = "SHIP_CARGOMOD";
const string VAR_SHIP_CARGOMOD_SPEED_DECREASE = "SHIP_CARGOMOD_SPEED_DECREASE";
const string VAR_SHIP_CARGOMOD_EVASION_DECREASE = "SHIP_CARGOMOD_EVASION_DECREASE";

// Currently Installed ship system names
const string VAR_SHIP_POWER_NAME            = "SHIP_POWER_NAME";
const string VAR_SHIP_ENGINE_NAME           = "SHIP_ENGINE_NAME";
const string VAR_SHIP_HYPERMOD_NAME         = "SHIP_HYPERMOD_NAME";
const string VAR_SHIP_SHIELDS_NAME          = "SHIP_SHIELDS_NAME";
const string VAR_SHIP_TARGETING_NAME        = "SHIP_TARGETING_NAME";
const string VAR_SHIP_WEAPON1_NAME          = "SHIP_WEAPON1_NAME";
const string VAR_SHIP_WEAPON2_NAME          = "SHIP_WEAPON2_NAME";
const string VAR_SHIP_CARGOMOD_NAME         = "SHIP_CARGOMOD_NAME";

// Currently Installed ship system item resrefs
const string VAR_SHIP_POWER_RESREF          = "SHIP_POWER_RESREF";
const string VAR_SHIP_ENGINE_RESREF         = "SHIP_ENGINE_RESREF";
const string VAR_SHIP_HYPERMOD_RESREF       = "SHIP_HYPERMOD_RESREF";
const string VAR_SHIP_SHIELDS_RESREF        = "SHIP_SHIELDS_RESREF";
const string VAR_SHIP_TARGETING_RESREF      = "SHIP_TARGETING_RESREF";
const string VAR_SHIP_WEAPON1_RESREF        = "SHIP_WEAPON1_RESREF";
const string VAR_SHIP_WEAPON2_RESREF        = "SHIP_WEAPON2_RESREF";

// Power Consumption for each ship system
const string VAR_SHIP_ENGINE_POWER          = "SHIP_ENGINE_POWER";
const string VAR_SHIP_HYPERMOD_POWER        = "SHIP_HYPERMOD_POWER";
const string VAR_SHIP_SHIELDS_POWER         = "SHIP_SHIELDS_POWER";
const string VAR_SHIP_TARGETING_POWER       = "SHIP_TARGETING_POWER";
const string VAR_SHIP_WEAPON1_POWER         = "SHIP_WEAPON1_POWER";
const string VAR_SHIP_WEAPON2_POWER         = "SHIP_WEAPON2_POWER";

// Base Ship Speeds
const int FIGHTER_SPEED     = NWNX_CREATURE_MOVEMENT_RATE_VERY_FAST;
const int BOMBER_SPEED      = NWNX_CREATURE_MOVEMENT_RATE_NORMAL;
const int TRANSPORT_SPEED   = NWNX_CREATURE_MOVEMENT_RATE_FAST;
const int CAP_MEDIUM_SPEED  = NWNX_CREATURE_MOVEMENT_RATE_SLOW;
const int CAP_LARGE_SPEED   = NWNX_CREATURE_MOVEMENT_RATE_VERY_SLOW;

    // Ship Hitpoints
const int FIGHTER_HP = 800;
const int BOMBER_HP = 1700;
const int TRANSPORT_HP = 1300;
const int CAP_MEDIUM_HP  = 2500;
const int CAP_LARGE_HP   = 5000;

    // NPC Ship settings
const    int TRANSPORT_AC    =  0;
const    int TRANSPORT_AB    =  0;
//const    int TRANSPORT_HP    =  1300;

const    int FIGHTER_AC      =  0;
const    int FIGHTER_AB      =  0;
//const    int FIGHTER_HP      =  800;

const    int BOMBER_AC       =  0;
const    int BOMBER_AB       =  0;
//const    int BOMBER_HP       =  1700;

    // Ship Cargo Base Capacity
const int FIGHTER_CARGO_BASE_CAPACITY        = 15;
const int BOMBER_CARGO_BASE_CAPACITY        = 10;
const int TRANSPORT_CARGO_BASE_CAPACITY    = 30;
const int CAP_MEDIUM_CARGO_BASE_CAPACITY    = 100;
const int CAP_LARGE_CARGO_BASE_CAPACITY    = 300;

    // Spell ID's for Ship Weapons
const int SPELL_SHIP_LASER_TRIGGER          = 1305;
const int SPELL_SHIP_MISSILE_TRIGGER        = 1306;
const int SPELL_SHIP_LASER_SINGLE_RED       = 1307;
const int SPELL_SHIP_LASER_SINGLE_GREEN     = 1308;
const int SPELL_SHIP_LASER_DUAL_RED         = 1309;
const int SPELL_SHIP_LASER_DUAL_GREEN       = 1310;
const int SPELL_SHIP_MISSILE_SMALL          = 1319;
const int SPELL_SHIP_MISSILE_LARGE          = 1320;
const int SPELL_SHIP_MISSILE_ENERGY         = 1321;

