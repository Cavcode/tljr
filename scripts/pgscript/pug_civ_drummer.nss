void main()
{
object oDrum = GetNearestObjectByTag("Drum", OBJECT_SELF);
AssignCommand(OBJECT_SELF, ActionAttack(oDrum, TRUE));
ActionAttack(oDrum, TRUE);
}
