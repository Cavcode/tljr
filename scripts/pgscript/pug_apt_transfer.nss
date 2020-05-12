void main()
{
object oPC = GetPCSpeaker();
object oOther = GetNearestObject(OBJECT_TYPE_CREATURE, oPC, 1);
int x = 1;
while (GetIsPC(oOther) == FALSE && GetIsObjectValid(oOther) == TRUE)
    {
    x++;
    oOther = GetNearestObject(OBJECT_TYPE_CREATURE, oPC, x);
    }
string sName = GetName(oOther, FALSE);
SetLocalObject(oPC, "APT_TRANSFER", oOther);

SetCustomToken(587773, "Are you sure you wish to transfer ownership of this property to "+sName+"?");
}
