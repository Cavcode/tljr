#include "nwnx_creature"
#include "pug_inc"
void ResetWarning(object oShip)
{
SetLocalInt(oShip, "SABOTAGE", FALSE);
}

void main()
{
int nDamage = GetTotalDamageDealt();
object oPC = GetLastDamager(OBJECT_SELF);
string sFaction = GetStringLeft(GetTag(OBJECT_SELF),3);
object oShip = GetObjectByTag("PL_S_"+sFaction);
int nStatus = GetLocalInt(oShip, GetTag(OBJECT_SELF));
string sUnit = GetTag(OBJECT_SELF);
object oOther = GetFirstPC();
string sBase;
if (sFaction == "ISD"){sBase = "pug_isd_1";}
else if (sFaction == "MCC"){sBase = "pug_mcc_1";}

/*object oDefender = GetFirstObjectInArea(GetArea(oPC));
while (GetIsObjectValid(oDefender) == TRUE)
    {
    if (GetObjectType(oDefender) == OBJECT_TYPE_CREATURE && GetStringLeft(GetTag(oDefender),7) == "pug_isd" && GetNPCFaction(oShip)==GetNPCFaction(oDefender))
        {
        AssignCommand(oDefender, ActionAttack(oPC, FALSE));
        }
    if (GetObjectType(oDefender) == OBJECT_TYPE_CREATURE && GetStringLeft(GetTag(oDefender),7) == "pug_mcc" && GetNPCFaction(oShip)==GetNPCFaction(oDefender))
        {
        AssignCommand(oDefender, ActionAttack(oPC, FALSE));
        }
    }*/
if (nStatus-nDamage < 1 && GetLocalInt(OBJECT_SELF, "BROKEN") == FALSE)
    {
    if (GetStringRight(sUnit, 8) == "_SHIELDS")
        {
        //FloatingTextStringOnCreature("Shield battery disabled", oPC, TRUE);
        while (GetIsObjectValid(oOther) == TRUE)
            {
            if (GetTag(GetArea(oOther)) == sBase)
                {
                FloatingTextStringOnCreature("Shield battery disabled", oOther, TRUE);
                }
            oOther = GetNextPC();
            }
        effect eShield = GetFirstEffect(oShip);
        while (GetIsEffectValid(eShield) == TRUE)
            {
            if (GetEffectType(eShield) == EFFECT_TYPE_DAMAGE_REDUCTION)
                {
                RemoveEffect(oShip, eShield);
                }
            eShield = GetNextEffect(oShip);
            }
        }
    else if (GetStringRight(sUnit, 8) == "_WEAPONS")
        {
        //FloatingTextStringOnCreature("Weapons disabled", oPC, TRUE);
        //DestroyObject(GetItemPossessedBy(oShip,"ser_shipgun_trans"));
        //object oGun = CreateItemOnObject("pug_no_attack", oShip);
        //AssignCommand(oShip, ActionEquipItem(oGun, INVENTORY_SLOT_RIGHTHAND));
        while (GetIsObjectValid(oOther) == TRUE)
            {
            if (GetTag(GetArea(oOther)) == sBase)
                {
                FloatingTextStringOnCreature("Targeting computer disabled", oOther, TRUE);
                }
            oOther = GetNextPC();
            }
        }
    else if (GetStringRight(sUnit, 8) == "_ENGINES")
        {
        FloatingTextStringOnCreature("Engines disabled", oPC, TRUE);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneImmobilize(), oShip);
        while (GetIsObjectValid(oOther) == TRUE)
            {
            if (GetTag(GetArea(oOther)) == sBase)
                {
                FloatingTextStringOnCreature("Engines disabled", oOther, TRUE);
                }
            oOther = GetNextPC();
            }
        }
    else if (GetStringRight(sUnit, 8) == "_SUPPORT")
        {
        //FloatingTextStringOnCreature("Life support failing", oPC, TRUE);
        while (GetIsObjectValid(oOther) == TRUE)
            {
            if (GetTag(GetArea(oOther)) == sBase)
                {
                FloatingTextStringOnCreature("Life support failing", oOther, TRUE);
                }
            oOther = GetNextPC();
            }
        }
    SetLocalInt(OBJECT_SELF, "BROKEN", TRUE);
    SetLocalInt(OBJECT_SELF, "REPAIR", 0);
    SetLocalInt(oShip, sUnit, 0);
    }
else
    {
    if (nStatus-nDamage >= 0)
        {SetLocalInt(oShip, sUnit, nStatus-nDamage);}
    else if (nStatus-nDamage < 0)
        {SetLocalInt(oShip, sUnit, 0);}

    if ( GetLocalInt(OBJECT_SELF, "SABOTAGE") == FALSE )
        {
            while (GetIsObjectValid(oOther) == TRUE)
            {
            if (GetTag(GetArea(oOther)) == sBase)
                {
                FloatingTextStringOnCreature(GetName(OBJECT_SELF)+" is being damaged ", oOther, TRUE);
                }
            oOther = GetNextPC();
            }
        SetLocalInt(OBJECT_SELF, "SABOTAGE", TRUE);
        DelayCommand(10.0, ResetWarning(OBJECT_SELF));
        }
    }
ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(OBJECT_SELF)-GetCurrentHitPoints(OBJECT_SELF)), OBJECT_SELF);
}
