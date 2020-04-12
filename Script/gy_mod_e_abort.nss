void main()
{
    //restart conversation until player answers question
    object oPC = GetPCSpeaker();
    AssignCommand (oPC, ActionStartConversation (oPC, "mod_entered", TRUE,FALSE));
}
