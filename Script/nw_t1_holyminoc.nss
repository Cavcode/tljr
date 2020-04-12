// Overriding Minor Holy Trap
//
// CryoBan Trap

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

    DoExplosiveMineQX(lTarget, nSpell, d2(nDamage), VFX_IMP_PULSE_COLD, VFX_FNF_MYSTICAL_EXPLOSION,DAMAGE_TYPE_COLD,RADIUS_SIZE_HUGE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
}

