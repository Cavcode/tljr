//::///////////////////////////////////////////////
//:: FileName qx_obj_randname
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Quix
//:: Created On: 2/16/2009 9:01:41 PM
//:://////////////////////////////////////////////
#include "pug_inc"
void main()
{
    object oPC = GetPCSpeaker();
    object oNPC = GetLocalObject(oPC,"OBJECT_BEING_EDITED");
    string sName;
    if (GetIsObjectValid(oNPC) == TRUE)
    {
        if (GetGender(oNPC) == GENDER_MALE ||
            GetGender(oNPC) == GENDER_NONE ||
            GetGender(oNPC) == GENDER_OTHER ||
            GetGender(oNPC) == GENDER_BOTH)
        {
            sName = GenerateMaleName();
        }
        else
        {
            sName = GenerateFemaleName();
        }
        sName += GenerateLastName();
        SetName(oNPC,sName);
    }
    else
    {
        SendMessageToPC(oPC, "Unable to generate random name for target.");
    }
}
