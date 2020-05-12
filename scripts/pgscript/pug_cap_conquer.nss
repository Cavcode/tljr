#include "pug_inc"
void main()
{
object oPC = GetPCSpeaker();
string sArea = GetTag(GetArea(oPC));
object oShip;
if (sArea == "pug_isd_1"){oShip = GetObjectByTag("PL_S_ISD");}
else if (sArea == "pug_mcc_1"){oShip = GetObjectByTag("PL_S_MCC");}
string sFaction = GetFaction(oPC,FALSE);
object oFringe = GetObjectByTag("faction_fringe");
object oEmpire = GetObjectByTag("faction_empire");
object oRebels = GetObjectByTag("faction_rebels");

if (sFaction == "Empire"){ChangeFaction(oShip, oEmpire);}
else if (sFaction == "Rebels"){ChangeFaction(oShip, oRebels);}
}
