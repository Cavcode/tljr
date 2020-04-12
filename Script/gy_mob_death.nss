//:://////////////////////////////////////////////////
//:: NW_C2_DEFAULT7
/*
  OnDeath event handler for Mobs.
  Allies will run away if of same tag

 */

#include "x2_inc_compon"
#include "x0_i0_spawncond"

void main()
{
    location lLoc = GetLocation(OBJECT_SELF);
    string sTag = GetTag(OBJECT_SELF);
    string sTestTag;
    effect eFear = EffectFrightened();
    object oTestCreature = GetFirstObjectInShape(SHAPE_SPHERE,10.0,lLoc,TRUE);
    while (GetIsObjectValid(oTestCreature))
    {
         sTestTag = GetTag(oTestCreature);
         if (sTestTag == sTag)
         {
            AssignCommand(oTestCreature,ClearAllActions(TRUE));
            //AssignCommand(oTestCreature,ActionMoveAwayFromLocation(lLoc,TRUE,20.0));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eFear,oTestCreature,10.0);
         }
         oTestCreature = GetNextObjectInShape(SHAPE_SPHERE,10.0,lLoc,TRUE);
    }






    int nClass = GetLevelByClass(CLASS_TYPE_COMMONER);
    int nAlign = GetAlignmentGoodEvil(OBJECT_SELF);
    object oKiller = GetLastKiller();

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
//    craft_drop_items(oKiller);
}
