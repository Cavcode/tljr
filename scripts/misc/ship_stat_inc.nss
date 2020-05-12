//void main(){}
#include "nwnx_area"
#include "nwnx_creature"
#include "qx_ship_config"
/////////// FUNCTIONS ///////////////////////

//void main(){}




int bDebug;

// Load ship interior area for oPC
// Returns TRUE if successfull
int SetShipInterior(object oPC, int nShipType);

// Returns oPC's ship interior area
// or OBJECT_INVALID if it doesn't exist
object GetShipInteriorArea(object oPC);

// Set ship creature object for oPC
// this object is used when oPC is not piloting the ship
// Returns TRUE if successfull
int SetShipObject(object oPC);

// Returns oPC's ship creature object
// or OBJECT_INVALID if it doesn't exist
// this object is used when oPC is not piloting the ship
object GetShipObject(object oPC);


//////////// IMPLEMENTATION /////////////////

int SetShipInterior(object oPC, int nShipType)
{

    object oMod = GetModule();
    object oArea;
    string sShipResRef = "INVALID";
    string sArea = LMOD_SHIP_AREA + "_" + GetPCPlayerName(oPC) + "_" + GetName(oPC);
    string sType = LMOD_SHIP_TYPE + "_" + GetPCPlayerName(oPC) + "_" + GetName(oPC);

    switch(nShipType)
    {
            case SHIP_TYPE_E_WING:      sShipResRef = SHIP_RESREF_E_WING; break;
            case SHIP_TYPE_A_WING:      sShipResRef = SHIP_RESREF_A_WING; break;
            case SHIP_TYPE_B_WING:      sShipResRef = SHIP_RESREF_B_WING; break;
            case SHIP_TYPE_TIE_I:       sShipResRef = SHIP_RESREF_TIE_I; break;
            case SHIP_TYPE_TIE_F:       sShipResRef = SHIP_RESREF_TIE_F; break;
            case SHIP_TYPE_TIE_B:       sShipResRef = SHIP_RESREF_TIE_B; break;
            case SHIP_TYPE_FIRESPRAY:   sShipResRef = SHIP_RESREF_FIRESPRAY; break;
            case SHIP_TYPE_NABOO_F:     sShipResRef = SHIP_RESREF_NABOO_F; break;
            case SHIP_TYPE_Y_WING:      sShipResRef = SHIP_RESREF_Y_WING; break;
            case SHIP_TYPE_X_WING:      sShipResRef = SHIP_RESREF_X_WING; break;
            case SHIP_TYPE_LAMBDA:      sShipResRef = SHIP_RESREF_LAMBDA; break;
            case SHIP_TYPE_YT2400:      sShipResRef = SHIP_RESREF_YT2400; break;
            case SHIP_TYPE_ISD1:        sShipResRef = SHIP_RESREF_ISD1; break;
            case SHIP_TYPE_MON_CRUISE:  sShipResRef = SHIP_RESREF_MON_CRUISE; break;
            case SHIP_TYPE_TARTAN_CR:   sShipResRef = SHIP_RESREF_TARTAN_CR; break;
            case SHIP_TYPE_DEATHSTAR:   sShipResRef = SHIP_RESREF_DEATHSTAR; break;
            default: sShipResRef = "INVALID"; break;
    }

    if (sShipResRef == "INVALID")
    {
        if (bDebug)
        {
            SendMessageToPC(oPC, "Your ship has no valid interior");
            SendMessageToAllDMs(GetName(oPC) + "'s ship has no valid interior");
            return FALSE;
        }
    }
    else
    {
        oArea = CreateArea(sShipResRef);
        if (oArea == OBJECT_INVALID)
        {
            if (bDebug)
            {
                SendMessageToPC(oPC, "Your ship area could not be created");
                SendMessageToAllDMs(GetName(oPC) + "'s ship area could not be created");
            }
            return FALSE;
        }
        else
        {
            SetLocalObject(oMod, sArea, oArea);
            SetLocalInt(oMod, sType, nShipType);
            if (bDebug)
            {
                SendMessageToPC(oPC, "Your ship area has been created");
                SendMessageToAllDMs(GetName(oPC) + "'s ship area was created");
            }
            return TRUE;
        }
    }
    return FALSE;
}

object GetShipInteriorArea(object oPC)
{
    string sVar = LMOD_SHIP_AREA + "_" + GetPCPlayerName(oPC) + "_" + GetName(oPC);
    object oArea = GetLocalObject(GetModule(),sVar);
    return oArea;
}

