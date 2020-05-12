#include "x3_inc_skin"

void main() {
    object oPC = GetPCSpeaker();
    //scale character to 110% of normal size
    int nScalePercent = GetSkinInt(oPC, "SCALE");
    if (nScalePercent != 0)
    {
        if(nScalePercent <= 115)
        {
            SetObjectVisualTransform(oPC, OBJECT_VISUAL_TRANSFORM_SCALE, nScalePercent * 0.01);
            nScalePercent+=1;
            SetSkinInt(oPC,"SCALE", nScalePercent);
        }
        else
        {
            SendMessageToPC(oPC,"Sorry, you can't be -that- big brah!");
        }
    }
    else
    {
        SetSkinInt(oPC,"SCALE", 100);
    }
}

