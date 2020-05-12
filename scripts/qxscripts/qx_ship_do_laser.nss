#include "NW_I0_SPELLS"
#include "x2_inc_spellhook"

location GetRangeEndLocation(location lCurrent,float fDirection,float fDistance,float fOffFacing = 0.0,float fOffZ = 0.0f);

void main()
{
    int nSpell = 1304;
    object oTarget = GetSpellTargetObject();
    object oPC = OBJECT_SELF;
    location lTargetLocation = GetLocation(oPC);
    location lEndRangeLocation = GetRangeEndLocation(lTargetLocation, GetFacing(oPC), 20.0);
    //object oPC = GetLastSpellCaster();
    location lShooterLocation = GetLocation(oPC);
    int nRoll;
    int nHit = FALSE;
    int nDamage;
    effect eDam = EffectDamage(nDamage, DAMAGE_TYPE_NEGATIVE);
    int nCounter = 0;
    float fDelay;
    float fDelay1;
    int bHit;
    int nAttack;
    int nDefense;
    int nPower = GetLocalInt(oPC, "SHIP_POWER");
    location lTarget;

    if (nPower > 0)
    {
        //SendMessageToPC(oPC, "Shooting Lasers");
        //Declare the spell shape, size and the location.  Capture the first target object in the shape.
        //oTarget = GetFirstObjectInShape(SHAPE_SPELLCYLINDER, 20.0, lTargetLocation, TRUE, OBJECT_TYPE_CREATURE);
        oTarget = GetFirstObjectInShape(SHAPE_SPELLCONE, 30.0, lEndRangeLocation, TRUE, OBJECT_TYPE_CREATURE);
        //object oTesting = CreateObject(OBJECT_TYPE_PLACEABLE,"zep_lightshft001",lShooterLocation, FALSE, GetName(oPC) + "testing");
        //Cycle through the targets within the spell shape until an invalid object is captured.
        while(GetIsObjectValid(oTarget))
        {
            //if (GetIsReactionTypeHostile(oTarget,oPC) == TRUE)
            //if (GetIsEnemy(oTarget,oPC) == TRUE)
            if (oTarget != oPC)
            {
                //SendMessageToPC(oPC, "Target Acquired: " + GetName(oTarget));
                nRoll = d20(1);
                nAttack = GetBaseAttackBonus(oPC);
                nDefense = GetAC(oTarget);
                fDelay = GetDistanceBetween(OBJECT_SELF, oTarget)/10.0;
                fDelay1 = fDelay/(3.0 * log(fDelay) + 2.0);
                nDamage = d10(4);

                if(nRoll == 20)
                {
                    FloatingTextStringOnCreature("Critical Hit", oPC, FALSE);
                    FloatingTextStringOnCreature("Critical Hit", oTarget, FALSE);
                    nDamage = d10(4) * 4;
                }
                else if(nRoll == 19 && (GetBaseAttackBonus(oPC)+nRoll > GetAC(oTarget)))
                {
                    FloatingTextStringOnCreature("Critical Hit", oPC, FALSE);
                    FloatingTextStringOnCreature("Critical Hit", oTarget, FALSE);
                    nDamage = d10(4) * 2;
                }
                else if(GetBaseAttackBonus(oPC)+nRoll > GetAC(oTarget))
                {
                    FloatingTextStringOnCreature("Hit", oPC, FALSE);
                    FloatingTextStringOnCreature("Hit", oTarget, FALSE);
                    nDamage = d10(4);
                }
                else
                {
                    FloatingTextStringOnCreature("Miss", oPC, FALSE);
                    FloatingTextStringOnCreature("Miss", oTarget, FALSE);
                    nDamage = 0;
                }

                if(nDamage > 0)
                {
                    //SendMessageToPC(oPC, "Hit: " + IntToString(nDamage));
                    effect eDam = EffectDamage(nDamage, DAMAGE_TYPE_FIRE);
                    AssignCommand(oPC, ActionCastSpellAtObject(nSpell, oTarget, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT,TRUE));
                    //AssignCommand(oPC, ActionCastFakeSpellAtObject(nSpell, oTarget));
                    DelayCommand(fDelay1,  ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                    //SendMessageToPC(oPC, "Hit: (" + IntToString(nRoll) + " + " + IntToString(nAttack) + " = " + IntToString(nRoll + nAttack) + ")");
                    return;
                }
                else
                {
                    lTarget = GetRangeEndLocation(GetLocation(oTarget), IntToFloat(Random(360)), IntToFloat(Random(10)));
                    AssignCommand(oPC, ActionCastSpellAtLocation(nSpell, lTarget, METAMAGIC_NONE, TRUE,PROJECTILE_PATH_TYPE_DEFAULT,TRUE));
                }
            }
            oTarget = GetNextObjectInShape(SHAPE_SPELLCONE, 30.0, lEndRangeLocation, TRUE, OBJECT_TYPE_CREATURE);
        }
    }
}

location GetRangeEndLocation(location lCurrent,float fDirection,float fDistance,float fOffFacing = 0.0,float fOffZ = 0.0f)
{
    vector vThrow = fDistance *VectorNormalize( AngleToVector(fDirection));
    vThrow.z += fOffZ;
    return Location( GetAreaFromLocation( lCurrent), GetPositionFromLocation( lCurrent) +vThrow, GetFacingFromLocation( lCurrent) + fOffFacing);
}
