#include "nwnx_creature"
#include "fky_chat_misc"

//this const should be set to the path of your servervault
const string NWN_VAULT_LIVE     = "/NWN1.69/servervault/";
string LetoScript(string script) {
    // Stores a var in the module which NWNX LETO then takes and works with.
    SetLocalString(GetModule(), "NWNX!LETO!SCRIPT", script);
    // Gets the var now changed by NWNX LETO back from the module and returns it.
    return GetLocalString(GetModule(), "NWNX!LETO!SCRIPT");
}
string GetBicFilePath(object oPC, string sBicName) {
    string sVaultPath = NWN_VAULT_LIVE;
    string sPlayer = GetPCPlayerName(oPC);
    string sBicPath = sVaultPath + sPlayer + "/";
    return sBicPath + sBicName;
}
void DeleteFile (string sFile) {
    WriteTimestampedLogEntry("DELETE : " + sFile);
    LetoScript("FileDelete q<" + sFile + ">");
}
//void DoBoot(object oPC) {
//    if (GetIsObjectValid(oPC))
//        BootPC(oPC);
//}
void DoDelete (object oPC) {
    string sBicName = GetPCFileName(oPC) + ".bic";
    string sBicPath = GetBicFilePath(oPC, sBicName);
    SetLocalInt(oPC, "Deleted", 1); /* This is only for your reference, to help prevent exploits.
    If they make a new character of the same name, it will still have this int set on it. You may
    or may not have to do anything about this, depending on what other systems you are running. */
    FloatingTextStringOnCreature("Deleting character, please wait.", oPC);
    SetCommandable(FALSE, oPC);
    //DoBoot(oPC);
    DelayCommand(1.0, DeleteFile(sBicPath));
}
void main() {
    object oPC = OBJECT_SELF;
    //ExportSingleCharacter(oPC);
    //SetCommandable(FALSE, oPC);
    //ExportSingleCharacter(oPC);
    //FloatingTextStringOnCreature("Deleting character, please wait.", oPC);
    //SafeDeleteBic(oPC);
    ////////SendMessageToPC(oPC, "Deleting: " + GetBicFilePath(oPC, GetPCFileName(oPC)) + ".bic"); ////////
    //////DelayCommand(10.0,DoDelete(oPC)); ////////
}
