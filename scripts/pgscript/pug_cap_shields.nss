#include "pug_inc"
void ResetShields(object oShip)
    {
    SetLocalInt(oShip, "SHIELDS_UP", FALSE);
    }

void main()
{
object oPC = GetLastUsedBy();
//int nPilot = GetSkillRank( 27, oPC, FALSE);
string sArea = GetTag(GetArea(oPC));
object oShip;
if (sArea == "pug_isd_1"){oShip = GetObjectByTag("PL_S_ISD");}
else if (sArea == "pug_mcc_1"){oShip = GetObjectByTag("PL_S_MCC");}
int nBusy = GetLocalInt(oShip, "SHIELDS_UP");
string sShip = GetStringRight(GetTag(oShip),3);
int nBroken = GetLocalInt(GetObjectByTag(sShip+"_SHIELDS"), "BROKEN");
int nAble=FALSE;

if (GetFaction(oPC,TRUE) == GetNPCFaction(oShip)){nAble = TRUE;}

if (nAble == FALSE)
    {
    AssignCommand(OBJECT_SELF, ActionSpeakString("You do not have access to this control.", TALKVOLUME_TALK));
    }
else if (nBroken == TRUE)
    {
    AssignCommand(OBJECT_SELF, ActionSpeakString("Shield battery damaged, unable to raise shields.", TALKVOLUME_TALK));
    }
else if (nBusy == TRUE)
    {
    AssignCommand(OBJECT_SELF, ActionSpeakString("Shield battery recharging.", TALKVOLUME_TALK));
    }
else if (nBusy == FALSE && nBroken == FALSE && nAble == TRUE)
    {
        effect eShield = EffectDamageReduction(50, DAMAGE_POWER_PLUS_TEN, 400);
        effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BLUE);
        effect eLink = EffectLinkEffects(eVis, eShield);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oShip, 60.0);
        SetLocalInt(oShip, "SHIELDS_UP", TRUE);
        DelayCommand(300.0, ResetShields(oShip));
        AssignCommand(OBJECT_SELF, ActionSpeakString("Shields activated.", TALKVOLUME_TALK));
    }
}