int SetShipObject(object oPC)
{
    string sShipResRef;
    object oShip;
    object oMod = GetModule();
    int bDebug = GetLocalInt(oMod, DEBUG);
    location lShip = GetLocation(oPC);
    string sArea = LMOD_SHIP_AREA + "_" + GetPCPlayerName(oPC) + "_" + GetName(oPC);
    string sType = LMOD_SHIP_TYPE + "_" + GetPCPlayerName(oPC) + "_" + GetName(oPC);
    string sShip = LMOD_SHIP_OBJECT + "_" + GetPCPlayerName(oPC) + "_" + GetName(oPC);
    int nShipType = GetLocalInt(oMod,LMOD_SHIP_TYPE);

    switch(nShipType)
    {
            case SHIP_TYPE_E_WING:      sShipResRef = CREATURE_RESREF_E_WING; break;
            case SHIP_TYPE_A_WING:      sShipResRef = CREATURE_RESREF_A_WING; break;
            case SHIP_TYPE_B_WING:      sShipResRef = CREATURE_RESREF_B_WING; break;
            case SHIP_TYPE_TIE_I:       sShipResRef = CREATURE_RESREF_TIE_I; break;
            case SHIP_TYPE_TIE_F:       sShipResRef = CREATURE_RESREF_TIE_F; break;
            case SHIP_TYPE_TIE_B:       sShipResRef = CREATURE_RESREF_TIE_B; break;
            case SHIP_TYPE_FIRESPRAY:   sShipResRef = CREATURE_RESREF_FIRESPRAY; break;
            case SHIP_TYPE_NABOO_F:     sShipResRef = CREATURE_RESREF_NABOO_F; break;
            case SHIP_TYPE_Y_WING:      sShipResRef = CREATURE_RESREF_Y_WING; break;
            case SHIP_TYPE_X_WING:      sShipResRef = CREATURE_RESREF_X_WING; break;
            case SHIP_TYPE_LAMBDA:      sShipResRef = CREATURE_RESREF_LAMBDA; break;
            case SHIP_TYPE_YT2400:      sShipResRef = CREATURE_RESREF_YT2400; break;
            case SHIP_TYPE_ISD1:        sShipResRef = CREATURE_RESREF_ISD1; break;
            case SHIP_TYPE_MON_CRUISE:  sShipResRef = CREATURE_RESREF_MON_CRUISE; break;
            case SHIP_TYPE_TARTAN_CR:   sShipResRef = CREATURE_RESREF_TARTAN_CR; break;
            case SHIP_TYPE_DEATHSTAR:   sShipResRef = CREATURE_RESREF_DEATHSTAR; break;
            default: sShipResRef = "INVALID"; break;
    }

    if (sShipResRef == "INVALID")
    {
        if (bDebug)
        {
            SendMessageToPC(oPC, "Your ship object could not be created created, invalid resref");
            SendMessageToAllDMs(GetName(oPC) + "'s ship object could not be created, invalid resref");
        }
        return FALSE;
    }
    else
    {
        oShip = CreateObject(OBJECT_TYPE_CREATURE, sShipResRef, lShip, FALSE);
        if (GetIsObjectValid(oShip))
        {
            SetLocalObject(oMod, sShip, oShip);
            if (bDebug)
            {
                SendMessageToPC(oPC, "Your ship object was created");
                SendMessageToAllDMs(GetName(oPC) + "'s ship object was created");
            }
            return TRUE;
        }
        else
        {
            SendMessageToPC(oPC, "Your ship object could not be created created, no object");
            SendMessageToAllDMs(GetName(oPC) + "'s ship object could not be created, no object");
            return FALSE;
        }
    }
    return FALSE;
}

object GetShipObject(object oPC)
{
    string sShip = LMOD_SHIP_OBJECT + "_" + GetPCPlayerName(oPC) + "_" + GetName(oPC);
    object oShip = GetLocalObject(GetModule());
    return oShip;
}

