void main()
{
object oPC = GetLastOpenedBy();
AssignCommand(OBJECT_SELF, ActionStartConversation (oPC, "pug_elevator", TRUE, FALSE));
DelayCommand(3.0, ActionCloseDoor(OBJECT_SELF));
}
