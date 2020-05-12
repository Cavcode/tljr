void main()
{
object oPC = GetLastOpenedBy();
AssignCommand(OBJECT_SELF, ActionStartConversation (oPC, "pug_q7_sarco", TRUE, FALSE));
}
