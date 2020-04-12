#include "x0_i0_partywide"
void main()
{
    int nValue = GetLocalInt(OBJECT_SELF, "MISSION_AMOUNT");
    int nAmnt = nValue*4/1000;
    int nDif = GetLocalInt(GetPCSpeaker(), "CONVO_DC");
    if (nDif == 1)
        {
        nAmnt = nValue*16/1000;
        }
    else if (nDif == 2)
        {
        nAmnt = nValue*4/100;
        }
    //SetLocalStringOnAll(GetPCSpeaker(), "DIPLO_MISSION", "SUCCEED");
    //SetLocalIntOnAll(GetPCSpeaker(), "DIPLO_REWARD", nAmnt);
    SetLocalString(GetPCSpeaker(), "DIPLO_MISSION", "SUCCEED");
    object oItem = CreateItemOnObject("pug_ngo_contract", GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(), "DIPLO_REWARD", nAmnt);
}
