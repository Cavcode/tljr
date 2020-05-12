#include "pug_inc"
int StartingConditional()
{
object oPC = GetPCSpeaker();
int nChoice = GetLocalInt(GetPCSpeaker(), "CONVO_CHOICE");
string sArea = GetTag(GetArea(oPC));
object oShip;
if (sArea == "pug_isd_1"){oShip = GetObjectByTag("PL_S_ISD");}
else if (sArea == "pug_mcc_1"){oShip = GetObjectByTag("PL_S_MCC");}
string sShip = GetStringRight(GetTag(oShip),3);

object oTarget = GetLocalObject(oShip, sShip+"_TARGET_"+IntToString(nChoice));

if (GetDistanceBetween(oTarget, oShip) >= 11.0 )
{return TRUE;}
else{return FALSE;}
}
