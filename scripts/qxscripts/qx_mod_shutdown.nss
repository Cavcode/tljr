// This script is fired from the Module Controller Convo
// It will shutdown the Server.
// It should not be called from any other location!
// The terms Module, mod, and Server are used interchangeably.
// Quix

#include "nwnx_system"
void main()
{
    //Delay time in seconds before server shutdown.
    float fDelay = 30.0;
    //User that initiated the Shutdown.
    string sUser = GetPCPlayerName(GetLastSpeaker());

    ExportAllCharacters();

    SendMessageToAllDMs(sUser + " has initiated a server shutdown." +
        "The server will shutdown in " + IntToString(FloatToInt(fDelay)) + " seconds and should be back up momentarily." +
        "Contact Quix if it does not reload within 10 minutes.");

    object oPC = GetFirstPC();
    while(GetIsObjectValid(oPC))
    {
        SendMessageToPC(oPC, "The server will shutdown in " + IntToString(FloatToInt(fDelay)) + " seconds and should be back up momentarily."+
            " Post a message in the Server Status section of the forums if it isn't back up within 10 minutes");
        oPC = GetNextPC();
    }
    //Shutdown the server after the delay set above.
    DelayCommand(fDelay, ShutdownServer());
}
