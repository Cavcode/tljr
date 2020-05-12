#include "nw_i0_plot"
#include "x0_i0_henchman"
//Naming kept as pug_ for ease of finding. Other hench summon are pug_soldier
void main()
{
object oPC = GetPCSpeaker();
object oHench;
int nGold = GetGold(oPC);
int COST = 15000;

{SetLocalInt(oPC, "HENCHMAN_MAX", 1);}

int nMax = GetLocalInt(oPC,"HENCHMAN_MAX");
int nHas = GetLocalInt(oPC,"HENCHMAN_HAS");
SetMaxHenchmen(3);

if(nHas < nMax && nGold >= COST)
    {

        {
        oHench = CreateObject(OBJECT_TYPE_CREATURE, "trandobountyh001", GetLocation(oPC), FALSE);
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
