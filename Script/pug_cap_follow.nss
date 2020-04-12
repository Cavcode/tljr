void main()
{
object oPC = GetPCSpeaker();
object oPlanet = GetLocalObject(GetPCSpeaker(), "COM_PLANET");
string sShip = GetStringRight(GetTag(oPlanet), 3);
int nEngine = GetLocalInt(GetObjectByTag(sShip+"_ENGINES"), "BROKEN");

if (nEngine == FALSE)
    {
    AssignCommand(oPlanet, ActionForceFollowObject(oPC, 2.0));
    }
}
