void HyperspaceJump(object oPC, location lEnter, string sArea);

void main()
{
string sLoc = "hyperdrive_1";
location lWP = GetLocation(GetWaypointByTag(sLoc));
object oPC = GetPCSpeaker();
effect eVis = EffectVisualEffect(VFX_IMP_KNOCK);
string sArea = GetName(GetArea(oPC));
SetCutsceneMode(oPC, TRUE, FALSE);
FloatingTextStringOnCreature("Calculating path. Jump to lightspeed in 8 seconds.", oPC, FALSE);
ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oPC, 8.0);
//DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oPC, 8.0));
DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oPC, 8.0));
DelayCommand(4.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oPC, 8.0));
DelayCommand(5.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oPC, 8.0));
DelayCommand(5.5, AssignCommand(oPC, PlaySound("hyperstartreb")));
DelayCommand(6.25, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oPC, 8.0));
DelayCommand(7.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oPC, 8.0));
DelayCommand(7.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oPC, 8.0));
DelayCommand(7.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDisappear(1),oPC, 2.0));
DelayCommand(8.3, SetCutsceneMode(oPC, FALSE, FALSE));
DelayCommand(8.0, HyperspaceJump(oPC, lWP, sArea));
}

void HyperspaceJump(object oPC, location lEnter, string sArea)
{
if ( GetName(GetArea(oPC)) == sArea && GetIsDead(oPC) == FALSE)
    {
    AssignCommand(oPC, ActionJumpToLocation(lEnter));
    DelayCommand(2.0,ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectAppear(1),oPC, 0.0));
    }
}

