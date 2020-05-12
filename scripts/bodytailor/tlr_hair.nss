// Sets the material to be dyed to hair
#include "tlr_include"

void main()
{
    object oPC = GetPCSpeaker();
    int iMaterialToDye = COLOR_CHANNEL_HAIR;

    SetLocalInt(OBJECT_SELF, "MaterialToDye", iMaterialToDye);

    int iColor = GetColor(OBJECT_SELF, COLOR_CHANNEL_HAIR);

    SendMessageToPC(oPC, "Current Color: " + HairColor(iColor));
}
