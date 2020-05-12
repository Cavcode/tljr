void main()
{
object oWP = GetWaypointByTag(GetTag(OBJECT_SELF)+"_spot");
int nAlarm = GetLocalInt(OBJECT_SELF, "STATE");

if (nAlarm == FALSE)
    {
    CreateObject(OBJECT_TYPE_PLACEABLE, "pug_forcefield", GetLocation(oWP), FALSE, GetTag(OBJECT_SELF)+"_wall");
    SetLocalInt(OBJECT_SELF, "STATE", TRUE);
    }
else if (nAlarm == TRUE)
    {
    DestroyObject(GetObjectByTag(GetTag(OBJECT_SELF)+"_wall"));
    SetLocalInt(OBJECT_SELF, "STATE", FALSE);
    }
}
