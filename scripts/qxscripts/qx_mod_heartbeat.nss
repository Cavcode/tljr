// Module onHeartbeat for RotR
// by Quix
//
// This script will execute onHeartbeat (every 6 seconds)
// Most of the script will not execute every 6 seconds for performance reasons
#include "qx_inc_db"
#include "nwnx_system"
#include "rpxp"

void NotifyAllPCs(string sMessage);

void DealHazardDamage(object oPC,object area);


void main () {
    int hb_count = GetLocalInt(OBJECT_SELF,"hb_count") + 1;
    SetLocalInt(OBJECT_SELF, "hb_count", hb_count);
    if (hb_count > 1800)
    {
        SetLocalInt(OBJECT_SELF, "hb_count", 0);
    }
    else
    {
        SetLocalInt(OBJECT_SELF, "hb_count", hb_count);
    }
  /*
//////every heartbeat:

    // update module uptime and if greater than the reset variable, execute server reset.
    int nUptime = GetLocalInt(OBJECT_SELF, "uptime");
    int nResetTime = GetLocalInt(OBJECT_SELF, "reset_seconds");
    string sMessage = "";
    SQLExecDirect("SELECT UNIX_TIMESTAMP() - " + IntToString(GetLocalInt(OBJECT_SELF, "boottime")));
    if (SQLFetch() == SQL_SUCCESS) {
        nUptime = StringToInt(SQLGetData(1));
        SetLocalInt(OBJECT_SELF, "uptime", nUptime);
    }
    if (nUptime > nResetTime) // Time to restart the server
    {
        ExportAllCharacters();
        sMessage = "The server will restart 30 seconds. If the server does not reload within 10 minutes please post a message on the forums in the Server Status section.";
        SendMessageToAllDMs(sMessage);
        DelayCommand(30.0, ShutdownServer());
    }
 */
//////every 10 minutes:
    //Save all PC's character files

    object oPC = GetFirstPC();
    object area = GetArea(oPC);

    while(GetIsObjectValid(oPC) == TRUE)
    {
        GiveRPXP(oPC);

        // Do damage if they're in a hazardous area.
        DealHazardDamage(oPC, area);

        oPC = GetNextPC();
        area = GetArea(oPC);
    }

    // Save all characters.

    if (hb_count == 100)
    {
        ExportAllCharacters();
    }


}

void DealHazardDamage(object oPC, object area) {

    string areaTag = GetTag(area);

    if ( "TLJ_GASMASK" == GetTag(GetItemInSlot(INVENTORY_SLOT_HEAD, oPC))) {
        return;
    }

    if (areaTag == "jd_ar_hetar002")
    {
        effect eDamage = EffectDamage(d20(5), DAMAGE_TYPE_DIVINE);
        effect eVisual = EffectVisualEffect(VFX_COM_BLOOD_CRT_GREEN);
        effect eLink = EffectLinkEffects(eDamage, eVisual);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oPC);
    }
   }

