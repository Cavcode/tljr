void main()
{
object oNPC = OBJECT_SELF;
object oPC = GetLocalObject(oNPC, "ATTACK_TARGET");

AssignCommand(oNPC, ActionAttack(oPC, FALSE));
SetLocalInt(oPC, "SMUGGLE_UNDERATTACK", TRUE);
}
