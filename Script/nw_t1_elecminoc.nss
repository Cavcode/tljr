// Overriding Minor Electric Trap
//
// Electric Trap

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

    DoExplosiveMineQX(lTarget, nSpell, d2(nDamage), VFX_COM_HIT_ELECTRICAL, VFX_FNF_ELECTRIC_EXPLOSION,DAMAGE_TYPE_ELECTRICAL,RADIUS_SIZE_LARGE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
}

