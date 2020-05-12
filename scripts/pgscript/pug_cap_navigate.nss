#include "pug_inc"
void main()
{
object oPC = GetLastUsedBy();
object oClone;
int nPilot = GetSkillRank( 27, oPC, FALSE);
string sArea = GetTag(GetArea(oPC));
object oShip;
if (sArea == "pug_isd_1"){oShip = GetObjectByTag("PL_S_ISD");}
else if (sArea == "pug_mcc_1"){oShip = GetObjectByTag("PL_S_MCC");}
int nBusy = GetLocalInt(oShip, "BUSY");

if (nPilot < 20)
    {
    FloatingTextStringOnCreature("You require 20 pilot skill points to navigate the ship", oPC, FALSE);
    }
else if (GetFaction(oPC, FALSE) != GetNPCFaction(oShip))
    {
    FloatingTextStringOnCreature("You do not have access to this control panel", oPC, FALSE);
    }
else if (nBusy == TRUE)
    {
    FloatingTextStringOnCreature("Someone is already controlling this ship", oPC, FALSE);
    }
else if (nPilot >= 20 && nBusy == FALSE)
    {
    object oClone = CopyObject(oPC, GetLocation(oPC));
    FloatingTextStringOnCreature("To re-enter the ship, cast ships tools onto the ship", oPC, FALSE);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectPolymorph(324,TRUE),oPC);
    SetLocalInt(oShip, "BUSY", TRUE);
    SetLocalInt(oPC, "NAVIGATE", TRUE);
    SetLocalInt(oPC, "APPEARANCE", GetAppearanceType(oPC));
    SetCreatureAppearanceType(oPC, APPEARANCE_TYPE_INVISIBLE_HUMAN_MALE);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectInvisibility(INVISIBILITY_TYPE_IMPROVED),oPC);
    SetLocalObject(oPC, "CLONE", oClone);
    //SetCutsceneMode(oPC, TRUE, TRUE);
    AssignCommand(oClone, ActionSit(GetNearestObjectByTag("pug_nav_chair", oClone)));
    AssignCommand(oPC, ActionJumpToObject(oShip));
    DelayCommand(4.0, AssignCommand(oShip, ActionForceFollowObject(oPC)));
    //SetCameraMode(oPC, CAMERA_MODE_TOP_DOWN);
    SetPlotFlag(oPC, TRUE);
    SetPlotFlag(oClone, TRUE);
    object oGun = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND , oPC);
    AssignCommand(oPC, ActionUnequipItem(oGun));
    DelayCommand(2.0,DestroyObject(oGun));
    }
}
