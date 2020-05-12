#include "x2_inc_compon"
#include "x0_i0_spawncond"
#include "pug_inc"

void main()
{
    object oKiller = GetLastKiller();
    //GiveXPToCreature(oKiller, 300);
   // SetLocalInt(GetArea(OBJECT_SELF), GetTag(OBJECT_SELF), TRUE);
    //DelayCommand(70.0, DefenderDeath(GetTag(OBJECT_SELF), GetResRef(OBJECT_SELF), "Empire", GetTag(GetArea(OBJECT_SELF))));

    //DelayCommand(10.0, NewDefender(GetTag(OBJECT_SELF), GetLocation(OBJECT_SELF), OBJECT_SELF));
    CreateObject(OBJECT_TYPE_PLACEABLE, "deadsoldier", GetLocation(OBJECT_SELF), FALSE, GetTag(OBJECT_SELF));
    //AssignCommand(oSpawn, ActionJumpToLocation(GetLocation(GetWaypointByTag("DEAD_EMPIRE"))));

    ExecuteScript("sf_xp", OBJECT_SELF);
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
}
