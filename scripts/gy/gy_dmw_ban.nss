void main()
{
    string sMessage;
    object oPC = GetPCSpeaker();

    object oTarget = GetLocalObject(oPC,"gy_dmwandTarget");
    string sCDKey = GetPCPublicCDKey(oTarget);
    string sIP = GetPCIPAddress(oTarget);
    if (GetIsObjectValid(oTarget) && GetIsPC(oTarget))
    {
        if (GetIsDM(oTarget) == TRUE)
        {
              SendMessageToPC(oPC,GetName(oTarget) + " Cannot be banned because of being a DM");
        }
        else
        {
              SetLocalInt(GetModule(), sCDKey+"IsBanned", TRUE);
              FloatingTextStringOnCreature("You have been banned from the server", oTarget);
              sMessage ="BANNED:" + GetName(oTarget)+ " CDKey:"+sCDKey +" IPAddress:"+sIP;
              WriteTimestampedLogEntry(sMessage);
              SendMessageToPC(oPC,sMessage);
              DelayCommand(1.5, BootPC(oTarget));
        }
    }
}
