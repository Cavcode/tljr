void main()
{
object oListener = CreateObject(OBJECT_TYPE_CREATURE, "pug_listener", GetLocation(OBJECT_SELF), FALSE, "holo_listen");
SetLocalObject(OBJECT_SELF, "LISTENER", oListener);
SetLocalString(oListener, "RECORDER", GetName(GetPCSpeaker()));
SetLocalString(OBJECT_SELF, "MESSAGE", "");
}
