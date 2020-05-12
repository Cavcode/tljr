//::///////////////////////////////////////////////
//:: FileName qx_obj_setmale
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Quix
//:: Created On: 2/16/2009 9:01:41 PM
//:://////////////////////////////////////////////
#include "pug_inc"
#include "nwnx_creature"

void main()
{
    object oPC = GetPCSpeaker();
    object oNPC = GetLocalObject(oPC,"OBJECT_BEING_EDITED");
    if (GetIsObjectValid(oNPC) == TRUE)
    {
        // impossible to modify gender!
    }
    else
    {
        SendMessageToPC(oPC, "Unable to set the gender for target.");
    }
}
