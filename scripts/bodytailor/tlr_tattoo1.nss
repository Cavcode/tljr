// Sets the material to be dyed to tattoo1
#include "tlr_include"

void main()
{
    object oPC = GetPCSpeaker();
    int iMaterialToDye = COLOR_CHANNEL_TATTOO_1;

    SetLocalInt(OBJECT_SELF, "MaterialToDye", iMaterialToDye);

    int iColor = GetColor(OBJECT_SELF, COLOR_CHANNEL_TATTOO_1);

    SendMessageToPC(oPC, "Current Color: " + ClothColor(iColor));
}
