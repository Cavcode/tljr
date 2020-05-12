#include "pug_inc"
void main()
{
object oPC = GetPCSpeaker();

if (GetIsObjectValid(GetItemPossessedBy(oPC, "MedalofBravery"))==TRUE)
        {SetLocalInt(oPC, "HENCHMAN_MAX", 1);}
if (GetIsObjectValid(GetItemPossessedBy(oPC, "ImperialMedallion"))==TRUE)
        {SetLocalInt(oPC, "HENCHMAN_MAX", 1);}
if (GetIsObjectValid(GetItemPossessedBy(oPC, "MedalofHonor"))==TRUE)
        {SetLocalInt(oPC, "HENCHMAN_MAX", 2);}
if (GetIsObjectValid(GetItemPossessedBy(oPC, "MedaloftheEmp"))==TRUE)
        {SetLocalInt(oPC, "HENCHMAN_MAX", 2);}
if (GetIsObjectValid(GetItemPossessedBy(oPC, "StarofAlderaan"))==TRUE)
        {SetLocalInt(oPC, "HENCHMAN_MAX", 3);}
if (GetIsObjectValid(GetItemPossessedBy(oPC, "EmperorsWill"))==TRUE)
        {SetLocalInt(oPC, "HENCHMAN_MAX", 3);}

int nMax = GetLocalInt(oPC,"HENCHMAN_MAX");
int nHas = GetLocalInt(oPC,"HENCHMAN_HAS");
SetMaxHenchmen(3);

if(nHas < nMax)
    {
    AddHenchman(oPC, OBJECT_SELF);
    SetLocalObject(OBJECT_SELF, "LEADER", GetPCSpeaker());
    SetLocalInt(GetMaster(OBJECT_SELF), "HENCHMAN_HAS", nHas+1);
    ActionForceFollowObject(GetPCSpeaker(), 2.1);

    int nLevel = GetCampaignInt("starwars", "HENCH_LEVEL", oPC);

    int nSet = nLevel + 7 - GetLevelByPosition(1, OBJECT_SELF) - GetLevelByPosition(2, OBJECT_SELF) - GetLevelByPosition(3, OBJECT_SELF);

    SetXP(OBJECT_SELF, (nLevel+7) * 500);
    while (nSet > 0)
        {
        LevelUpHenchman(oPC, CLASS_TYPE_FIGHTER, FALSE, PACKAGE_FIGHTER);
        nSet=nSet-1;
        }
    }
//EquipHenchman(OBJECT_SELF);
}
