#include "qx_ship_stat_inc"
#include "qx_ship_stat_fnc"
#include "qx_ship_funcs"

void main()
{
    int nSpell = 1307;
    object oTarget;
    object oPC = OBJECT_SELF;
    location lMyLocation = GetLocation(oPC);
    vector vPC = GetPosition(oPC);
    location lEndRangeLocation = GetRangeEndLocation(lMyLocation, GetFacing(oPC), 30.0);
    string sCanFire = "CAN_FIRE1";
    int bCanFire = GetLocalInt(oPC, sCanFire);

    float fDelay;
    float fDelay1;

    if (!GetIsShip(oPC))
    {
        SendMessageToPC(oPC, sRedText + "*You must be piloting a starship or manning the gunners chair of a starship to use this feat*");
        return;
    }

    // My Ship
    struct ShipStatsBasicStruct myship = GetShipStatsBasicStruct(oPC);
    int nMyPilotSkill = GetSkillRank(SKILL_PILOT, oPC);
    int nMyAccuracy = FloatToInt((nMyPilotSkill * PILOT_ACCURACY_MULTIPIER) +
                        myship.nAccuracy + myship.nWeapon1Accuracy);
    int nShape = myship.nWeapon1SpellShape;
    int bSphere;

    if (nShape == SHAPE_SPHERE)
    {
        bSphere = TRUE;
        nShape = SHAPE_SPELLCONE;
    }

    int nDamage;
    effect eDamage;

    switch (myship.nWeapon1Projectile)
    {
        case 1: nSpell = SPELL_SHIP_LASER_SINGLE_RED; break;
        case 2: nSpell = SPELL_SHIP_LASER_SINGLE_GREEN; break;
        case 3: nSpell = SPELL_SHIP_LASER_DUAL_RED; break;
        case 4: nSpell = SPELL_SHIP_LASER_DUAL_GREEN; break;
        default: nSpell = SPELL_SHIP_LASER_SINGLE_RED; break;
    }

    // The Target Ship
    struct ShipStatsBasicStruct targetship;
    int nTargetPilotSkill;
    int nTargetEvasion;
    location lTarget;

    int nAccuracyRoll;
    int nEvasionRoll;
    int nCriticalRoll;
    int bContinue = TRUE; // Loop Breaker!

    if (myship.nWeapon1Capacity > 0)
    {
        if (bCanFire)
        {
            AssignCommand(oPC, ClearAllActions());
            //SetCommandable(TRUE, oPC);
            //SendMessageToPC(oPC, "Shooting Lasers");
            //Declare the spell shape, size and the location.  Capture the first target object in the shape.
            //oTarget = GetFirstObjectInShape(SHAPE_SPELLCYLINDER, 20.0, lTargetLocation, TRUE, OBJECT_TYPE_CREATURE);
            oTarget = GetFirstObjectInShape(nShape, 30.0, lEndRangeLocation, TRUE, OBJECT_TYPE_CREATURE, vPC);
            //object oTesting = CreateObject(OBJECT_TYPE_PLACEABLE,"zep_lightshft001",lShooterLocation, FALSE, GetName(oPC) + "testing");
            //Cycle through the targets within the spell shape until an invalid object is captured.
            if (GetIsObjectValid(oTarget))
            {
                while(GetIsObjectValid(oTarget) && bContinue)
                {
                    //if (GetIsReactionTypeHostile(oTarget,oPC) == TRUE)
                    //if (GetIsEnemy(oTarget,oPC) == TRUE)
                    if (oTarget != oPC)
                    {
                        targetship = GetShipStatsBasicStruct(oTarget);
                        nTargetPilotSkill = GetSkillRank(SKILL_PILOT, oTarget);
                        nTargetEvasion = FloatToInt((nTargetPilotSkill * PILOT_EVASION_MULTIPIER) +
                                            targetship.nEvasion);
                        nCriticalRoll = d20(); // IMPLEMENT SHIP DAMAGE
                        nAccuracyRoll = d100();
                        SendMessageToPC(oPC, "Target Acquired: " + GetName(oTarget));
                        fDelay = GetDistanceBetween(OBJECT_SELF, oTarget)/10.0;
                        fDelay1 = fDelay/(3.0 * log(fDelay) + 2.0);
                        if(nAccuracyRoll <= nMyAccuracy)
                        {
                            SendMessageToPC(oPC, "Accuracy: " + IntToString(nMyAccuracy) + "%");
                            nEvasionRoll = d100();
                            if (nEvasionRoll <= nTargetEvasion)
                            {
                                FloatingTextStringOnCreature(sRedText + "Attack Deflected/Evaded", oPC, FALSE);
                                FloatingTextStringOnCreature(sGreenText + "Evasion: " + IntToString(nTargetEvasion) + "%, Attack Deflected/Evaded", oTarget, FALSE);
                                nDamage = 0;
                            }
                            else
                            {
                                FloatingTextStringOnCreature(sGreenText + "Hit", oPC, FALSE);
                                FloatingTextStringOnCreature(sRedText + "Hit", oTarget, FALSE);
                                nDamage = d10(myship.nWeapon1Damage);
                                eDamage = EffectDamage(nDamage, DAMAGE_TYPE_FIRE);
                            }
                        }
                        else
                        {
                            FloatingTextStringOnCreature(sRedText + "Miss", oPC, FALSE);
                            nDamage = 0;
                        }

                        if(nDamage > 0)
                        {
                            //SendMessageToPC(oPC, "Hit: " + IntToString(nDamage));
                            AssignCommand(oPC, ActionCastSpellAtObject(nSpell, oTarget, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT,TRUE));
                            //AssignCommand(oPC, ActionCastFakeSpellAtObject(nSpell, oTarget));
                            DelayCommand(fDelay1,  ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
                            //SendMessageToPC(oPC, "Hit: (" + IntToString(nRoll) + " + " + IntToString(nAttack) + " = " + IntToString(nRoll + nAttack) + ")");
                            bContinue = FALSE;
                            SetLocalInt(oPC, sCanFire, FALSE);
                        }
                        else
                        {
                            lTarget = GetRangeEndLocation(GetLocation(oTarget), IntToFloat(-2 + Random(5)), IntToFloat(Random(5)));
                            AssignCommand(oPC, ActionCastSpellAtLocation(nSpell, lTarget, METAMAGIC_NONE, TRUE,PROJECTILE_PATH_TYPE_DEFAULT,TRUE));
                        }
                    }
                    oTarget = GetNextObjectInShape(nShape, 30.0, lEndRangeLocation, TRUE, OBJECT_TYPE_CREATURE, vPC);
                }// end loop
                if (bSphere && bContinue)
                {
                    oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(oPC), TRUE, OBJECT_TYPE_CREATURE, vPC);
                    //object oTesting = CreateObject(OBJECT_TYPE_PLACEABLE,"zep_lightshft001",lShooterLocation, FALSE, GetName(oPC) + "testing");
                    //Cycle through the targets within the spell shape until an invalid object is captured.
                    if (GetIsObjectValid(oTarget))
                    {
                        while(GetIsObjectValid(oTarget) && bContinue)
                        {
                            //if (GetIsReactionTypeHostile(oTarget,oPC) == TRUE)
                            //if (GetIsEnemy(oTarget,oPC) == TRUE)
                            if (oTarget != oPC)
                            {
                                targetship = GetShipStatsBasicStruct(oTarget);
                                nTargetPilotSkill = GetSkillRank(SKILL_PILOT, oTarget);
                                nTargetEvasion = FloatToInt((nTargetPilotSkill * PILOT_EVASION_MULTIPIER) +
                                                    targetship.nEvasion);
                                nCriticalRoll = d20(); // IMPLEMENT SHIP DAMAGE
                                nAccuracyRoll = d100();

                                SendMessageToPC(oPC, "Target Acquired: " + GetName(oTarget));
                                fDelay = GetDistanceBetween(OBJECT_SELF, oTarget)/10.0;
                                fDelay1 = fDelay/(3.0 * log(fDelay) + 2.0);
                                if(nAccuracyRoll <= nMyAccuracy)
                                {
                                    SendMessageToPC(oPC, "Accuracy: " + IntToString(nMyAccuracy) + "%");
                                    nEvasionRoll = d100();
                                    if (nEvasionRoll <= nTargetEvasion)
                                    {
                                        FloatingTextStringOnCreature(sRedText + "Attack Deflected/Evaded", oPC, FALSE);
                                        FloatingTextStringOnCreature(sGreenText + "Evasion: " + IntToString(nTargetEvasion) + "%, Attack Deflected/Evaded", oTarget, FALSE);
                                        nDamage = 0;
                                    }
                                    else
                                    {
                                        FloatingTextStringOnCreature(sGreenText + "Hit", oPC, FALSE);
                                        FloatingTextStringOnCreature(sRedText + "Hit", oTarget, FALSE);
                                        nDamage = d10(myship.nWeapon1Damage);
                                        eDamage = EffectDamage(nDamage, DAMAGE_TYPE_FIRE);
                                    }
                                }
                                else
                                {
                                    FloatingTextStringOnCreature(sRedText + "Miss", oPC, FALSE);
                                    nDamage = 0;
                                }

                                if(nDamage > 0)
                                {
                                    //SendMessageToPC(oPC, "Hit: " + IntToString(nDamage));
                                    AssignCommand(oPC, ActionCastSpellAtObject(nSpell, oTarget, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT,TRUE));
                                    //AssignCommand(oPC, ActionCastFakeSpellAtObject(nSpell, oTarget));
                                    DelayCommand(fDelay1,  ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
                                    //SendMessageToPC(oPC, "Hit: (" + IntToString(nRoll) + " + " + IntToString(nAttack) + " = " + IntToString(nRoll + nAttack) + ")");
                                    bContinue = FALSE;
                                    SetLocalInt(oPC, sCanFire, FALSE);
                                }
                                else
                                {
                                    lTarget = GetRangeEndLocation(GetLocation(oTarget), IntToFloat(-2 + Random(5)), IntToFloat(Random(5)));
                                    AssignCommand(oPC, ActionCastSpellAtLocation(nSpell, lTarget, METAMAGIC_NONE, TRUE,PROJECTILE_PATH_TYPE_DEFAULT,TRUE));
                                    bContinue = FALSE;
                                }
                            }
                            oTarget = GetNextObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(oPC), TRUE, OBJECT_TYPE_CREATURE, vPC);
                        }// end loop
                    }
                }
            }
            else
            {
                if (bContinue)
                {
                    // Fire lasers at random location
                    AssignCommand(oPC, ActionCastSpellAtLocation(nSpell, lEndRangeLocation, METAMAGIC_NONE, TRUE,PROJECTILE_PATH_TYPE_DEFAULT,TRUE));
                    SetLocalInt(oPC, sCanFire, FALSE);
                }
            }
            myship.nWeapon1Capacity = myship.nWeapon1Capacity - 1;
            FloatingTextStringOnCreature(sYellowText + IntToString(myship.nWeapon1Capacity) + " shots remaining", oPC, FALSE);
            SetShipStatsBasic(oPC, myship);
        }
        else
        {
            SendMessageToPC(oPC, sYellowText + "Ship Primary Weapon: Charging...");
        }
        DelayCommand(6.0/IntToFloat(myship.nWeapon1Rate),SetLocalInt(oPC, sCanFire, TRUE));
        //SetCommandable(FALSE, oPC);
        //DelayCommand(1.0/IntToFloat(myship.nWeapon1Rate),SetCommandable(TRUE, oPC));
    }
    else
    {
        SendMessageToPC(oPC, sRedText + "*Ship Primary Weapon: Ammunition Exhausted*");
    }
}


