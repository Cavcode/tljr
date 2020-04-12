#include "qx_ship_stat_inc"
#include "qx_ship_stat_fnc"
#include "qx_ship_funcs"

void MissileExplosion(struct ShipStatsBasicStruct myship, location lTarget);

void main()
{
    int nSpellID = GetSpellId();
    int nSpell = 1307;
    object oTarget;
    object oPC = OBJECT_SELF;
    location lMyLocation = GetLocation(oPC);
    vector vPC = GetPosition(oPC);
    location lTarget = GetSpellTargetLocation();
    location lEndRangeLocation = GetRangeEndLocation(lMyLocation, GetFacing(oPC), 30.0);
    string sCanFire = "CAN_FIRE2";
    int bCanFire = GetLocalInt(oPC, sCanFire);
    int nAccuracyRoll;

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
                        myship.nAccuracy + myship.nWeapon2Accuracy);

    switch (myship.nWeapon2Projectile)
    {
        case 5: nSpell = SPELL_SHIP_MISSILE_SMALL;
                break;
        case 6: nSpell = SPELL_SHIP_MISSILE_LARGE;
                break;
        case 7: nSpell = SPELL_SHIP_MISSILE_ENERGY;
                break;
        default: nSpell = SPELL_SHIP_MISSILE_SMALL;
                break;
    }

    fDelay = GetDistanceBetweenLocations(lMyLocation, lTarget)/5.0;
    fDelay1 = fDelay/(3.0 * log(fDelay) + 2.0);


    if (nSpellID == 1306)
    {

        if (myship.nWeapon2Capacity > 0)
        {
            if (bCanFire)
            {
                nAccuracyRoll = d100();
                AssignCommand(oPC, ClearAllActions());
                if(nAccuracyRoll <= nMyAccuracy)
                {
                    AssignCommand(oPC, ActionCastSpellAtLocation(nSpell, lTarget, METAMAGIC_NONE, TRUE,PROJECTILE_PATH_TYPE_DEFAULT,TRUE));
                }
                else
                {
                        lTarget = GetRangeEndLocation(GetLocation(oTarget), IntToFloat(-2 + Random(5)), IntToFloat(Random(5)));
                        AssignCommand(oPC, ActionCastSpellAtLocation(nSpell, lTarget, METAMAGIC_NONE, TRUE,PROJECTILE_PATH_TYPE_DEFAULT,TRUE));
                }
                SetLocalInt(oPC, sCanFire, FALSE);

                //DelayCommand(fDelay1, MissileExplosion(myship, lTarget));

                myship.nWeapon2Capacity = myship.nWeapon2Capacity - 1;
                FloatingTextStringOnCreature(sYellowText + IntToString(myship.nWeapon2Capacity) + " shots remaining", oPC, FALSE);
                SetShipStatsBasic(oPC, myship);
            }
            else
            {
                SendMessageToPC(oPC, sYellowText + "Ship Auxiliary Weapon: Loading...");
            }
            DelayCommand(1.0/IntToFloat(myship.nWeapon2Rate),SetLocalInt(oPC, sCanFire, TRUE));
        }
        else
        {
            SendMessageToPC(oPC, sRedText + "*Ship Auxiliary Weapon: Ammunition Exhausted*");
        }
    }
    else
    {
        AssignCommand(oPC, PlaySound("explosion2"));
        MissileExplosion(myship, lTarget);
    }
}

void MissileExplosion(struct ShipStatsBasicStruct myship, location lTarget)
{
    // My Ship
    object oTarget;
    int nSpell;
    int nShape = SHAPE_SPHERE; //myship.nWeapon2SpellShape;
    effect eVis, eVis2;
    float fRadius;
    int nDamage;
    effect eDamage;

    switch (myship.nWeapon2Projectile)
    {
        case 5: nSpell = SPELL_SHIP_MISSILE_SMALL;
                eVis = EffectVisualEffect(VFX_FNF_FIREBALL);
                fRadius = 10.0;
                break;
        case 6: nSpell = SPELL_SHIP_MISSILE_LARGE;
                eVis = EffectVisualEffect(VFX_FNF_FIREBALL);
                fRadius = 15.0;
                break;
        case 7: nSpell = SPELL_SHIP_MISSILE_ENERGY;
                eVis = EffectVisualEffect(VFX_FNF_FIREBALL);
                eVis2 = EffectVisualEffect(VFX_FNF_ELECTRIC_EXPLOSION);
                fRadius = 15.0;
                break;
        default: nSpell = SPELL_SHIP_MISSILE_SMALL;
                eVis = EffectVisualEffect(VFX_FNF_FIREBALL);
                fRadius = 10.0;
                break;
    }

    // The Target Ship
    struct ShipStatsBasicStruct targetship;
    int nTargetPilotSkill;
    int nTargetEvasion;

    int nAccuracyRoll;
    int nEvasionRoll;
    int nCriticalRoll;


    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis, lTarget);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis2, lTarget);

    oTarget = GetFirstObjectInShape(nShape, fRadius, lTarget, TRUE, OBJECT_TYPE_CREATURE);
    //object oTesting = CreateObject(OBJECT_TYPE_PLACEABLE,"zep_lightshft001",lShooterLocation, FALSE, GetName(oPC) + "testing");
    //Cycle through the targets within the spell shape until an invalid object is captured.
    while(GetIsObjectValid(oTarget))
    {
        targetship = GetShipStatsBasicStruct(oTarget);
        nTargetPilotSkill = GetSkillRank(SKILL_PILOT, oTarget);
        nTargetEvasion = FloatToInt((nTargetPilotSkill * PILOT_EVASION_MULTIPIER) +
                            targetship.nEvasion);
        nCriticalRoll = d20(); // IMPLEMENT SHIP DAMAGE
        nAccuracyRoll = d100();

        nEvasionRoll = d100();
        if (nEvasionRoll <= nTargetEvasion)
        {
            FloatingTextStringOnCreature(sGreenText + "Evasion: " + IntToString(nTargetEvasion) + "%, Explosion Deflected/Evaded", oTarget, FALSE);
            nDamage = 0;
        }
        else
        {
            nDamage = d10(myship.nWeapon2Damage);
            eDamage = EffectDamage(nDamage, DAMAGE_TYPE_FIRE);
        }

        if(nDamage > 0)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget);
        }
        oTarget = GetNextObjectInShape(nShape, fRadius, lTarget, TRUE, OBJECT_TYPE_CREATURE);
    }// end loop

}
