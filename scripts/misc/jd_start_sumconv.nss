void main()
{
    // Get Last Speaker
    object oPC = GetPCSpeaker();
    // Start Conversation
    AssignCommand (oPC, ActionStartConversation (oPC, "jd_conv_sum", TRUE,FALSE));
}
