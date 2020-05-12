#include "x0_i0_partywide"
void main()
{
object oPC = GetPCSpeaker();

if (GetIsObjectValid(oPC) == TRUE)
    {
    SetLocalIntOnAll(oPC, "MISSION_COMPLETE", TRUE);
    FloatingTextStringOnCreature("Data transfer successful", oPC, TRUE);
    }
}
