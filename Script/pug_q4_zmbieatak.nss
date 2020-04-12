void Reset(object oSpawn)
{
SetLocalInt(oSpawn, "USED", FALSE);
}
void ZombieAttack(location lWP)
{
int x;
int nSize = Random(4)+1;
for (x = 0; x < (nSize+1); x++)
    {
    CreateObject(OBJECT_TYPE_CREATURE, "thevalorzombie",lWP , FALSE);
    }
}

void main()
{
object oPC = GetEnteringObject();
int nUsed = GetLocalInt(OBJECT_SELF, "USED");
int nTimer = Random(6)+4;

if (nUsed == FALSE && GetIsPC(oPC))
    {
    DelayCommand(IntToFloat(nTimer), ZombieAttack(GetLocation(GetWaypointByTag("WP_"+GetTag(OBJECT_SELF)))));
    SetLocalInt(OBJECT_SELF, "USED", TRUE);
    DelayCommand(660.0, Reset(OBJECT_SELF));
    }

}
