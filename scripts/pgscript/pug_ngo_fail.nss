#include "x0_i0_partywide"
void main()
{
    // Set the variables
    //SetLocalStringOnAll(GetPCSpeaker(), "DIPLO_MISSION", "FAIL");
    //SetLocalIntOnAll(GetPCSpeaker(), "DIPLO_REWARD", 50);
    SetLocalString(GetPCSpeaker(), "DIPLO_MISSION", "FAIL");
    object oItem = CreateItemOnObject("pug_ngo_contract", GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(), "DIPLO_REWARD", 50);
}
