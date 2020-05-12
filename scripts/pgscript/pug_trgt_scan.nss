#include "pug_inc"
void main()           //1216001
{
object oPC = GetPCSpeaker();
if (GetIsObjectValid(oPC) == FALSE){oPC = GetLastUsedBy();}
string sArea = GetTag(GetArea(oPC));
object oShip;
SetLocalInt(oPC, "CONVO_CHOICE", 0);
if (sArea == "pug_isd_1"){oShip = GetObjectByTag("PL_S_ISD");}
else if (sArea == "pug_mcc_1"){oShip = GetObjectByTag("PL_S_MCC");}
string sShip = GetStringRight(GetTag(oShip),3);
int x = 1; int y =1;int t;
object oTarget = GetNearestObject(OBJECT_TYPE_CREATURE, oShip, x);

for (t = 1; t < (10+1); t++)
    {
    DeleteLocalObject(oShip, sShip+"_TARGET_"+IntToString(t));
    }
while (GetIsObjectValid(oTarget) && GetDistanceBetween(oShip, oTarget) < 16.0)
    {
    if (GetIsDM(oTarget) == FALSE && GetLocalInt(oTarget, "NAVIGATE")==FALSE )
        {
        SetLocalObject(oShip, sShip+"_TARGET_"+IntToString(y), oTarget);
        SetCustomToken(1216000+y, GetName(oTarget, FALSE)+" ("+GetFaction(oTarget, TRUE)+") Hull Strength: "+IntToString(GetCurrentHitPoints(oTarget)));
        y++;
        }
    x++;
    oTarget = GetNearestObject(OBJECT_TYPE_CREATURE, oShip, x);
    }
}
