// Overriding Minor Fire Trap
//
// Fragmentation Trap

#include "qx_inc_spells"

void main()
{
    //Declare major variables
    int bValid;
    object oTarget = GetEnteringObject();
    location lTarget = GetLocation(oTarget);
    object oPC = GetTrapCreator(OBJECT_SELF);
    int nSpell = GetSpellId();
    int nDamage;

    if(GetIsObjectValid(oPC))
    {
        nDamage = GetSkillRank(SKILL_SET_TRAP,oPC);
    }
    if (nDamage < 1)
    {
        nDamage = 10;
    }
    AssignCommand(OBJECT_SELF, PlaySound("explosion4"));
    DoExplosiveMineQX(lTarget, nSpell, d2(nDamage), VFX_IMP_FLAME_M, VFX_FNF_FIREBALL,DAMAGE_TYPE_FIRE,RADIUS_SIZE_LARGE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
}

