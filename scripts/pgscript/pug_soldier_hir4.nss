#include "nw_i0_plot"
#include "x0_i0_henchman"
void main()
{
object oPC = GetPCSpeaker();
object oHench;
int nGold = GetGold(oPC);
int COST = 15000;

if (GetIsObjectValid(GetItemPossessedBy(oPC, "MedalofBravery"))==TRUE)
        {SetLocalInt(oPC, "HENCHMAN_MAX", 1);}
if (GetIsObjectValid(GetItemPossessedBy(oPC, "ImperialMedal"))==TRUE)
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

if(nHas < nMax && nGold >= COST)
    {
    if (GetIsObjectValid(GetItemPossessedBy(oPC, "GalaticEmpireID"))==TRUE)
        {
        oHench = CreateObject(OBJECT_TYPE_CREATURE, "empiresoldier4", GetLocation(oPC), FALSE);
        }
    if (GetIsObjectValid(GetItemPossessedBy(oPC, "RebelAllianceID"))==TRUE)
        {
        oHench = CreateObject(OBJECT_TYPE_CREATURE, "rebelsoldier4", GetLocation(oPC), FALSE);
        }
    AddHenchman(oPC, oHench);
    SetIsFollower(oHench, TRUE);
    SetLocalObject(oHench, "LEADER", GetPCSpeaker());
    SetLocalInt(oPC, "HENCHMAN_HAS", nHas+1);
    TakeGoldFromCreature(COST, oPC, TRUE);
    }
if(nHas == nMax)
    {
    AssignCommand(OBJECT_SELF, ActionSpeakString("You cannot hire anymore men", TALKVOLUME_TALK));
    }
if(nGold < COST)
    {
    AssignCommand(OBJECT_SELF, ActionSpeakString("You do not have enough credits", TALKVOLUME_TALK));
    }
}
