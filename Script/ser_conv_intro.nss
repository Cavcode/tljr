/*  Universal Conversation Script (INTRO)
    Designed By: Seradan.

    System Description: Gives each conversation hook up til 10 a specific script
    Script Description: Resets all the variables, then defines the appropriate one.

*/

void main()
{
    object oPC = GetPCSpeaker();
    DeleteLocalString(oPC, "CONVERSATION_SYSTEM");
    DeleteLocalInt(oPC, "TENTHOUSANDS");
    DeleteLocalInt(oPC, "THOUSANDS");
    DeleteLocalInt(oPC, "HUNDREDS");
    DeleteLocalInt(oPC, "ONES");

    SetLocalString(oPC, "CONVERSATION_SYSTEM", GetTag(OBJECT_SELF));
}
