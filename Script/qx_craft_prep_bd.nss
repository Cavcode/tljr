#include "qx_craft_inc"

void main()
{
    object oPC = GetPCSpeaker();
    object oStation = OBJECT_SELF;

    SetLocalInt(oStation, VAR_CRAFT_STATION_STATE, 3);//adding items to breakdown
    SetLocalObject(oStation, VAR_CRAFT_STATION_PC, oPC);
}
