#include "nw_i0_tool"

int StartingConditional()
{
    object oLeader = GetMaster(OBJECT_SELF);
    object oPC = GetPCSpeaker();
    int nOK;
    // Make sure the PC speaker has these items in their inventory
    if (GetIsObjectValid(oLeader) != TRUE) {nOK = TRUE;}


    if(GetIsObjectValid(GetItemPossessedBy(oPC, "MedalofBravery"))==TRUE)return TRUE;
    else if(GetIsObjectValid(GetItemPossessedBy(oPC, "MedalofHonor"))==TRUE)return TRUE;
    else if(GetIsObjectValid(GetItemPossessedBy(oPC, "StarofAlderaan"))==TRUE)return TRUE;
    else if(GetIsObjectValid(GetItemPossessedBy(oPC, "ImperialMedal"))==TRUE)return TRUE;
    else if(GetIsObjectValid(GetItemPossessedBy(oPC, "MedaloftheEmp"))==TRUE)return TRUE;
    else if(GetIsObjectValid(GetItemPossessedBy(oPC, "EmperorsWill"))==TRUE)return TRUE;
    else  return FALSE;

}
