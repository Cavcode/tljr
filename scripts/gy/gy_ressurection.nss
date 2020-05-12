#include "nw_i0_plot"
#include "x0_i0_henchman"

void ApplyPenalty(object oDead);
void NerfSkills(object oPC);
void HenchmanOnDeath(object oRespawner);

void main()
{
    string sRespawnWaypointTag = "gy_RespawnPoint";
    object oPC = GetLastRespawnButtonPresser();
    if (!GetIsPC(oPC)) return;
    int bPVP = GetLocalInt(oPC,"gy_PVP");
    string sFaction;
    object oWaypoint;

    ApplyPenalty(oPC);
    HenchmanOnDeath(oPC);
    SetLocalInt(oPC, "DEAD", FALSE);
        if (GetPhenoType(oPC) == 22)
            {
            SetPhenoType(GetLocalInt(oPC, "PHENO"), oPC);
            }

  /*  if (bPVP)
    {
        //VFX_DUR_CUTSCENE_INVISIBILITY
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oPC);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(5), oPC);
      //  effect eEffect = EffectStunned();
      //  ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, oPC, 10.0f);
        effect eDaze = EffectDazed();
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDaze, oPC, 60.0f);
    }
    else
    {     */
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

        int nBusy1 = GetLocalInt(GetWaypointByTag("DEAD_"+sFaction+"_1"), "OCCUPIED1");
        int nBusy2 = GetLocalInt(GetWaypointByTag("DEAD_"+sFaction+"_2"), "OCCUPIED2");
        int nBusy3 = GetLocalInt(GetWaypointByTag("DEAD_"+sFaction+"_3"), "OCCUPIED3");
        int nBusy4 = GetLocalInt(GetWaypointByTag("DEAD_"+sFaction+"_4"), "OCCUPIED4");

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
        //oWaypoint = GetNearestObjectByTag(sRespawnWaypointTag,oPC);\

        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oPC);
        effect eInvis = EffectInvisibility(INVISIBILITY_TYPE_NORMAL);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eInvis, oPC,1.5);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(5), oPC);
        AssignCommand(oPC,ActionJumpToLocation(GetLocation(oWaypoint)));

        SetCutsceneMode(oPC, TRUE, FALSE);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneParalyze(), oPC, 15.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_BUBBLES, FALSE), oPC, 15.0);
        FadeToBlack(oPC, FADE_SPEED_FAST);
        DelayCommand(4.0, FadeFromBlack(oPC, FADE_SPEED_SLOW));
        DelayCommand(7.0, FadeToBlack(oPC, FADE_SPEED_FAST));
        DelayCommand(12.0, FadeFromBlack(oPC, FADE_SPEED_MEDIUM));
        DelayCommand(15.0, SetCutsceneMode(oPC, FALSE, TRUE));
        DelayCommand(15.0, AssignCommand(oPC,ActionJumpToLocation(GetLocation(GetWaypointByTag("DEAD_"+sFaction)))));

        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(oPC)), oPC);

        if (GetImmortal(oPC) == TRUE)
            {
            SetImmortal(oPC, FALSE);
            }
        if (GetPlotFlag(oPC) == TRUE)
            {
            SetPlotFlag(oPC, FALSE);
            }
    //}
    SetLocalInt(oPC,"gy_PVP",FALSE);
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

void ApplyPenalty(object oDead)
{
    int nXP = GetXP(oDead);
    int nPenalty = 100 * GetHitDice(oDead);
    int nHD = GetHitDice(oDead);
    // * You can not lose a level with this respawning
    int nMin = ((nHD * (nHD - 1)) / 2) * 1000;

    int nNewXP = nXP - nPenalty;
    if (nNewXP < nMin)
       nNewXP = nMin;
    SetXP(oDead, nNewXP);
    int nGoldToTake =    FloatToInt(0.10 * GetGold(oDead));
    // * a cap of 10 000gp taken from you
    if (nGoldToTake > 10000)
    {
        nGoldToTake = 10000;
    }
    AssignCommand(oDead, TakeGoldFromCreature(nGoldToTake, oDead, TRUE));
    DelayCommand(4.0, FloatingTextStrRefOnCreature(58299, oDead, FALSE));
    DelayCommand(4.8, FloatingTextStrRefOnCreature(58300, oDead, FALSE));

}

void HenchmanOnDeath(object oRespawner)
{
    int i = 0;
    object oHench;
    do
    {
        i++;
        oHench  = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oRespawner, i);
        if (GetIsObjectValid(oHench) == TRUE)
        {
            SetIsTemporaryNeutral(oRespawner, oHench, FALSE);
            if (GetIsFollower(oHench) == TRUE)
            {
                RemoveHenchman(oRespawner, oHench);
            }
        }

    }
    while (GetIsObjectValid(oHench) == TRUE);
}