void SetShipStats(object oPC, int nShipType, int nPilot)
{
int nAC = GetAC(oPC);
int nAB = GetBaseAttackBonus(oPC);
int nHP = GetMaxHitPoints(oPC);
effect eAC, eAB, eHP; int nSpeed;
SetLocalInt(oPC, "MOVEMENT_RATE", GetMovementRate(oPC));

if (nShipType == 320)
    {
    nAC = TRANSPORT_AC - nAC;
    nAB = TRANSPORT_AB - nAB;
    nHP = TRANSPORT_HP - nHP;
    }
else if (nShipType == 321)
    {
    nAC = FIGHTER_AC - nAC;
    nAB = FIGHTER_AB - nAB;
    nHP = FIGHTER_HP - nHP;
    }
else if (nShipType == 322)
    {
    nAC = BOMBER_AC - nAC;
    nAB = BOMBER_AB - nAB;
    nHP = BOMBER_HP - nHP;
    }
else if (nShipType == 323)
    {
    nAC = FIGHTER_AC - nAC;
    nAB = FIGHTER_AB - nAB;
    nHP = FIGHTER_HP - nHP;
    }
else if (nShipType == 324)
    {
    nAC = FIGHTER_AC - nAC;
    nAB = FIGHTER_AB - nAB;
    nHP = FIGHTER_HP - nHP;
    }
else if (nShipType == 325)
    {
    nAC = BOMBER_AC - nAC;
    nAB = BOMBER_AB - nAB;
    nHP = BOMBER_HP - nHP;
    }
else if (nShipType == 326)
    {
    nAC = TRANSPORT_AC - nAC;
    nAB = TRANSPORT_AB - nAB;
    nHP = TRANSPORT_HP - nHP;
    }
else if (nShipType == 327)
    {
    nAC = FIGHTER_AC - nAC;
    nAB = FIGHTER_AB - nAB;
    nHP = FIGHTER_HP - nHP;
    }
else if (nShipType == 328)
    {
    nAC = BOMBER_AC - nAC;
    nAB = BOMBER_AB - nAB;
    nHP = BOMBER_HP - nHP;
    }
else if (nShipType == 329)
    {
    nAC = FIGHTER_AC - nAC;
    nAB = FIGHTER_AB - nAB;
    nHP = FIGHTER_HP - nHP;
    }
else if (nShipType == 330)
    {
    nAC = TRANSPORT_AC - nAC;
    nAB = TRANSPORT_AB - nAB;
    nHP = TRANSPORT_HP - nHP;
    }
else if (nShipType == 331)
    {
    nAC = TRANSPORT_AC - nAC;
    nAB = TRANSPORT_AB - nAB;
    nHP = TRANSPORT_HP - nHP;
    }
else if (nShipType == 331)
    {
    nAC = TRANSPORT_AC - nAC;
    nAB = TRANSPORT_AB - nAB;
    nHP = TRANSPORT_HP - nHP;
    }

eAB = EffectAttackIncrease(nAB+nPilot/5, ATTACK_BONUS_MISC);
eAC = EffectACIncrease(nAC+nPilot/5, AC_NATURAL_BONUS, AC_VS_DAMAGE_TYPE_ALL);
if (GetMaxHitPoints(oPC) < nHP)
    {
    eHP = EffectTemporaryHitpoints(nHP);
    }
effect eStr = EffectAbilityIncrease(ABILITY_STRENGTH, STRENGTH - GetAbilityScore(oPC,ABILITY_STRENGTH,FALSE));
effect eDex = EffectAbilityIncrease(ABILITY_DEXTERITY, DEXTERITY - GetAbilityScore(oPC,ABILITY_DEXTERITY,FALSE));
nSpeed = GetMovementRate(oPC)+(SPEED + nPilot/2);

ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAB, oPC);
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAttackBonus(nAB), GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC));
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_PHYSICAL, IP_CONST_DAMAGEBONUS_2d12), GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC));
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_NEGATIVE, IP_CONST_DAMAGEBONUS_2d12), GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC));
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ELECTRICAL, IP_CONST_DAMAGEBONUS_2d12), GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC));
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyLight(IP_CONST_LIGHTBRIGHTNESS_BRIGHT, IP_CONST_LIGHTCOLOR_WHITE), GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC));

effect eElec = EffectDamageIncrease(DAMAGE_BONUS_20, DAMAGE_TYPE_ELECTRICAL);
effect ePierce = EffectDamageIncrease(DAMAGE_BONUS_20, DAMAGE_TYPE_PIERCING);

ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePierce, oPC);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eElec, oPC);

ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAC, oPC);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHP, oPC);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStr, oPC);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDex, oPC);
//SetMovementRate (oPC, nSpeed);
}



