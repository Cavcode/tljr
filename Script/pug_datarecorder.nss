void main()
{
object oPC = GetItemActivator();
string sMsg = GetLocalString(oPC, "DATA_MESSAGE");
int nRecord = GetLocalInt(oPC, "DATA_RECORD");
object oDevice = GetItemActivated();

if (nRecord == FALSE && GetTag(oDevice) == "pug_datarecorder")
    {
    FloatingTextStringOnCreature("Recording has begun. Speak the message you wish to record.", oPC, FALSE);
    SetDescription(GetItemActivated(), GetName(oPC)+": "+sMsg, TRUE);
    SetLocalString(oPC, "DATA_MESSAGE", "");
    SetLocalInt(oPC, "DATA_RECORD", TRUE);
    SetLocalObject(oPC, "DATA_DEVICE", oDevice);
    }

}
