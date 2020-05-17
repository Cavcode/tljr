//::///////////////////////////////////////////////
//:: cv_rest_emote
//:: cv_rest_emote.nss
//:: Copyright (c) 2003 Darren Summerwind.
//:://////////////////////////////////////////////
/*
        Conversation Emote Script
*/
//:://////////////////////////////////////////////
//:: Created By: Darren Summerwind
//:: Created On: 28/9/03
//:://////////////////////////////////////////////

void main()
{
    // Get Last Speaker
    object oPC = GetPCSpeaker();
    // Start Conversation
    AssignCommand (oPC, ActionStartConversation (oPC, "mod_emote", TRUE,FALSE));
}
