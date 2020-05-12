#include "pug_inc"
#include "NW_I0_SPELLS"
#include "x2_inc_spellhook"

void main()
{

   /* if (!X2PreSpellCastCode())
    {
    // If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    } */

// End of Spell Cast Hook


    //Declare major variables
    object oTarget = GetSpellTargetObject();
    object oPC = OBJECT_SELF;
    effect eRay = EffectBeam(VFX_BEAM_SILENT_MIND, OBJECT_SELF, BODY_NODE_HAND);
    ExecuteScript("clearactions", oTarget);

//This will cancel the pilot control of a capital ship from the inside.
    int nLand = FALSE;
if (GetTag(oTarget) == "PL_S_ISD" && GetFaction(oPC, TRUE) == "Empire")
    {nLand = TRUE;}
else if (GetTag(oTarget) == "PL_S_MCC" && GetFaction(oPC, TRUE) == "Rebels")
    {nLand = TRUE;}
else if (GetStringLeft(GetTag(oTarget),10) == "PL_S_Ghost")
    {nLand = TRUE;}

if (GetLocalInt(oPC, "NAVIGATE")==TRUE)
    {
    if (nLand == TRUE)
        {
        object oClone = GetLocalObject(oPC, "CLONE");
        AssignCommand(oPC, ActionJumpToLocation(GetLocation(oClone)));
        string sBase; object oShip;
        if (GetTag(GetArea(oClone)) == "pug_isd_1"){oShip = GetObjectByTag("PL_S_ISD");}
        else if (GetTag(GetArea(oClone)) == "pug_mcc_1"){oShip = GetObjectByTag("PL_S_MCC");}
        effect ePolymorph = GetFirstEffect(oPC);
            while (GetIsEffectValid(ePolymorph))
            {
                if (GetEffectType(ePolymorph) == EFFECT_TYPE_INVISIBILITY)
                    {
                    RemoveEffect(oPC, ePolymorph);
                    }
                else if (GetEffectType(ePolymorph) == EFFECT_TYPE_POLYMORPH)
                    {
                    RemoveEffect(oPC, ePolymorph);
                    }
                ePolymorph = GetNextEffect(oPC);
            }
        SetCutsceneMode(oPC, FALSE);
        if (GetPlotFlag(oPC) == TRUE)
            {
            SetPlotFlag(oPC, FALSE);
            }
        if (GetImmortal(oPC) == TRUE)
            {
            SetImmortal(oPC, FALSE);
            }
        SetLocalInt(oPC, "NAVIGATE", FALSE);
        SetLocalInt(oShip, "BUSY", FALSE);

        SetCreatureAppearanceType(oPC, GetLocalInt(oPC, "APPEARANCE"));
        /*if (GetIsObjectValid(GetLocalObject(oPC, "CLONE")) == TRUE && GetIsDead(GetLocalObject(oPC, "CLONE")) == FALSE)
            {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(9000, DAMAGE_TYPE_MAGICAL,DAMAGE_POWER_PLUS_TWENTY), oPC);
            }
        else if (GetIsObjectValid(GetLocalObject(oPC, "CLONE")) == FALSE)
            {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(9000, DAMAGE_TYPE_MAGICAL,DAMAGE_POWER_PLUS_TWENTY), oPC);
            }*/
        DestroyObject(oClone);
        ExecuteScript("clearactions", oShip);
        }
    }

else if (GetDistanceBetween(oPC, oTarget) > 11.0)
    {
    AssignCommand(oPC, ActionMoveToLocation(GetLocation(oTarget)));
    FloatingTextStringOnCreature("You are too far from your target.", oPC, FALSE);
    }

else if (GetObjectType(oTarget)== OBJECT_TYPE_PLACEABLE)
    {
    SetLocalObject(oPC, "COM_PLANET", oTarget);
    AssignCommand(oPC, ActionStartConversation(oPC, "ser_pl_landing", TRUE, FALSE));
    FloatingTextStringOnCreature("Opening communication channel with "+GetName(oTarget), oPC, FALSE);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eRay, oTarget, 1.7);
    }
else if (oTarget == oPC)
    {
    AssignCommand(oPC, ActionStartConversation(oPC, "pug_ship", TRUE, FALSE));
    }
else if (GetObjectType(oTarget)== OBJECT_TYPE_CREATURE && GetStringLeft(GetTag(oTarget),5) == "PL_S_")
    {
    SetLocalObject(oPC, "COM_PLANET", oTarget);
    AssignCommand(oPC, ActionStartConversation(oPC, "ser_pl_landing", TRUE, FALSE));
    FloatingTextStringOnCreature("Opening communication channel with "+GetName(oTarget), oPC, FALSE);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eRay, oTarget, 1.7);
    }
else
    {
    FloatingTextStringOnCreature("You cannot mount another player", oPC, FALSE);
    }

}