/*
//void main(){}
#include "nwnx_funcs"

const int FIGHTER_AC = 40;
const int BOMBER_AC = 35;
const int TRANSPORT_AC = 35;

const int FIGHTER_AB = 34;
const int BOMBER_AB = 28;
const int TRANSPORT_AB = 34;

const int FIGHTER_HP = 800;
const int BOMBER_HP = 1700;
const int TRANSPORT_HP = 1300;

const int SPEED = 20;
const int STRENGTH = 18;
const int DEXTERITY = 18;

void SetShipStats(object oPC, int nShipType, int nPilot)
{
int nAC = GetAC(oPC);
int nAB = GetBaseAttackBonus(oPC);
int nHP = GetMaxHitPoints(oPC);
effect eAC, eAB, eHP; int nSpeed;
//SetLocalInt(oPC, "MOVEMENT_RATE", GetMovementRate(oPC));

if (nShipType == 320)
    {
    nAC = TRANSPORT_AC - nAC;
    nAB = TRANSPORT_AB - nAB;
    nHP = TRANSPORT_HP - nHP;
    }
else if (nShipType == 321)
    {
    nAC = FIGHTER_AC - nAC;
    nAB = FIGHTER_AB - nAB;
    nHP = FIGHTER_HP - nHP;
    }
else if (nShipType == 322)
    {
    nAC = BOMBER_AC - nAC;
    nAB = BOMBER_AB - nAB;
    nHP = BOMBER_HP - nHP;
    }
else if (nShipType == 323)
    {
    nAC = FIGHTER_AC - nAC;
    nAB = FIGHTER_AB - nAB;
    nHP = FIGHTER_HP - nHP;
    }
else if (nShipType == 324)
    {
    nAC = FIGHTER_AC - nAC;
    nAB = FIGHTER_AB - nAB;
    nHP = FIGHTER_HP - nHP;
    }
else if (nShipType == 325)
    {
    nAC = BOMBER_AC - nAC;
    nAB = BOMBER_AB - nAB;
    nHP = BOMBER_HP - nHP;
    }
else if (nShipType == 326)
    {
    nAC = TRANSPORT_AC - nAC;
    nAB = TRANSPORT_AB - nAB;
    nHP = TRANSPORT_HP - nHP;
    }
else if (nShipType == 327)
    {
    nAC = FIGHTER_AC - nAC;
    nAB = FIGHTER_AB - nAB;
    nHP = FIGHTER_HP - nHP;
    }
else if (nShipType == 328)
    {
    nAC = BOMBER_AC - nAC;
    nAB = BOMBER_AB - nAB;
    nHP = BOMBER_HP - nHP;
    }
else if (nShipType == 329)
    {
    nAC = FIGHTER_AC - nAC;
    nAB = FIGHTER_AB - nAB;
    nHP = FIGHTER_HP - nHP;
    }
else if (nShipType == 330)
    {
    nAC = TRANSPORT_AC - nAC;
    nAB = TRANSPORT_AB - nAB;
    nHP = TRANSPORT_HP - nHP;
    }
else if (nShipType == 331)
    {
    nAC = TRANSPORT_AC - nAC;
    nAB = TRANSPORT_AB - nAB;
    nHP = TRANSPORT_HP - nHP;
    }
else if (nShipType == 331)
    {
    nAC = TRANSPORT_AC - nAC;
    nAB = TRANSPORT_AB - nAB;
    nHP = TRANSPORT_HP - nHP;
    }

eAB = EffectAttackIncrease(nAB+nPilot/5, ATTACK_BONUS_MISC);
eAC = EffectACIncrease(nAC+nPilot/5, AC_NATURAL_BONUS, AC_VS_DAMAGE_TYPE_ALL);
if (GetMaxHitPoints(oPC) < nHP)
    {
    eHP = EffectTemporaryHitpoints(nHP);
    }
effect eStr = EffectAbilityIncrease(ABILITY_STRENGTH, STRENGTH - GetAbilityScore(oPC,ABILITY_STRENGTH,FALSE));
effect eDex = EffectAbilityIncrease(ABILITY_DEXTERITY, DEXTERITY - GetAbilityScore(oPC,ABILITY_DEXTERITY,FALSE));
nSpeed = GetMovementRate(oPC)+(SPEED + nPilot/2);

ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAB, oPC);
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAttackBonus(nAB), GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC));
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_PHYSICAL, IP_CONST_DAMAGEBONUS_2d12), GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC));
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_NEGATIVE, IP_CONST_DAMAGEBONUS_2d12), GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC));
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ELECTRICAL, IP_CONST_DAMAGEBONUS_2d12), GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC));
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyLight(IP_CONST_LIGHTBRIGHTNESS_BRIGHT, IP_CONST_LIGHTCOLOR_WHITE), GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC));

effect eElec = EffectDamageIncrease(DAMAGE_BONUS_20, DAMAGE_TYPE_ELECTRICAL);
effect ePierce = EffectDamageIncrease(DAMAGE_BONUS_20, DAMAGE_TYPE_PIERCING);

ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePierce, oPC);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eElec, oPC);

ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAC, oPC);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHP, oPC);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStr, oPC);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDex, oPC);
//SetMovementRate (oPC, nSpeed);
}

*/
