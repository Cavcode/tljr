void main()
{
    object oPC = GetPCSpeaker();
    string sMod = GetModuleName();
    AssignCommand(oPC,ActionSpeakString("The module is being reloaded in ten seconds, please excuse the intrusion.",TALKVOLUME_SHOUT));
    DelayCommand(10.0,StartNewModule(sMod));
}
