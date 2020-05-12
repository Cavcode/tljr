const int EVENT_USER_DEFINED_PRESPAWN = 1510;
const int EVENT_USER_DEFINED_POSTSPAWN = 1511;

#include "x2_inc_switches"
#include "pug_inc"
#include "X0_I0_SPELLS"
#include "nwnx_creature"

// Scale Defenders based on max PC level in area
// nModifier can be used to apply a global boost to the defenders
void ScaleDefenders(object oNPC, int nModifier);

void main()
{
    // User defined OnSpawn event requested?
    int nSpecEvent = GetLocalInt(OBJECT_SELF,"X2_USERDEFINED_ONSPAWN_EVENTS");
    /*int nTake = GetLocalInt(GetArea(OBJECT_SELF), GetTag(OBJECT_SELF));

    if (nTake == TRUE)
        {
        DelayCommand( 0.5, AssignCommand(OBJECT_SELF, ActionJumpToLocation(GetLocation(GetWaypointByTag("DEAD_EMPIRE")))));
        SetLocalInt(GetArea(OBJECT_SELF), GetTag(OBJECT_SELF), FALSE);
        }
      */
    // Pre Spawn Event requested
    if (nSpecEvent == 1  || nSpecEvent == 3  )
    {
    SignalEvent(OBJECT_SELF,EventUserDefined(EVENT_USER_DEFINED_PRESPAWN ));
    }

    /*  Fix for the new golems to reduce their number of attacks */

    int nNumber = GetLocalInt(OBJECT_SELF,CREATURE_VAR_NUMBER_OF_ATTACKS);
    if (nNumber >0 )
    {
        SetBaseAttackBonus(nNumber);
    }

    DelayCommand(10.0, ScaleDefenders(OBJECT_SELF, 0));

    // Execute default OnSpawn script.
    ExecuteScript("nw_c2_default9", OBJECT_SELF);


    //Post Spawn event requeste
    if (nSpecEvent == 2 || nSpecEvent == 3)
    {
    SignalEvent(OBJECT_SELF,EventUserDefined(EVENT_USER_DEFINED_POSTSPAWN));
    }
}

void ScaleDefenders(object oNPC, int nModifier)
{
    object oPC;
    int nMaxLevel = 0;
    int nAB = 0;
    int nAC = 0;
    int nTotLevel = 0;
    int nBAB = 0;
    int nNewHP = 0;
    effect eAB, eAC, eLink;

    oPC = GetFirstPC();
    while(GetIsObjectValid(oPC))
    {
        if (GetArea(oPC) == GetArea(oNPC))
        {
            nTotLevel = GetHitDice(oPC);
            if (nTotLevel > nMaxLevel)
            {
                nMaxLevel = nTotLevel;
            }
        }
        oPC = GetNextPC();
    }

    nBAB = GetBaseAttackBonus(oNPC);

    if (nMaxLevel == 0)
    {
        nAB = 0;
        nAC = 0;
        nNewHP = GetCurrentHitPoints(oNPC);
    }
    // Based on default level 20 creatures
    else if (nMaxLevel <= 5)
    {
        nAB = -12;
        nAC = -12;
        nNewHP = 75;
    }
    else if (nMaxLevel <= 10)
    {
        nAB = -8;
        nAC = -8;
        nNewHP = 150;
    }
    else if (nMaxLevel <= 15)
    {
        nAB = -4;
        nAC = -4;
        nNewHP = 225;
    }
    /*else if (nMaxLevel <= 20)
    {
        nAB = 2;
        nAC = 2;
        nNewHP = 300;
    }
    else if (nMaxLevel <= 25)
    {
        nAB = 8;
        nAC = 8;
        nNewHP = 375;
    }
    else if (nMaxLevel <= 30)
    {
        nAB = 12;
        nAC = 12;
        nNewHP = 450;
    }  */
    else
    {
        nAB = 0;
        nAC = 0;
        nNewHP = GetCurrentHitPoints(oNPC);
    }

    if (nAB > 0)
    {
        eAB = EffectAttackIncrease(nAB);
    }
    else
    {
        eAB = EffectAttackDecrease(nAB);
    }

    if (nAC > 0)
    {
        eAC = EffectACIncrease(nAC);
    }
    else
    {
        eAC = EffectACDecrease(nAC);
    }

   NWNX_Creature_SetMaxHitPointsByLevel(oNPC, 10, 50);
    //SetCurrentHitPoints(oNPC, nNewHP);
    eLink = EffectLinkEffects(eAB,eAC);
    eLink = SupernaturalEffect(eLink);
    effect eHeal = EffectHeal(nNewHP);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eAB,oNPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eAC,oNPC);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eHeal,oNPC);
    if (GetCurrentHitPoints(oNPC) < GetMaxHitPoints(oNPC) )
        {
        DelayCommand(4.0, AssignCommand(oNPC, ActionCastSpellAtObject(SPELL_HEAL, oNPC, METAMAGIC_ANY,TRUE)));

        }
}

