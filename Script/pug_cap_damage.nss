#include "nwnx_creature"
void ResetWarning(object oShip)
{
SetLocalInt(oShip, "WARNED", FALSE);
}

void main()
{
int nDamage = GetTotalDamageDealt();
object oPC = GetLastDamager(OBJECT_SELF);
string sFaction = GetTag(OBJECT_SELF);
string sShip = GetStringRight(sFaction, 3);
int nShields = GetLocalInt(OBJECT_SELF, sShip+"_SHIELDS");
int nWeapons = GetLocalInt(OBJECT_SELF, sShip+"_WEAPONS");
int nEngine = GetLocalInt(OBJECT_SELF, sShip+"_ENGINES");
int nSupport = GetLocalInt(OBJECT_SELF, sShip+"_SUPPORT");
int nWarned = GetLocalInt(OBJECT_SELF, "WARNED");
object oOther = GetFirstPC();
string sBase;
if (sFaction == "PL_S_ISD"){sBase = "pug_isd_1";}
else if (sFaction == "PL_S_MCC"){sBase = "pug_mcc_1";}

int nRoll = Random(4);
int nDone = FALSE;
int nShieldHit, nWeaponHit, nEngineHit, nSupportHit;
int nCount = 0;

while (nDone == FALSE && nCount < 11)
    {
    if (nRoll == 0 && GetLocalInt(GetObjectByTag(sShip+"_SHIELDS"), "BROKEN")==FALSE)
        {nShieldHit = nDamage;nDone = TRUE;}
    else if (nRoll == 1 && GetLocalInt(GetObjectByTag(sShip+"_WEAPONS"), "BROKEN")==FALSE)
        {nWeaponHit = nDamage;nDone = TRUE;}
    else if (nRoll == 2 && GetLocalInt(GetObjectByTag(sShip+"_ENGINES"), "BROKEN")==FALSE)
        {nEngineHit = nDamage;nDone = TRUE;}
    else if (nRoll == 3 && GetLocalInt(GetObjectByTag(sShip+"_SUPPORT"), "BROKEN")==FALSE)
        {nSupportHit = nDamage;nDone = TRUE;}
    else
        {nRoll = Random(4); nCount++;}
    }

    while (GetIsObjectValid(oOther) == TRUE && nWarned == FALSE)
        {
        if (GetTag(GetArea(oOther)) == sBase)
            {
            FloatingTextStringOnCreature(GetName(oPC)+" is attacking the ship", oOther, TRUE);
            }
        oOther = GetNextPC();
        }

if (nWarned == FALSE)
    {
    SetLocalInt(OBJECT_SELF, "WARNED", TRUE);
    DelayCommand(15.0, ResetWarning(OBJECT_SELF));
    }

if(nShields-nShieldHit < 1 && GetLocalInt(GetObjectByTag(sShip+"_SHIELDS"), "BROKEN") == FALSE)
    {
    FloatingTextStringOnCreature("Shield battery disabled", oPC, TRUE);
    while (GetIsObjectValid(oOther) == TRUE)
        {
        if (GetTag(GetArea(oOther)) == sBase)
            {
            FloatingTextStringOnCreature("Shield battery disabled", oOther, TRUE);
            }
        oOther = GetNextPC();
        }
    effect eShield = GetFirstEffect(OBJECT_SELF);
    while (GetIsEffectValid(eShield) == TRUE)
        {
        if (GetEffectType(eShield) == EFFECT_TYPE_DAMAGE_REDUCTION)
            {
            RemoveEffect(OBJECT_SELF, eShield);
            }
        eShield = GetNextEffect(OBJECT_SELF);
        }
    SetLocalInt(GetObjectByTag(sShip+"_SHIELDS"), "BROKEN", TRUE);
    SetLocalInt(GetObjectByTag(sShip+"_SHIELDS"), "REPAIR", 0);
    SetLocalInt(OBJECT_SELF, sShip+"_SHIELDS", 0);
    }
else {SetLocalInt(OBJECT_SELF, sShip+"_SHIELDS", nShields-nShieldHit);}

if (nWeapons-nWeaponHit < 1 && GetLocalInt(GetObjectByTag(sShip+"_WEAPONS"), "BROKEN") == FALSE)
    {
    FloatingTextStringOnCreature("Targeting computer disabled", oPC, TRUE);
    while (GetIsObjectValid(oOther) == TRUE)
        {
        if (GetTag(GetArea(oOther)) == sBase)
            {
            FloatingTextStringOnCreature("Targeting computer disabled", oOther, TRUE);
            }
        oOther = GetNextPC();
        }
    SetLocalInt(GetObjectByTag(sShip+"_WEAPONS"), "BROKEN", TRUE);
    SetLocalInt(OBJECT_SELF, sShip+"_WEAPONS", 0);
    }
else {SetLocalInt(OBJECT_SELF, sShip+"_WEAPONS", nWeapons-nWeaponHit);}

if (nEngine-nEngineHit < 1 && GetLocalInt(GetObjectByTag(sShip+"_ENGINES"), "BROKEN") == FALSE)
    {
    FloatingTextStringOnCreature("Engines disabled", oPC, TRUE);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectParalyze(), OBJECT_SELF);
    while (GetIsObjectValid(oOther) == TRUE)
        {
        if (GetTag(GetArea(oOther)) == sBase)
            {
            FloatingTextStringOnCreature("Engines disabled", oOther, TRUE);
            }
        oOther = GetNextPC();
        }
    SetLocalInt(GetObjectByTag(sShip+"_ENGINES"), "BROKEN", TRUE);
    SetLocalInt(OBJECT_SELF, sShip+"_ENGINES", 0);
    }
else {SetLocalInt(OBJECT_SELF, sShip+"_ENGINES", nEngine-nEngineHit);}

if (nSupport-nSupportHit < 1 && GetLocalInt(GetObjectByTag(sShip+"_SUPPORT"), "BROKEN") == FALSE)
    {
    FloatingTextStringOnCreature("Life support failing", oPC, TRUE);
    while (GetIsObjectValid(oOther) == TRUE)
        {
        if (GetTag(GetArea(oOther)) == sBase)
            {
            FloatingTextStringOnCreature("Life support failing", oOther, TRUE);
            }
        oOther = GetNextPC();
        }
    SetLocalInt(GetObjectByTag(sShip+"_SUPPORT"), "BROKEN", TRUE);
    SetLocalInt(OBJECT_SELF, sShip+"_SUPPORT", 0);
    }
else {SetLocalInt(OBJECT_SELF, sShip+"_SUPPORT", nSupport-nSupportHit);}
//AssignCommand(OBJECT_SELF, ActionSpeakString("Damage: "+IntToString(nDamage), TALKVOLUME_TALK));

ExecuteScript("nw_c2_default6", OBJECT_SELF);
}
