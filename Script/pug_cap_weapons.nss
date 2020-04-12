#include "pug_inc"
void main()
{
object oPC = GetLastUsedBy();
//int nPilot = GetSkillRank( 27, oPC, FALSE);
string sArea = GetTag(GetArea(oPC));
object oShip;
if (sArea == "pug_isd_1"){oShip = GetObjectByTag("PL_S_ISD");}
else if (sArea == "pug_mcc_1"){oShip = GetObjectByTag("PL_S_MCC");}
string sShip = GetStringRight(GetTag(oShip),3);
int nBroken = GetLocalInt(GetObjectByTag(sShip+"_WEAPONS"), "BROKEN");
//object oGun = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oShip);
int nAble=FALSE;

if (GetFaction(oPC,TRUE) == GetNPCFaction(oShip)){nAble = TRUE;}

if (nBroken == TRUE)
    {
    AssignCommand(OBJECT_SELF, ActionSpeakString("Weapons system damaged.", TALKVOLUME_TALK));
    }
else if (nAble == FALSE)
    {
    AssignCommand(OBJECT_SELF, ActionSpeakString("You do not have access to this control.", TALKVOLUME_TALK));
    }
/* I am changing the weapon system from simply activate/deactivate to a targeting control
else if (nBroken == FALSE && nAble == TRUE && GetTag(oGun) == "ser_shipgun_trans" && GetIsObjectValid(oGun)==TRUE)
    {
    DestroyObject(GetItemPossessedBy(oShip,"ser_shipgun_trans"));
    object oNew = CreateItemOnObject("pug_no_attack", oShip);
    AssignCommand(oShip, ActionEquipItem(oNew, INVENTORY_SLOT_RIGHTHAND));
    AssignCommand(OBJECT_SELF, ActionSpeakString("Weapons disabled.", TALKVOLUME_TALK));
    }
else if (nBroken == FALSE && nAble == TRUE && GetTag(oGun) == "pug_no_attack" && GetIsObjectValid(oGun)==TRUE)
    {
    DestroyObject(GetItemPossessedBy(oShip,"pug_no_attack"));
    object oNew = CreateItemOnObject("ser_shipgun_bomb", oShip);
    AssignCommand(oShip, ActionEquipItem(oNew, INVENTORY_SLOT_RIGHTHAND));
    AssignCommand(OBJECT_SELF, ActionSpeakString("Weapons activated.", TALKVOLUME_TALK));
    } */
else if (nBroken == FALSE && nAble == TRUE)
    {
    ExecuteScript("pug_trgt_scan", OBJECT_SELF);
    AssignCommand(OBJECT_SELF, ActionStartConversation(oPC, "pug_targeting", TRUE, FALSE));
    DelayCommand(3.0, AssignCommand(oPC, ActionSit(GetNearestObjectByTag("weps_chair", oPC))));
    AssignCommand(OBJECT_SELF, ActionSpeakString("Targeting computer engaging.", TALKVOLUME_TALK));
    }
}
