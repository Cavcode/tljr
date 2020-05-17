#include "NW_I0_SPELLS"
#include "x2_inc_spellhook"

void shoot(object oTarget, object oShooter, int nSpell);

void main()
{

/*
  Spellcast Hook Code
  Added 2003-06-23 by GeorgZ
  If you want to make changes to all spells,
  check x2_inc_spellhook.nss to find out more

*/

    if (!X2PreSpellCastCode())
    {
    // If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    }

// End of Spell Cast Hook
    object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
    if ((GetBaseItemType(oItem) == BASE_ITEM_LONGBOW) || (GetBaseItemType(oItem) == BASE_ITEM_SHORTBOW) ||
            (GetBaseItemType(oItem) == BASE_ITEM_LIGHTCROSSBOW) || (GetBaseItemType(oItem) == BASE_ITEM_HEAVYCROSSBOW) ||
            (GetBaseItemType(oItem) == BASE_ITEM_SLING))
    {
    //Declare major variables
    //int nSpell = GetSpellId();
    int nSpell = 1559;
    object oTarget = GetSpellTargetObject();
    location lTargetLocation = GetSpellTargetLocation();
    object oPC = OBJECT_SELF;
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
    //Declare the spell shape, size and the location.  Capture the first target object in the shape.
    oTarget = GetFirstObjectInShape(SHAPE_SPELLCONE, 20.0, lTargetLocation, TRUE, OBJECT_TYPE_CREATURE);
    object oShooter = CreateObject(OBJECT_TYPE_PLACEABLE,"traffic_shooter",lShooterLocation, FALSE, GetName(oPC) + "shooter");
    //object oTesting = CreateObject(OBJECT_TYPE_PLACEABLE,"zep_lightshft001",lShooterLocation, FALSE, GetName(oPC) + "testing");
    //Cycle through the targets within the spell shape until an invalid object is captured.
    while(GetIsObjectValid(oTarget) && nCounter < 6)
    {
        //if (spellsIsTarget(oTarget, SPELL_TARGET_STANDARDHOSTILE, OBJECT_SELF))
        if (oTarget != oPC)
        {
            nCounter = nCounter + 1;
            nRoll = d20(1);
            nAttack = GetBaseAttackBonus(oPC);
            nDefense = GetAC(oTarget);
            if (nAttack + nRoll >= nDefense)
            //ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(357, bHit),oTarget);
                //Fire cast spell at event for the specified target
                //SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_CONE_OF_COLD));
                //Get the distance between the target and caster to delay the application of effects
                fDelay = GetDistanceBetween(OBJECT_SELF, oTarget)/10.0;
                //Make SR check, and appropriate saving throw(s).
                fDelay1 = fDelay/(3.0 * log(fDelay) + 2.0);
                    //Detemine damage
                if (nCounter > 1)
                {
                    DelayCommand(fDelay1,shoot(oTarget,oShooter, nSpell));
                    //DelayCommand(1.0, AssignCommand(oShooter, ActionCastSpellAtObject(nSpell, oTarget, METAMAGIC_ANY, TRUE,0,PROJECTILE_PATH_TYPE_ACCELERATING, TRUE)));
                    //DelayCommand(1.0, AssignCommand(oShooter, ActionCastSpellAtObject(nSpell, oTarget, METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_BALLISTIC, TRUE)));
                }
                nDamage = d10(2);
                    //Adjust damage according to Reflex Save, Evasion or Improved Evasion
                    //nDamage = GetReflexAdjustedDamage(nDamage, oTarget, GetSpellSaveDC(), SAVING_THROW_TYPE_COLD);

                    // Apply effects to the currently selected target.
                    if(nDamage > 0)
                    {
                        effect eDam = EffectDamage(nDamage, DAMAGE_TYPE_NEGATIVE);
                        DelayCommand(fDelay1,  ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                        SendMessageToPC(oPC, "Hit: (" + IntToString(nRoll) + " + " + IntToString(nAttack) + " = " + IntToString(nRoll + nAttack) + ")");
                    }
            }
        //Select the next target within the spell shape.
            oTarget = GetNextObjectInShape(SHAPE_SPELLCONE, 20.0, lTargetLocation, TRUE, OBJECT_TYPE_CREATURE);
        }
        DelayCommand(15.0,DestroyObject(oShooter));
    }
    else
    {
        SendMessageToPC(OBJECT_SELF, "You must have a blaster equipped to use this ability.");
    }
}


void shoot(object oTarget, object oShooter, int nSpell)
{
    //AssignCommand(oShooter, ActionCastSpellAtObject(nSpell, oTarget, METAMAGIC_ANY, TRUE,0,PROJECTILE_PATH_TYPE_ACCELERATING, TRUE));
    AssignCommand(oShooter, ActionCastFakeSpellAtObject(nSpell, oTarget, PROJECTILE_PATH_TYPE_ACCELERATING));
}
