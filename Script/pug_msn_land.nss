#include "nwnx_creature"
#include "aps_include"
#include "qx_ship_stat_inc"
void main()
{
    object oPC = GetPCSpeaker();
    object oPlanet = GetLocalObject(oPC, "COM_PLANET");
    string sPlanet = GetTag(oPlanet);
        string sLaunchTag = GetTag(GetNearestObject(OBJECT_TYPE_WAYPOINT, oPlanet, 1));
        string sWaypoint = "PL_L_" + GetStringRight(sLaunchTag, GetStringLength(sLaunchTag) - 5)+"_mission";
// Landing

    if (oPC != OBJECT_INVALID && GetIsObjectValid(GetWaypointByTag(sWaypoint)))
    {
        SetLocalInt(oPC, "SHIP_FLYING", FALSE);
        int nType = GetLocalInt(oPlanet, "LANDING");

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

        //SetCurrentHitPoints(oPC, GetPersistentInt(oPC, SHIP_PLAYER_HP));
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
