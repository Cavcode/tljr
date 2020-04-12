

#include "qx_inc_spells"

void main()
{
    int nSpell = GetSpellId();
    //SendMessageToPC(GetLastSpellCaster(), "Frag Grenade");
    AssignCommand(OBJECT_SELF, PlaySound("explosion4"));
    DoGrenadeQX(nSpell, d2(20), VFX_IMP_FLAME_M, VFX_FNF_FIREBALL,DAMAGE_TYPE_FIRE,RADIUS_SIZE_LARGE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
}

