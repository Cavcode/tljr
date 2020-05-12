//#include "qx_leto_func"
#include "fky_chat_inc"
void main()
{
    object oPC = GetExitingObject();
    object oM = GetModule();

    SetLocalInt(oM, "LEAVING_HP_"+GetName(oPC), GetCurrentHitPoints(oPC));

    //Speech_OnClientExit(oPC);
  // if ((VAULTPATH_CHAT != "") && (!ALREADY_USING_LETO))
    //{
        //string Script = GetLocalString(oPC, "LetoScript");
       // if( Script != "" ) Leto(Script);
   // }
}
