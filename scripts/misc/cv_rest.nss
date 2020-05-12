//::///////////////////////////////////////////////
//:: cv_rest
//:: cv_rest.nss
//:: Copyright (c) 2003 Darren Summerwind.
//:://////////////////////////////////////////////
/*
        Conversation Rest Script
*/
//:://////////////////////////////////////////////
//:: Created By: Darren Summerwind
//:: Created On: 28/9/03
//:://////////////////////////////////////////////
void main()
{
    // Get Last Speaker
    object oPC = GetPCSpeaker();
int nInt;
nInt=GetLocalInt(oPC, "restallow");

if (nInt == 1)

    // Set "PlayerWantsToRest" to TRUE
    SetLocalInt(oPC, "PlayerWantsToRest", TRUE);

    // Clear all actions
    AssignCommand(oPC, ClearAllActions(TRUE));

    // Assign Rest
    DelayCommand( 0.5, AssignCommand( oPC, ActionRest()));

if (nInt != 0) // restallow not 1, not in "safezone" -> NO RESTING

    AssignCommand(oPC, ClearAllActions());

    SendMessageToPC(oPC,"You may not rest here, find a bed or camp.");
}
