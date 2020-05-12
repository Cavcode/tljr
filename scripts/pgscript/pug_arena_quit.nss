void main()
{
int x = 0;
object oCreature = GetObjectByTag("arena_beast", x);
while (GetIsObjectValid(oCreature) == TRUE)
    {
    DestroyObject(oCreature);
    x++;
    oCreature = GetObjectByTag("arena_beast", x);
    }
AssignCommand(OBJECT_SELF, ActionSpeakString("You have quit!", TALKVOLUME_TALK));
SetLocalInt(GetModule(), "GEO_KILLS", 0);
SetLocalInt(GetModule(), "GEO_SPAWNS", 0);
SetLocalInt(GetModule(), "GEO_ROUND", 0);
}
