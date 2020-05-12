#include "pug_inc"
//Planet base names must be 7 characters and the number to the right of the name is the number of defending NPCs you want
void StartPlanets()
{
/*
SetUpBase("rhenvar_1", 10);
SetUpBase("rhenvar_2", 10);
SetUpBase("rhenvar_3", 10);
SetUpBase("corelia_1", 10);
SetUpBase("corelia_2", 10);
SetUpBase("corelia_3", 10);
SetUpBase("ceereea_1", 10);
SetUpBase("ceereea_2", 10);
SetUpBase("ceereea_3", 10);
SetUpBase("bespinn_1", 10);
SetUpBase("bespinn_2", 10);
SetUpBase("bespinn_3", 10);
SetUpBase("iridnia_1", 10);
SetUpBase("iridnia_2", 10);
SetUpBase("iridnia_3", 10);
SetUpBase("corulag_1", 10);
SetUpBase("corulag_2", 7);
SetUpBase("corulag_3", 10); */
}

void StartCapitalShips()
{
CreateObject(OBJECT_TYPE_CREATURE, "pl_s_mcc", GetLocation(GetWaypointByTag("CAP_MCC_SPAWN")), TRUE, "PL_S_MCC");
CreateObject(OBJECT_TYPE_CREATURE, "pl_s_isd", GetLocation(GetWaypointByTag("CAP_ISD_SPAWN")), TRUE, "PL_S_ISD");
SetUpBase("pug_isd_1", 13);
SetUpBase("pug_mcc_1", 13);
}
//void main(){}

