#include "nw_i0_tool"
#include "x0_i0_partywide"
void ResetMission(object oNPC)
{
SetLocalInt(oNPC, "MISSION_TIME", 0);
}
void main()
{
    SetLocalInt(GetModule(), "MISSION_AREA_"+IntToString(GetLocalInt(GetPCSpeaker(), "MISSION_PLANET")), FALSE);
    // Give the speaker some gold
    RewardPartyGP(1000, GetPCSpeaker());

    // Give the speaker some XP
    RewardPartyXP(500, GetPCSpeaker());

    // Set the variables
    SetLocalIntOnAll(GetPCSpeaker(), "MISSION_COMPLETE", 0);
    SetLocalIntOnAll(GetPCSpeaker(), "MISSION_PLANET", 0);

object oTarget = GetLocalObject(OBJECT_SELF, "MISSION_TARGET");
DestroyObject(oTarget);
SetLocalInt(OBJECT_SELF, "MISSION_TIME", 1);
DelayCommand(420.0, ResetMission(OBJECT_SELF));
}
