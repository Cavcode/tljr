void main()
{
object oPC = GetLastUsedBy();
object oShip = GetObjectByTag("PL_S_"+GetStringLeft(GetTag(OBJECT_SELF), 3));
int nStatus = GetLocalInt(oShip, GetTag(OBJECT_SELF));
int nMax = GetLocalInt(OBJECT_SELF, "MAX_POWER");
int nRepair = GetLocalInt(OBJECT_SELF, "REPAIR");

SendMessageToPC(oPC, "System Status: "+IntToString(nStatus)+" out of "+IntToString(nMax)+" with "+IntToString(nRepair)+" repairing.");
}
