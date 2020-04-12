
#include "qx_inc_spells"

void main()
{
    int nSpell = GetSpellId();

    //SendMessageToPC(GetLastSpellCaster(), "Cryoban Grenade");
    DoGrenadeQX(nSpell, d2(15), VFX_IMP_PULSE_COLD, VFX_FNF_MYSTICAL_EXPLOSION,DAMAGE_TYPE_COLD,RADIUS_SIZE_HUGE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
}

