// Sets the material to be dyed to tattoo2
#include "tlr_include"

void main()
{
    object oPC = GetPCSpeaker();
    int iMaterialToDye = COLOR_CHANNEL_TATTOO_2;

    SetLocalInt(OBJECT_SELF, "MaterialToDye", iMaterialToDye);

    int iColor = GetColor(OBJECT_SELF, COLOR_CHANNEL_TATTOO_2);

    SendMessageToPC(oPC, "Current Color: " + ClothColor(iColor));
}
