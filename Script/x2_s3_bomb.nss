

#include "qx_inc_spells"

void main()
{
    int nSpell = GetSpellId();
    object oPC = OBJECT_SELF;

    if (nSpell == 745) // Ion Grenade
    {
         DoGrenadeQX(nSpell, d2(40), VFX_COM_HIT_ELECTRICAL, VFX_FNF_ELECTRIC_EXPLOSION,DAMAGE_TYPE_ELECTRICAL,RADIUS_SIZE_LARGE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    }
    else if (nSpell == 744) // Thermal Detonator
    {
         float fDelay = 1.0;
         DelayCommand(fDelay,AssignCommand(oPC, PlaySound("explosion1")));
         DelayCommand(0.3 + fDelay,AssignCommand(oPC, PlaySound("explosion1")));
         DelayCommand(0.6 + fDelay,AssignCommand(oPC, PlaySound("explosion4")));
         DelayCommand(0.9 + fDelay,AssignCommand(oPC, PlaySound("explosion1")));
         DelayCommand(1.2 + fDelay,AssignCommand(oPC, PlaySound("explosion1")));
         //DelayCommand(fDelay,DoGrenadeThermalDetonator(d12(12),d12(10), VFX_IMP_FLAME_M, 464,DAMAGE_TYPE_FIRE,RADIUS_SIZE_COLOSSAL, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE));
         DelayCommand(fDelay,DoGrenadeQX(nSpell, d2(200), VFX_IMP_FLAME_M, 464,DAMAGE_TYPE_FIRE,RADIUS_SIZE_COLOSSAL, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE));
         DelayCommand(fDelay,ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(AOE_PER_FOGFIRE), GetSpellTargetLocation(), RoundsToSeconds(2)));
    }
}

