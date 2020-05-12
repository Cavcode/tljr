// Overriding Minor Spike Trap
//
// Turret/Generic Custom Traps

#include "qx_inc_spells"

void main()
{
    // NOT YET IMPLEMENTED
    object oTarget = GetEnteringObject();
    location lTarget = GetLocation(oTarget);
    object oPC = GetTrapCreator(OBJECT_SELF);

    //Declare major variables
    //int bValid;
    //object oTarget = GetEnteringObject();
    //location lTarget = GetLocation(oTarget);
    //int nSpell = GetSpellId();

    //int nDamage = GetLocalInt(OBJECT_SELF, TRAP_DAMAGE) * 5;

    //if (nDamage == 0)
    //{
    //    nDamage = 10;
    //}

    //AssignCommand(OBJECT_SELF, PlaySound("explosion4"));
    //DoGrenadeQX(nSpell, d2(nDamage), VFX_IMP_FLAME_M, VFX_FNF_FIREBALL,DAMAGE_TYPE_FIRE,RADIUS_SIZE_MEDIUM, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
}

