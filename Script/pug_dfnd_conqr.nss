#include "pug_inc"
void main()
{
    string sControl = GetCampaignString("starwars", GetTag(OBJECT_SELF)+"_CONTROL");
    object oPC = GetEnteringObject();
    string sFaction;
    object oInArea, oDefender;
    int nAttack = GetLocalInt(OBJECT_SELF, "UNDER_ATTACK");

    if (GetIsObjectValid(GetItemPossessedBy(oPC, "RebelAllianceID"))==TRUE)
        {sFaction="Rebels";}
    else if (GetIsObjectValid(GetItemPossessedBy(oPC, "GalaticEmpireID"))==TRUE)
        {sFaction="Empire";}
    else if (GetIsPC(oPC)==FALSE && GetResRef(oPC)=="dfnd_snowtroop")
        {sFaction="Empire";}
    else if (GetIsPC(oPC)==FALSE && GetResRef(oPC)=="dfnd_atst")
        {sFaction="Empire";}
    else if (GetIsPC(oPC)==FALSE && GetResRef(oPC)=="dfnd_frefight")
        {sFaction="Rebels";}
    else if (GetIsPC(oPC)==FALSE && GetResRef(oPC)=="dfnd_liberator")
        {sFaction="Rebels";}

    else {sFaction="INVALID";}
    string sPCFac;

    if (sFaction != "INVALID" && sControl != sFaction && GetIsPC(oPC)==TRUE && nAttack == FALSE)
        {
        //FloatingTextStringOnCreature("Hold this area for 40 seconds to conquer it for the "+sFaction, oPC, FALSE);
        SetLocalInt(OBJECT_SELF, "UNDER_ATTACK", TRUE);
        oInArea = GetFirstPC();
        oDefender = GetFirstObjectInArea(GetArea(oPC));
        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 0, oPC);
        while (GetIsObjectValid(oInArea) == TRUE)
            {
            if (GetStringLeft(GetTag(GetArea(oPC)), 7) == GetStringLeft(GetTag(GetArea(oInArea)), 7))
                {
                FloatingTextStringOnCreature(GetName(oPC)+" is taking over "+GetName(GetArea(oPC)), oInArea, FALSE);
                }
            oInArea = GetNextPC();
            }

        while (GetIsObjectValid(oDefender) == TRUE)
            {
            sPCFac = GetNPCFaction(oDefender);
            if (GetStringLeft(GetTag(GetArea(oPC)), 7) == GetStringLeft(GetTag(GetArea(oDefender)), 7) && GetStringLeft(GetResRef(oDefender), 4) == "dfnd" && sFaction != sPCFac)
                {
                //SetPCDislike(oPC, oDefender);
                AssignCommand(oDefender, ActionAttack(oPC, FALSE));
                }
            oDefender = GetNextObjectInArea(GetArea(oPC));
            }

        if (GetStandardFactionReputation(STANDARD_FACTION_COMMONER, oPC) != 50)
            {
            SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 50, oPC);
            }
        SetLocalInt(oPC, "FACTIONIFY", 3);
        //DelayCommand(40.0, ConquerArea(oPC, GetArea(oPC), OBJECT_SELF, sFaction));
        ConquerArea(oPC, GetArea(oPC), OBJECT_SELF, sFaction, 60);

        object oConsole = GetObjectByTag(GetTag(GetArea(oPC))+"_GLOW");
        effect eBad = GetFirstEffect(oConsole);
        while(GetIsEffectValid(eBad)==TRUE)
            {
                if (GetEffectType(eBad) == EFFECT_TYPE_VISUALEFFECT)
                    {
                        RemoveEffect(oConsole, eBad);
                    }
                eBad = GetNextEffect(oConsole);
            }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_AURA_PULSE_RED_BLACK, FALSE)), oConsole, 12000.0);

        }

    else if (sFaction != "INVALID" && sControl == sFaction && nAttack == TRUE)
        {
        //AssignCommand(OBJECT_SELF, ActionSpeakString("The base has been reclaimed by the "+sFaction, TALKVOLUME_TALK));
        oInArea = GetFirstPC();

        while (GetIsObjectValid(oInArea) == TRUE)
            {
            if (GetStringLeft(GetTag(GetArea(oPC)), 7) == GetStringLeft(GetTag(GetArea(oInArea)), 7))
                {
                FloatingTextStringOnCreature(GetName(GetArea(oPC))+" has been reclaimed by the "+sFaction, oInArea, FALSE);
                }
            oInArea = GetNextPC();
            }
        BaseControl(GetTag(GetArea(oPC)));
        SetLocalInt(OBJECT_SELF, "STOPPED_ATTACK", TRUE);
        }
}
