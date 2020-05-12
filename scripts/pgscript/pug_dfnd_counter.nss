#include "pug_inc"
void main()
{
string sBase = GetStringLeft(GetTag(OBJECT_SELF), 9);
int nCount = GetLocalInt(OBJECT_SELF, "COUNT");
string sFaction = GetCampaignString("starwars", sBase+"_CONTROL");
string sSoldier; location lLoc;
int x = 0;
/*object oSoldier = GetObjectByTag(GetTag(OBJECT_SELF),x);

while (oSoldier == OBJECT_SELF)
    {
    x=x+1;
    oSoldier = GetObjectByTag(GetTag(OBJECT_SELF),x);
    }*/
if (sBase == "pug_isd_1" && GetIsObjectValid(GetObjectByTag("PL_S_ISD")) == TRUE && GetIsDead(GetObjectByTag("PL_S_ISD")) == FALSE)
    {
    sFaction = GetNPCFaction(GetObjectByTag("PL_S_ISD"));
    }
else if (sBase == "pug_mcc_1" && GetIsObjectValid(GetObjectByTag("PL_S_MCC")) == TRUE && GetIsDead(GetObjectByTag("PL_S_MCC"))== FALSE)
    {
    sFaction = GetNPCFaction(GetObjectByTag("PL_S_MCC"));
    }

if (nCount >= 120 )
    {
    if (GetStringLeft(GetTag(OBJECT_SELF), 5) == "droid")
        {
        lLoc = GetLocation(OBJECT_SELF);
        sSoldier =  "pug_droid";
        }
    else if (GetStringLeft(GetTag(OBJECT_SELF), 8) == "PL_S_ISD")
        {
        lLoc = GetLocation(GetWaypointByTag("CAP_ISD_SPAWN"));
        sSoldier =  "pl_s_isd";
        }
    else if (GetStringLeft(GetTag(OBJECT_SELF), 8) == "PL_S_MCC")
        {
        lLoc = GetLocation(GetWaypointByTag("CAP_MCC_SPAWN"));
        sSoldier =  "pl_s_mcc";
        }
    else if(GetStringLeft(GetTag(OBJECT_SELF), 8) == "civilian")
        {
        if (Random(10) < 6)
            {
            sSoldier =  "civilian";
            }
        else
            {
            sSoldier =  "civilianf";
            }
        lLoc = GetLocation(OBJECT_SELF);
        }
    else if(GetStringLeft(GetTag(OBJECT_SELF), 4) == "jawa")
        {
        sSoldier =  "jawa";
        lLoc = GetLocation(OBJECT_SELF);
        }
    else if (sFaction == "Empire" )
        {
        if (GetStringRight(GetTag(OBJECT_SELF), 2) == "_2" && GetIsAreaInterior(GetArea(GetWaypointByTag(sBase+"_SPAWN"))) == FALSE)
            {
            sSoldier = "dfnd_atst";
            }
        else if (GetStringLeft(sBase, 7) == "rhenvar")
            {
            sSoldier =  "dfnd_snowtroop";
            }
        else {sSoldier="dfnd_stormtroop";}
        lLoc = GetLocation(GetWaypointByTag(sBase+"_SPAWN"));
        }
    else if (sFaction == "Rebels")
        {
        lLoc = GetLocation(GetWaypointByTag(sBase+"_SPAWN"));
        if (GetStringRight(GetTag(OBJECT_SELF), 2) == "_2")
            {
            sSoldier = "dfnd_liberator";
            }
        else {sSoldier="dfnd_frefight";}
        }
    else if (sFaction == "Locals" )
        {
        lLoc = GetLocation(GetWaypointByTag(sBase+"_SPAWN"));
        if (GetStringLeft(sBase, 7) == "rhenvar")
            {
            sSoldier =  "dfnd_battledroid";
            }
        else if (GetStringLeft(sBase, 7) == "iridnia")
            {
            sSoldier = "dfnd_localzabrak";
            }
        else if (GetStringLeft(sBase, 7) == "bespinn")
            {
            sSoldier = "bespinwingguar";
            }
        else {sSoldier="dfnd_localguard";}
        }
    object oDefender = CreateObject(OBJECT_TYPE_CREATURE, sSoldier, lLoc, FALSE, GetTag(OBJECT_SELF));
    object oPC = GetFirstPC();
    string sNPC = GetNPCFaction(oDefender);
    string sPC;
    DestroyObject(OBJECT_SELF);
    while (GetIsObjectValid(oPC) == TRUE)
        {
        sPC = GetFaction(oPC, TRUE);
        if (sNPC != sPC && sNPC != "Fringe" && sPC != "Fringe")
            {
            ExecuteScript("pug_fac_set", oPC);
            }
        oPC = GetNextPC();
        }
    }

else if (nCount < 120)
    {
    object oNPC = GetObjectByTag(GetTag(OBJECT_SELF),1);
    int x = 1;
    while (oNPC == OBJECT_SELF && GetIsObjectValid(oNPC) == TRUE)
        {
        x++;
        oNPC = GetObjectByTag(GetTag(OBJECT_SELF),x);
        }
    if (GetIsObjectValid(oNPC) == TRUE && oNPC != OBJECT_SELF)
        {
        DestroyObject(oNPC);
        }
    SetLocalInt(OBJECT_SELF, "COUNT", nCount+1);
    }
}
