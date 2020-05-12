/*  Universal Conversation Script (EXIT)
    Designed By: Seradan.

    System Description: Gives each conversation hook up til 10 a specific script
    Script Description: Resets all the variables.

*/

void main()
{
    object oPC = GetPCSpeaker();
    DeleteLocalString(oPC, "CONVERSATION_SYSTEM");
    DeleteLocalInt(oPC, "TENTHOUSANDS");
    DeleteLocalInt(oPC, "THOUSANDS");
    DeleteLocalInt(oPC, "HUNDREDS");
    DeleteLocalInt(oPC, "ONES");
}
