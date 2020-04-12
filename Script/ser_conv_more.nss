/*  Universal Conversation Script (MORE)
    Designed By: Seradan.

    System Description: Gives each conversation hook up til 10 a specific script
    Script Description: Increases the variable by 10

*/

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "ONES", GetLocalInt(oPC, "ONES") + 10);

/*  DeleteLocalString(oPC, "CONVERSATION_SYSTEM");
    DeleteLocalInt(oPC, "TENTHOUSANDS");
    DeleteLocalInt(oPC, "THOUSANDS");
    DeleteLocalInt(oPC, "HUNDREDS");
    DeleteLocalInt(oPC, "ONES"); */
}
