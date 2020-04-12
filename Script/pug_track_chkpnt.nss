void main()
{
object oPC = GetEnteringObject();
int nCheck = GetLocalInt(oPC, "CHECKPOINT");
int nPoint = StringToInt(GetStringRight(GetTag(OBJECT_SELF), 1));

if (nPoint-1 == nCheck)
    {
    SetLocalInt(oPC, "CHECKPOINT", nPoint);
    }
else if (nPoint != nCheck)
    {
    FloatingTextStringOnCreature("You are going the wrong way!", oPC, FALSE);
    }


}
