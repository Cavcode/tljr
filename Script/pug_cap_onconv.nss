void main()
{
object oPC = GetLastSpeaker();
object oPlanet = OBJECT_SELF;
string sShip = GetStringRight(GetTag(oPlanet), 3);
int nEngine = GetLocalInt(GetObjectByTag(sShip+"_ENGINES"), "BROKEN");


if (GetLocalInt(oPC, "NAVIGATE")==TRUE)
    {
    if (nEngine == FALSE)
        {
        AssignCommand(oPlanet, ActionForceFollowObject(oPC, 2.0));
        }
    }
}
