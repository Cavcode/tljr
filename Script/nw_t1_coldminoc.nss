// Overriding Minor Cold Trap
//
// Proximity Alert Trap

#include "qx_inc_spells"

void main()
{
    //Declare major variables
    int bValid;
    object oTarget = GetEnteringObject();
    object oPC;
    location lTarget = GetLocation(oTarget);
    int nSpell = GetSpellId();

    AssignCommand(oTarget, PlaySound("grenadefire1"));

    //oPC = GetLocalObject(OBJECT_SELF, "OWNER");

    oPC = GetTrapCreator(OBJECT_SELF);

    if(GetIsObjectValid(oPC))
    {
        SendMessageToPC(oPC,"<cþ  >" + "** Proximity Alert Mine triggered **");
    }
}

