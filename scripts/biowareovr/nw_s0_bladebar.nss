//::///////////////////////////////////////////////
//:: Blade Barrier
//:: NW_S0_BladeBar.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a wall 10m long and 2m thick of whirling
    blades that hack and slice anything moving into
    them.  Anything caught in the blades takes
    2d6 per caster level.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 20, 2001
//:://////////////////////////////////////////////

void DecrementBlades(object oPC);

#include "x2_inc_spellhook"

void main()
{

/*
  Spellcast Hook Code
  Added 2003-06-20 by Georg
  If you want to make changes to all spells,
  check x2_inc_spellhook.nss to find out more

*/

    if (!X2PreSpellCastCode())
    {
    // If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    }

// End of Spell Cast Hook


    //Declare major variables including Area of Effect Object
    effect eAOE = EffectAreaOfEffect(AOE_PER_WALLBLADE);
    location lTarget = GetSpellTargetLocation();
    int nDuration = GetCasterLevel(OBJECT_SELF);
    float fSeconds;
    int nMetaMagic = GetMetaMagicFeat();
    int nCount = GetLocalInt(OBJECT_SELF, "BLADEBARRIER");
    //Check Extend metamagic feat.
    if (nMetaMagic == METAMAGIC_EXTEND)
    {
       nDuration = nDuration *2;    //Duration is +100%
    }
    //Create an instance of the AOE Object using the Apply Effect function

    if (nDuration >= 15)
    {
        nDuration = 15;
    }

    fSeconds = RoundsToSeconds(nDuration)/2;

    if (nCount >= 3) //Max number of blade traps
    {
        SendMessageToPC(OBJECT_SELF, "You are out of blade traps... Quick, make some more!");
    }
    else
    {
        SetLocalInt(OBJECT_SELF, "BLADEBARRIER", nCount + 1);
        DelayCommand(RoundsToSeconds(nDuration), DecrementBlades(OBJECT_SELF));
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, fSeconds);
    }
}

void DecrementBlades(object oPC)
{
    int nBlades = GetLocalInt(OBJECT_SELF, "BLADEBARRIER");
    SetLocalInt(OBJECT_SELF, "BLADEBARRIER", nBlades - 1);
}
