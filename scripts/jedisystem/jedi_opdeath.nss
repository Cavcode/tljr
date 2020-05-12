#include "jedi_functions"
void main()
{
    //object oPC = GetLastPlayerDied();
    object oPC = OBJECT_SELF;

    if(GetIsObjectValid(oPC) && GetIsDead(oPC) && GetNiveauForce(oPC) > 0) {
        SetCommandable(TRUE,oPC);
        DesactiverFormeCombatActive(oPC);
        DesactiverDivination(oPC);
        DesactiverSentirVieActive(oPC);
        DesactiverTranseCombat(oPC);
        StopTelepathie(oPC);
    }
}
