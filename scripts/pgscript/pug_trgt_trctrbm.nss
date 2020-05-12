#include "pug_inc"
void ReloadMissile(object oShip, object oConsole)
{
SetLocalInt(oShip, "SHIP_BEAM",0);
AssignCommand(oConsole, ActionSpeakString("Tractor beam ready.", TALKVOLUME_TALK));
}

void RemoveShipStats(object oPC)
{
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
        SetPCNeutral(oPC);
        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 50, oPC);
}

void main()   //weps_chair
{
object oPC = GetPCSpeaker();
int nChoice = GetLocalInt(GetPCSpeaker(), "CONVO_CHOICE");
string sArea = GetTag(GetArea(oPC));
object oShip;
if (sArea == "pug_isd_1"){oShip = GetObjectByTag("PL_S_ISD");}
else if (sArea == "pug_mcc_1"){oShip = GetObjectByTag("PL_S_MCC");}
string sShip = GetStringRight(GetTag(oShip),3);
object oTarget = GetLocalObject(oShip, sShip+"_TARGET_"+IntToString(nChoice));

    int nPower = GetLocalInt(oShip, "SHIP_BEAM");

    effect eBeam = EffectBeam(VFX_BEAM_EVIL, oShip, BODY_NODE_HAND, FALSE );

    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eBeam, GetLocation(oTarget), 5.0);
    FloatingTextStringOnCreature(GetName(oShip)+" is attempting to use its tractor beam on you", oTarget, FALSE);

    if (nPower == 0 && GetDistanceBetween(oTarget, oShip) < 16.0 )
        {
        AssignCommand(OBJECT_SELF, ActionSpeakString("Firing tractor beam at "+GetName(oTarget)+".", TALKVOLUME_TALK));


        if (GetFaction(oPC, TRUE) == GetFaction(oTarget, TRUE) && GetIsPC(oTarget) )
            {
            DelayCommand(5.0, AssignCommand(oTarget, ClearAllActions()));
            DelayCommand(5.0, RemoveShipStats(oTarget));
            DelayCommand(5.5, AssignCommand(oTarget, ActionJumpToLocation(GetLocation(GetWaypointByTag("PL_L_"+sShip)))));
            DelayCommand(5.0, AssignCommand(OBJECT_SELF, ActionSpeakString(GetName(oTarget)+" has been brought into the hangar.", TALKVOLUME_TALK)));
            }
        else if ( GetIsSkillSuccessful(oTarget, 27, 28) && GetIsPC(oTarget))
            {
            DelayCommand(5.0, AssignCommand(oTarget, ClearAllActions()));
            DelayCommand(5.0, RemoveShipStats(oTarget));
            DelayCommand(5.5, AssignCommand(oTarget, ActionJumpToLocation(GetLocation(GetWaypointByTag("PL_L_"+sShip)))));
            DelayCommand(5.0, AssignCommand(OBJECT_SELF, ActionSpeakString(GetName(oTarget)+" has been brought into the hangar.", TALKVOLUME_TALK)));
            }
        else
            {
            DelayCommand(5.0,AssignCommand(OBJECT_SELF, ActionSpeakString(GetName(oTarget)+" has evaded our tractor beam.", TALKVOLUME_TALK)));
            }
        SetLocalInt(oShip, "SHIP_BEAM", 1);
        DelayCommand(30.0, ReloadMissile(oShip, OBJECT_SELF));
        FloatingTextStringOnCreature("The tractor beam will be ready to fire again in 30 seconds", oPC, FALSE);
        }
    else if (nPower > 0)
        {
        AssignCommand(OBJECT_SELF, ActionSpeakString("Tractor beam recharging, unable to fire.", TALKVOLUME_TALK));
        }
}
