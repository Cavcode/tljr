#include "pug_inc"
void ReloadShips(object oShip, object oConsole)
{
SetLocalInt(oShip, "SHIP_FIGHTERS",0);
AssignCommand(oConsole, ActionSpeakString("Fighter squadron ready.", TALKVOLUME_TALK));
}

void main()   //weps_chair
{
object oPC = GetPCSpeaker();
string sArea = GetTag(GetArea(oPC));
object oShip;
if (sArea == "pug_isd_1"){oShip = GetObjectByTag("PL_S_ISD");}
else if (sArea == "pug_mcc_1"){oShip = GetObjectByTag("PL_S_MCC");}
string sShip = GetStringRight(GetTag(oShip),3);
string sFighter;

    int nPower = GetLocalInt(oShip, "SHIP_FIGHTERS");

    if (sShip == "ISD"){sFighter = "isd_tiefighter";}
    else if (sShip == "MCC"){sFighter = "mcc_xwing";}

    if (nPower == 0)
        {
        CreateObject(OBJECT_TYPE_CREATURE, sFighter, GetLocation(oShip), TRUE, sShip+"_fighter");
        CreateObject(OBJECT_TYPE_CREATURE, sFighter, GetLocation(oShip), TRUE, sShip+"_fighter");
        CreateObject(OBJECT_TYPE_CREATURE, sFighter, GetLocation(oShip), TRUE, sShip+"_fighter");
        CreateObject(OBJECT_TYPE_CREATURE, sFighter, GetLocation(oShip), TRUE, sShip+"_fighter");

        SetLocalInt(oShip, "SHIP_FIGHTERS", 1);
        DelayCommand(300.0, ReloadShips(oShip, OBJECT_SELF));

        }
}
