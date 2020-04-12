void main()
{
ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);
AssignCommand(OBJECT_SELF, ActionAttack(GetPCSpeaker(), FALSE));
}
