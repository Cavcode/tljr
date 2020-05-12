#include "x3_inc_skin"

void main() {
    object oPC = GetEnteringObject();
    int nScalePercent = GetSkinInt(oPC, "SCALE");
    if (nScalePercent != 0) {
        SetObjectVisualTransform(oPC, OBJECT_VISUAL_TRANSFORM_SCALE, nScalePercent * 0.01);
    }
    else
    {
        SendMessageToPC(oPC,"height 100 set");
        SetSkinInt(oPC, "SCALE", 100);
    }
}


