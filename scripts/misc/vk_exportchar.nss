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



    // Save/Export Character
    ExportSingleCharacter( oPC);
    SendMessageToPC( oPC, "- Character Saved -");



}
