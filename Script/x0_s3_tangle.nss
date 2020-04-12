

#include "qx_inc_spells"

void main()
{
    int nSpell = GetSpellId();

    //SendMessageToPC(GetLastSpellCaster(), "Sonic Grenade");
    AssignCommand(OBJECT_SELF, PlaySound("explosion1"));
    DoGrenadeQX(nSpell, d12(4), VFX_FNF_SOUND_BURST, VFX_FNF_SOUND_BURST,DAMAGE_TYPE_SONIC,RADIUS_SIZE_LARGE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
}


