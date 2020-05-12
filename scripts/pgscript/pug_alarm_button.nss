void main()
{
object oSound = GetObjectByTag(GetTag(OBJECT_SELF)+"_sound");
int nAlarm = GetLocalInt(oSound, "ALARM");

if (nAlarm == FALSE)
    {
    SoundObjectPlay(oSound);
    SetLocalInt(oSound, "ALARM", TRUE);
    }
else if (nAlarm == TRUE)
    {
    SoundObjectStop(oSound);
    SetLocalInt(oSound, "ALARM", FALSE);
    }
}
