void main()
{
object oKiller = GetLastKiller();
object oDead = OBJECT_SELF;
string sFaction1, sFaction2;
int nLevel = GetHitDice(oDead);

if (GetIsObjectValid(GetItemPossessedBy(oKiller, "RebelAllianceID"))==TRUE)
    {
    sFaction1 = "Rebels";
    }
else if (GetIsObjectValid(GetItemPossessedBy(oKiller, "GalaticEmpireID"))==TRUE)
    {
    sFaction1 = "Empire";
    }
else if (GetIsObjectValid(GetItemPossessedBy(oKiller, "FringeID"))==TRUE)
    {
    if (GetCampaignString("starwars", "CONTRACT", oKiller) == "Rebels")
        {
        sFaction1 = "Rebels";
        }
    else if (GetCampaignString("starwars", "CONTRACT", oKiller) == "Empire")
        {
        sFaction1 = "Empire";
        }
    else
        {
        sFaction1 = "None";
        }
    }
else
     {
     sFaction1 = "None";
     }
if (GetIsObjectValid(GetItemPossessedBy(oDead, "RebelAllianceID"))==TRUE)
    {
    sFaction2 = "Rebels";
    }
else if (GetIsObjectValid(GetItemPossessedBy(oDead, "GalaticEmpireID"))==TRUE)
    {
    sFaction2 = "Empire";
    }
else if (GetIsObjectValid(GetItemPossessedBy(oDead, "FringeID"))==TRUE)
    {
    if (GetCampaignString("starwars", "CONTRACT", oDead) == "Rebels")
        {
        sFaction2 = "Rebels";
        }
    else if (GetCampaignString("starwars", "CONTRACT", oDead) == "Empire")
        {
        sFaction2 = "Empire";
        }
    else
        {
        sFaction2 = "None";
        }
    }
else
     {
     sFaction1 = "None";
     }
if (GetIsPC(oKiller) == TRUE && sFaction1 != sFaction2 && sFaction1 != "None" && sFaction2 != "None")
    {
    object oEar = CreateItemOnObject("pug_ear", oKiller, 1, "ear_"+sFaction2+"_"+IntToString(nLevel));
    SetName(oEar, GetName(oDead)+"'s Ear ("+sFaction2+" Level "+IntToString(nLevel)+")");
    FloatingTextStringOnCreature(GetName(oKiller)+" of the "+sFaction1+" has killed "+GetName(oDead)+" of the "+sFaction2, oDead, TRUE);
    FloatingTextStringOnCreature(GetName(oKiller)+" of the "+sFaction1+" has killed "+GetName(oDead)+" of the "+sFaction2, oKiller, TRUE);
    }
//FloatingTextStringOnCreature("ear_"+sFaction2+"_"+IntToString(nLevel), oDead, TRUE);
//object oTestEar = CreateObject(OBJECT_TYPE_ITEM, "pug_ear", GetLocation(OBJECT_SELF), FALSE, "ear_"+sFaction2+"_"+IntToString(nLevel));
//SetName(oTestEar, GetName(oDead)+"'s Ear ("+sFaction2+" Level "+IntToString(nLevel)+")");
}
