#include "pug_inc"
void main()
{
object oPC = GetPCSpeaker();
//int nPenalty = GetLocalInt(oPC, "REVIVE_PENALTY");

SetLocalInt(oPC, "REST", TRUE);
AssignCommand(oPC, ClearAllActions(TRUE));
AssignCommand(oPC, ActionRest(TRUE));
/*if (nPenalty > 0)
    {
    ApplyRevivePenalty(oPC, FALSE);
    DelayCommand(20.0 , ApplyRevivePenalty(oPC, FALSE));
    } */

DelayCommand(2.0 , SetLocalInt(oPC, "REST", FALSE));
}
