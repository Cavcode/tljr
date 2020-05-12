#include "nwnx_creature"
void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC,"GY_ReallyResting",TRUE);
    AssignCommand(oPC,ClearAllActions());
    AssignCommand(oPC,ActionRest());
    NWNX_Creature_SetMovementRate(oPC, NWNX_CREATURE_MOVEMENT_RATE_PC);
}

