void ReloadMissile(object oShip, object oConsole)
{
SetLocalInt(oShip, "SHIP_BOMB",0);
AssignCommand(oConsole, ActionSpeakString("Missiles are ready.", TALKVOLUME_TALK));
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

object oBadGuy = GetLocalObject(oShip, sShip+"_TARGET_"+IntToString(nChoice));

    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, GetLocation(oBadGuy), TRUE, OBJECT_TYPE_CREATURE);
    int nPower = GetLocalInt(oShip, "SHIP_BOMB");
    int nHit = FALSE; int nDamage;effect eDam;
    int nRoll = d4(100);
    effect eExplode = EffectVisualEffect(VFX_IMP_PULSE_WIND);
    effect eHit = EffectVisualEffect(VFX_COM_HIT_ELECTRICAL);
    effect eExplode2 = EffectVisualEffect(VFX_FNF_FIREBALL);

    DelayCommand(0.8, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, GetLocation(oBadGuy)));
    DelayCommand(0.8, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode2, GetLocation(oBadGuy)));
    DelayCommand(0.8, AssignCommand(oBadGuy, PlaySound("explosion4")));

    if (nPower == 0 && GetDistanceBetween(oBadGuy, oShip) < 16.0)
        {
        AssignCommand(OBJECT_SELF, ActionSpeakString("Firing missile at "+GetName(oBadGuy)+".", TALKVOLUME_TALK));
        while (GetIsObjectValid(oTarget) == TRUE)
            {
            nDamage = nRoll + d4(20);
            eDam = EffectDamage(nDamage, DAMAGE_TYPE_NEGATIVE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eHit, oTarget);
            oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, GetLocation(oBadGuy), TRUE, OBJECT_TYPE_CREATURE);
            }

        SetLocalInt(oShip, "SHIP_BOMB", 1);
        DelayCommand(30.0, ReloadMissile(oShip, OBJECT_SELF));
        FloatingTextStringOnCreature("The next missile can be fired in 30 seconds", oPC, FALSE);
        }
    else if (nPower > 0)
        {
        AssignCommand(OBJECT_SELF, ActionSpeakString("Missile reloading, unable to fire.", TALKVOLUME_TALK));
        }
}
