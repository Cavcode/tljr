//:://////////////////////////////////////////////////
//:: NW_C2_DEFAULT7
/*
  Default OnDeath event handler for NPCs.

  Adjusts killer's alignment if appropriate and
  alerts allies to our death.
 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/22/2002
//:://////////////////////////////////////////////////

#include "x2_inc_compon"
#include "x0_i0_spawncond"
#include "pug_inc"

void main()
{
    int nClass = GetLevelByClass(CLASS_TYPE_COMMONER);
    int nAlign = GetAlignmentGoodEvil(OBJECT_SELF);
    object oKiller = GetLastKiller();
    string sTag     = GetTag(OBJECT_SELF);
    float fHP       = IntToFloat(GetCurrentHitPoints());
    float fMaxHP    = IntToFloat(GetMaxHitPoints());
    object oCorpse = OBJECT_SELF;

    // CUSTOM XP SYSTEM: Edit "sf_xp" script constants to modify behavior
    // Module XP Slider Must be set to ZERO!!!
    ExecuteScript("sf_xp", OBJECT_SELF);

    // Gib target if massive damage is caused
    if (fHP < fMaxHP - (fMaxHP * 4.00)){
        //ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE, FALSE), OBJECT_SELF);
    }
    // Otherwise leave a corpse
    else {
        // Prevent corpse fading.
        SetIsDestroyable(FALSE, FALSE, FALSE);

        // Create a corpse dummy.
        oCorpse      = CreateObject(OBJECT_TYPE_PLACEABLE, "prop_corpse", GetLocation(OBJECT_SELF), FALSE, sTag);
        object oGib         = CreateObject(OBJECT_TYPE_PLACEABLE, "prop_holder", GetLocation(OBJECT_SELF));
        SetLocalObject(OBJECT_SELF, "gib", oGib);
        DestroyObject(oCorpse, 300.0);
        DestroyObject(oGib, 300.0);
    }

    // If we're a good/neutral commoner,
    // adjust the killer's alignment evil
    if(nClass > 0 && (nAlign == ALIGNMENT_GOOD || nAlign == ALIGNMENT_NEUTRAL))
    {
        AdjustAlignment(oKiller, ALIGNMENT_EVIL, 5);
    }

    // Call to allies to let them know we're dead
    SpeakString("NW_I_AM_DEAD", TALKVOLUME_SILENT_TALK);

    //Shout Attack my target, only works with the On Spawn In setup
    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);

    // NOTE: the OnDeath user-defined event does not
    // trigger reliably and should probably be removed
    if(GetSpawnInCondition(NW_FLAG_DEATH_EVENT))
    {
         SignalEvent(OBJECT_SELF, EventUserDefined(1007));
    }
    craft_drop_items(oKiller);

    DeathLoot(GetLocation(OBJECT_SELF), GetTag(OBJECT_SELF));
    DelayCommand(58.0, SetIsDestroyable(TRUE, FALSE, FALSE));
    DelayCommand(60.0, DestroyObject(OBJECT_SELF));
}
