#include "pug_inc"
#include "pug_points"
#include "nono_inc"

void Raise(object oPlayer)
{
        effect eVisual = EffectVisualEffect(VFX_IMP_RESTORATION);

        effect eBad = GetFirstEffect(oPlayer);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oPlayer);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oPlayer)), oPlayer);

        //Search for negative effects
        while(GetIsEffectValid(eBad))
        {
            if /*GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||*/
                (GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
                GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
                GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
                GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL)
                {
                    //Remove effect if it is negative.
                    RemoveEffect(oPlayer, eBad);
                }
            eBad = GetNextEffect(oPlayer);
        }
        //Fire cast spell at event for the specified target
        SignalEvent(oPlayer, EventSpellCastAt(OBJECT_SELF, SPELL_RESTORATION, FALSE));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oPlayer);
}

void ForceRaiseDead(object oPlayer)
{
        int iHP = GetSkillRank(SKILL_CONTROL, oPlayer);
        effect eVisual = EffectVisualEffect(VFX_IMP_RESTORATION);

        effect eBad = GetFirstEffect(oPlayer);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oPlayer);

        effect healHer = EffectHeal(iHP);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, healHer, oPlayer);

        //Fire cast spell at event for the specified target
        SignalEvent(oPlayer, EventSpellCastAt(OBJECT_SELF, SPELL_RESTORATION, FALSE));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oPlayer);
}

void main()
{

    object oPlayer = GetLastPlayerDied();
    object oKiller = GetLastKiller();

    if (GetLocalInt(oPlayer, "AUTOREZ") && d4() == 4)
    {
        ForceRaiseDead(oPlayer);
        return;
    }

    // * increment global tracking number of times that I died
    SetLocalInt(oPlayer, "NW_L_PLAYER_DIED", GetLocalInt(oPlayer, "NW_L_PLAYER_DIED") + 1);

    //record PVP
    ExecuteScript("getpvp",oPlayer);
    ExecuteScript("pug_bike_death", oPlayer);
    ExecuteScript("jedi_opdeath", oPlayer);
    SetLocalInt(oPlayer, "DEAD", TRUE);
    string sFaction1 = GetFaction(oPlayer, TRUE);
    string sFaction2 = GetFaction(oKiller, TRUE);
    string sFaction1FALSE = GetFaction(oPlayer, FALSE);
    string sFaction2FALSE = GetFaction(oKiller, FALSE);

    if (sFaction1 != sFaction2 && sFaction1 != "Fringe" && sFaction2 != "Fringe")
        {
        SetCampaignInt("swpcpoints", "PC_POINTS", GetCampaignInt("starwars", "PC_POINTS", oKiller)+GetHitDice(oPlayer), oKiller);
        SetCampaignInt("swpcpoints", "PC_POINTS_PLANET", GetCampaignInt("starwars", "PC_POINTS_KILL",oKiller)+GetHitDice(oPlayer), oKiller);
        }
    if (sFaction1FALSE != sFaction2FALSE && sFaction1FALSE != "Fringe" && sFaction2FALSE != "Fringe")
        {
        SetCampaignInt("swpcpoints", "POINTS_KILL_"+sFaction2FALSE, GetCampaignInt("starwars", "POINTS_KILL_"+sFaction2FALSE)+GetHitDice(oPlayer));
        SetCampaignInt("swpcpoints", "POINTS_"+sFaction2FALSE, GetCampaignInt("starwars", "POINTS_"+sFaction2FALSE)+GetHitDice(oPlayer));
        }

    UpdatePointsScore(oPlayer);
    ExecuteScript("pug_fac_set", oPlayer);

    if (GetHitDice(oPlayer) > 7)
        {
        ExecuteScript("pug_ear_drop",oPlayer);
        }

    // * BK: Automation Control. Autopcs ignore death
    if (GetLocalInt(oPlayer, "NW_L_AUTOMATION") == 10)
    {
        Raise(oPlayer);
        DelayCommand(1.0, ExecuteScript("crawl", OBJECT_SELF));
        return; // Raise and return
    }


    // * Handle Spirit of the Wood Death
     string sArea = GetTag(GetArea(oPlayer));


    // * make friendly to Each of the 3 common factions
    AssignCommand(oPlayer, ClearAllActions());
    // * Note: waiting for Sophia to make SetStandardFactionReptuation to clear all personal reputation
    if (GetStandardFactionReputation(STANDARD_FACTION_COMMONER, oPlayer) <= 10)
    {   SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad
        SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 80, oPlayer);
    }
    if (GetStandardFactionReputation(STANDARD_FACTION_MERCHANT, oPlayer) <= 10)
    {   SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad
        SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 80, oPlayer);
    }
    if (GetStandardFactionReputation(STANDARD_FACTION_DEFENDER, oPlayer) <= 10)
    {   SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad
        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 80, oPlayer);
    }

    DelayCommand(6.5, PopUpDeathGUIPanel(oPlayer, TRUE, TRUE, 0, "Press the respawn button to be revived at the infirmary at the cost of 10% of your credits to a maximum of 10,000 and 50 XP per level."));
}
