#include "x0_i0_partywide"
void main()
{
    int nValue = GetLocalInt(OBJECT_SELF, "MISSION_AMOUNT");
    int nAmnt = FloatToInt(nValue*0.05);

    SetLocalString(GetPCSpeaker(), "DIPLO_MISSION", "SUCCEED");
    SetLocalInt(GetPCSpeaker(), "DIPLO_REWARD", nAmnt);
}
