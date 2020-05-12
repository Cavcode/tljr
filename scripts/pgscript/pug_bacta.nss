void NerfSkills(object oPC);

void main()
{
object oPC = GetLastUsedBy();string sFaction;object oWaypoint;
location lExit = GetLocation(OBJECT_SELF);

        if (GetStringLeft(GetName(GetArea(oPC)),8) == "Tatooine")
            {sFaction="Fringe";}
        else if (GetStringLeft(GetName(GetArea(oPC)),5) == "Yavin")
            {sFaction="Rebels";}
        else if (GetStringLeft(GetName(GetArea(oPC)),9) == "Coruscant")
            {sFaction="Empire";}
        else if (GetIsObjectValid(GetItemPossessedBy(oPC, "RebelAllianceID"))==TRUE)
            {sFaction="Rebels";}
        else if (GetIsObjectValid(GetItemPossessedBy(oPC, "GalaticEmpireID"))==TRUE)
            {sFaction="Empire";}
        else if (GetIsObjectValid(GetItemPossessedBy(oPC, "FringeID"))==TRUE)
            {sFaction="Fringe";}

        int nBusy1 = GetLocalInt(GetWaypointByTag("DEAD_"+sFaction), "OCCUPIED1");
        int nBusy2 = GetLocalInt(GetWaypointByTag("DEAD_"+sFaction), "OCCUPIED2");
        int nBusy3 = GetLocalInt(GetWaypointByTag("DEAD_"+sFaction), "OCCUPIED3");
        int nBusy4 = GetLocalInt(GetWaypointByTag("DEAD_"+sFaction), "OCCUPIED4");
        location lTank = GetLocation(GetWaypointByTag("DEAD_"+sFaction));

        if (nBusy1 == FALSE)
            {
            oWaypoint = GetWaypointByTag("DEAD_"+sFaction+"_1");
            }
        else if (nBusy2 == FALSE)
            {
            oWaypoint = GetWaypointByTag("DEAD_"+sFaction+"_2");
            }
        else if (nBusy3 == FALSE)
            {
            oWaypoint = GetWaypointByTag("DEAD_"+sFaction+"_3");
            }
        else if (nBusy4 == FALSE)
            {
            oWaypoint = GetWaypointByTag("DEAD_"+sFaction+"_4");
            }
        else
            {
            oWaypoint = GetWaypointByTag("DEAD_"+sFaction);
            }

        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDispelMagicAll(40), oPC);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEALING_M, FALSE), oPC, 2.0);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(oPC)-GetCurrentHitPoints(oPC)), oPC);
        SetLocalInt(oPC, "REVIVE_PENALTY", 0);

        effect eBad = GetFirstEffect(oPC);
        while(GetIsEffectValid(eBad)==TRUE)
        {
            if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE)
                {
                    RemoveEffect(oPC, eBad);
                }
            eBad = GetNextEffect(oPC);
        }

        AssignCommand(oPC,ActionJumpToLocation(GetLocation(oWaypoint)));

        SetCutsceneMode(oPC, TRUE, FALSE);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneParalyze(), oPC, 21.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_BUBBLES, FALSE), oPC, 21.0);
        FadeToBlack(oPC, FADE_SPEED_FAST);
        DelayCommand(4.0, FadeFromBlack(oPC, FADE_SPEED_SLOW));
        DelayCommand(8.0, FadeToBlack(oPC, FADE_SPEED_FAST));
        DelayCommand(14.0, FadeFromBlack(oPC, FADE_SPEED_MEDIUM));
        DelayCommand(19.0, SetCutsceneMode(oPC, FALSE, TRUE));
        DelayCommand(21.0, AssignCommand(oPC,ActionJumpToLocation(lExit)));

        if (GetImmortal(oPC) == TRUE)
            {
            SetImmortal(oPC, FALSE);
            }
        if (GetPlotFlag(oPC) == TRUE)
            {
            SetPlotFlag(oPC, FALSE);
            }

        ForceRest(oPC);
        //NerfSkills(oPC);
}

void NerfSkills(object oPC)
{
    effect  eSkillPenalty;
    if (GetHasSkill(SKILL_PICK_POCKET, oPC))
    {
        eSkillPenalty  = EffectSkillDecrease(SKILL_PICK_POCKET, 100);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSkillPenalty, oPC);
    }
}
