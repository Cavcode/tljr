// Sets the material to be dyed to skin
#include "tlr_include"

void main()
{
    object oPC = GetPCSpeaker();
    int iMaterialToDye = COLOR_CHANNEL_SKIN;

    SetLocalInt(OBJECT_SELF, "MaterialToDye", iMaterialToDye);

    int iColor = GetColor(OBJECT_SELF, COLOR_CHANNEL_SKIN);

    SendMessageToPC(oPC, "Current Color: " + SkinColor(iColor));
}
