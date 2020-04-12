#include "x0_i0_partywide"
void main()
{
object oPC = GetPCSpeaker();
object oItem = GetItemPossessedBy(oPC, "pug_ngo_contract");
int nPrize = GetLocalInt(oPC, "DIPLO_REWARD");
if (GetLocalString(GetPCSpeaker(), "DIPLO_MISSION") == "SUCCEED")
    {
    SetCustomToken(9009336 ,"Capital! Here is your pay. Come and see me when you are up to another task.");
    }
else if (GetLocalString(GetPCSpeaker(), "DIPLO_MISSION") == "FAIL")
    {
    SetCustomToken(9009336 ,"Well you could have tried a little harder. Take this and leave me.");
    }
SetLocalInt(OBJECT_SELF, "MISSION_ISSUED", FALSE);
SetLocalString(oPC, "DIPLO_MISSION", "");
GiveGoldToCreature(oPC, nPrize);
GiveXPToAll(oPC, nPrize/2);
DestroyObject(GetLocalObject(OBJECT_SELF, "MISSION_MAN"));
DestroyObject(oItem);
SetLocalInt(GetPCSpeaker(), "DIPLO_REWARD", 0);
}
