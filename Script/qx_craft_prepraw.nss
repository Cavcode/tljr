#include "qx_craft_inc"

void main()
{
    object oPC = GetPCSpeaker();
    object oStation = OBJECT_SELF;

    SetLocalInt(oStation, VAR_CRAFT_STATION_STATE, 1);//adding raw materials
    SetLocalObject(oStation, VAR_CRAFT_STATION_PC, oPC);
}
