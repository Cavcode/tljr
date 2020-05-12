#include "nwnx_creature"
#include "pug_inc"
//#include "aps_include"
#include "qx_ship_stat_inc"
#include "nwnx_object"
void main()
{
    object oPC = GetPCSpeaker();
    object oPlanet = GetLocalObject(oPC, "COM_PLANET");
    string sPlanet = GetTag(oPlanet);
    string sLaunchTag = GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPlanet, 1));
    string sWaypoint = "PL_L_" + GetStringRight(sLaunchTag, GetStringLength(sLaunchTag) - 5);
// Landing

    if (oPC != OBJECT_INVALID && GetIsObjectValid(GetWaypointByTag(sWaypoint)))
    {
        SetLocalInt(oPC, "SHIP_FLYING", FALSE);
        int nType = GetLocalInt(oPlanet, "LANDING");
        string sControl1 = GetCampaignString("starwars", sPlanet+"_1_CONTROL");
        string sControl2 = GetCampaignString("starwars", sPlanet+"_2_CONTROL");
        string sControl3 = GetCampaignString("starwars", sPlanet+"_3_CONTROL");
        string sFaction = GetFaction(oPC, TRUE);
        ClearAllActions(TRUE);
        //To set up these difference planet types, set the local int variable LANDING on the planet placeable
        //to one of the following numbers:

        //Type 1 planet is when the controlling faction of area 1 will land at the regular spot and everyone else goes to another
        if (nType == 1 && sFaction != sControl1)
            {
            sWaypoint = sWaypoint+"_other";
            }
        //Type 2 planet is when the controlling faction of area 2 will land at the regular spot and everyone else goes to another
        else if (nType == 2 && sFaction != sControl2)
            {
            sWaypoint = sWaypoint+"_other";
            }
        //Type 3 planet is when the controlling faction of area 3 will land at the regular spot and everyone else goes to another
        else if (nType == 3 && sFaction != sControl3)
            {
            sWaypoint = sWaypoint+"_other";
            }
        //Type 4 planet is when the controlling faction of the entire planet is always the Empire and any imperial
        //will land at the regular spot and everyone else goes to another
        else if (nType == 4 && sFaction != "Empire")
            {
            sWaypoint = sWaypoint+"_other";
            }
        //Type 5 planet is when the controlling faction of the entire planet is always the Rebels and any rebel
        //will land at the regular spot and everyone else goes to another
        else if (nType == 5 && sFaction != "Rebels")
            {
            sWaypoint = sWaypoint+"_other";
            }
        //Type 6 planet is when the controlling faction of the entire planet is always the Empire and any stormtrooper
        //will land at the regular spot and everyone else goes to another
        else if (nType == 6 && GetIsObjectValid(GetItemPossessedBy(oPC, "StormtrooperBadge")) == FALSE)
            {
            sWaypoint = sWaypoint+"_other";
            }
            //FloatingTextStringOnCreature("Planet: "+sControl1+" You: "+sFaction+" Number: "+IntToString(nType)+" Landing: "+sWaypoint+" Tag: "+sPlanet, oPC, FALSE);
        //AssignCommand(oPC, JumpToObject(GetWaypointByTag(sWaypoint), TRUE));
        int z = 1; object oHench = GetHenchman(oPC, 1);
        while (GetIsObjectValid(oHench) == TRUE)
            {
                    effect eHenchPoly = GetFirstEffect(oHench);
                    while (GetIsEffectValid(eHenchPoly))
                    {
                        if (GetEffectType(eHenchPoly) == EFFECT_TYPE_POLYMORPH)
                        {
                            RemoveEffect(oHench, eHenchPoly);
                        }
                        else if (GetEffectType(eHenchPoly) == EFFECT_TYPE_AC_INCREASE)
                        {
                            RemoveEffect(oHench, eHenchPoly);
                        }
                        else if (GetEffectType(eHenchPoly) == EFFECT_TYPE_ATTACK_INCREASE)
                        {
                            RemoveEffect(oHench, eHenchPoly);
                        }
                        else if (GetEffectType(eHenchPoly) == EFFECT_TYPE_TEMPORARY_HITPOINTS)
                        {
                            RemoveEffect(oHench, eHenchPoly);
                        }
                        else if (GetEffectType(eHenchPoly) == EFFECT_TYPE_MOVEMENT_SPEED_INCREASE)
                        {
                            RemoveEffect(oHench, eHenchPoly);
                        }
                        else if (GetEffectType(eHenchPoly) == EFFECT_TYPE_DAMAGE_REDUCTION)
                        {
                            RemoveEffect(oHench, eHenchPoly);
                        }
                        else if (GetEffectType(eHenchPoly) == EFFECT_TYPE_ABILITY_INCREASE)
                        {
                            RemoveEffect(oHench, eHenchPoly);
                        }
                        eHenchPoly = GetNextEffect(oHench);
                    }
            NWNX_Creature_SetMovementRate(oHench, GetLocalInt(oHench, "MOVEMENT_RATE"));
            DelayCommand(4.0, ForceRest(oHench));
            AssignCommand(oHench, ActionJumpToObject(GetWaypointByTag(sWaypoint), TRUE));
            z = z+1;
            oHench = GetHenchman(oPC, z);
            }
            //Handle Summoned Help
            oHench = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC, 1);
            if (GetIsObjectValid(oHench) == TRUE)
            {
                    effect eHenchPoly = GetFirstEffect(oHench);
                    while (GetIsEffectValid(eHenchPoly))
                    {
                        if (GetEffectType(eHenchPoly) == EFFECT_TYPE_POLYMORPH)
                        {
                            RemoveEffect(oHench, eHenchPoly);
                        }
                        else if (GetEffectType(eHenchPoly) == EFFECT_TYPE_AC_INCREASE)
                        {
                            RemoveEffect(oHench, eHenchPoly);
                        }
                        else if (GetEffectType(eHenchPoly) == EFFECT_TYPE_ATTACK_INCREASE)
                        {
                            RemoveEffect(oHench, eHenchPoly);
                        }
                        else if (GetEffectType(eHenchPoly) == EFFECT_TYPE_TEMPORARY_HITPOINTS)
                        {
                            RemoveEffect(oHench, eHenchPoly);
                        }
                        else if (GetEffectType(eHenchPoly) == EFFECT_TYPE_MOVEMENT_SPEED_INCREASE)
                        {
                            RemoveEffect(oHench, eHenchPoly);
                        }
                        else if (GetEffectType(eHenchPoly) == EFFECT_TYPE_DAMAGE_REDUCTION)
                        {
                            RemoveEffect(oHench, eHenchPoly);
                        }
                        else if (GetEffectType(eHenchPoly) == EFFECT_TYPE_ABILITY_INCREASE)
                        {
                            RemoveEffect(oHench, eHenchPoly);
                        }
                        eHenchPoly = GetNextEffect(oHench);
                    }
            NWNX_Creature_SetMovementRate(oHench, GetLocalInt(oHench, "MOVEMENT_RATE"));
            DelayCommand(4.0, ForceRest(oHench));
            AssignCommand(oHench, ActionJumpToObject(GetWaypointByTag(sWaypoint), TRUE));
            }

        effect ePolymorph = GetFirstEffect(oPC);
        while (GetIsEffectValid(ePolymorph))
        {
            if (GetEffectType(ePolymorph) == EFFECT_TYPE_POLYMORPH)
            {
                AssignCommand(oPC, ClearAllActions());
                RemoveEffect(oPC, ePolymorph);
            }
            else if (GetEffectType(ePolymorph) == EFFECT_TYPE_AC_INCREASE)
            {
                AssignCommand(oPC, ClearAllActions());
                RemoveEffect(oPC, ePolymorph);
            }
            else if (GetEffectType(ePolymorph) == EFFECT_TYPE_ATTACK_INCREASE)
            {
                AssignCommand(oPC, ClearAllActions());
                RemoveEffect(oPC, ePolymorph);
            }
            else if (GetEffectType(ePolymorph) == EFFECT_TYPE_TEMPORARY_HITPOINTS)
            {
                AssignCommand(oPC, ClearAllActions());
                RemoveEffect(oPC, ePolymorph);
            }
            else if (GetEffectType(ePolymorph) == EFFECT_TYPE_MOVEMENT_SPEED_INCREASE)
            {
                AssignCommand(oPC, ClearAllActions());
                RemoveEffect(oPC, ePolymorph);
            }
            else if (GetEffectType(ePolymorph) == EFFECT_TYPE_DAMAGE_REDUCTION)
                {
                AssignCommand(oPC, ClearAllActions());
                RemoveEffect(oPC, ePolymorph);
                }
            else if (GetEffectType(ePolymorph) == EFFECT_TYPE_ABILITY_INCREASE)
                {
                AssignCommand(oPC, ClearAllActions());
                RemoveEffect(oPC, ePolymorph);
                }
            ePolymorph = GetNextEffect(oPC);
        }
        //This will reset the PC to neutral to all other PCs
        int currentHP = NWNX_Object_GetInt(oPC,SHIP_PLAYER_HP);
        NWNX_Object_SetCurrentHitPoints(oPC, currentHP);
        SetPCNeutral(oPC);
        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 50, oPC);
        AssignCommand(oPC, JumpToObject(GetWaypointByTag(sWaypoint), TRUE));
        NWNX_Creature_SetMovementRate(oPC, GetLocalInt(oPC, "MOVEMENT_RATE"));
        SetLocalInt(oPC, "PILOTING_SHIP", FALSE);
        //if (GetKnowsFeat(1345, oPC) == TRUE)
        //{
        //    RemoveKnownFeat(oPC, 1345);
        //}
        DelayCommand(4.0, ForceRest(oPC));
        if (GetLevelByClass(CLASS_TYPE_MONK,oPC) >= 3)
        {
            NWNX_Creature_AddFeatByLevel(oPC, FEAT_MONK_ENDURANCE, 3);
        }
        if (GetLevelByClass(CLASS_TYPE_BARBARIAN,oPC) >= 1)
        {
            NWNX_Creature_AddFeatByLevel(oPC, FEAT_BARBARIAN_ENDURANCE, 1);
        }
    }

    // Activating the Planet Convo
    oPC = GetEnteringObject();
    if (oPC != OBJECT_INVALID)
    {
        BeginConversation("ser_pl_landing", oPC);
        return;
    }

}
