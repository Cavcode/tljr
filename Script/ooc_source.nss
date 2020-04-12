//MadRabbits OOC Lounge

//If set to 1, spell casting will be disabled in the OOC Lounge. Set to 0 to allow
//spell casting
//Default = 1;
const int OOC_LOUNGE_SPELLCASTING_OFF = 1;

//Change this to alter the visual effect associated with porting back and forth
//Default = VFX_FNF_SMOKE_PUFF
const int OOC_LOUNGE_VISUAL_EFFECT = VFX_FNF_SMOKE_PUFF;

//Tag of the OOC Lounge Porter item. If you want to use a different item, place
//the tag here
//Default = "mr_ooc_lounge_item"
const string OOC_LOUNGE_ITEM = "mr_ooc_lounge_it";

//Tag of waypoint for porting
//Default = "mr_wp_ooc_lounge"
const string OOC_LOUNGE_PORT_IN = "mr_wp_ooc_lounge";

//Tag of the actual OOC Lounge area
//Default = "mr_ooc_lounge"
const string OOC_LOUNGE_TAG = "mr_ooc_lounge";

//This is the message sent to the player when he ports to the OOC Lounge
const string OOC_LOUNGE_PORT_IN_MESSAGE = "You have entered the OOC Lounge. All Actions are now considered OOC.";

//Same as above, but when the player leaves the OOC Lounge
const string OOC_LOUNGE_PORT_OUT_MESSAGE = "You have left the OOC Lounge. All Actions are now considered IC.";


//On activate command for the on activate item script
void OOCLoungeActivate(object oActivator, object oItem);

//On Enter Command for the on enter event for the OOC Lounge
void OOCLoungeOnEnter(object oEnteringObject);

void OOCLoungeApplyEffect(object oTarget)
{
    effect eSpellCasting = SupernaturalEffect(EffectSpellFailure(100, SPELL_SCHOOL_GENERAL));
    AssignCommand(oTarget, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSpellCasting, oTarget));

}

void OOCLoungeClearEffect(object oTarget)
{
    effect eEffect;
    object oCreator;
    int nSubtype;
    int nType;

    eEffect = GetFirstEffect(oTarget);

    while (GetIsEffectValid(eEffect)) {
        oCreator = GetEffectCreator(eEffect);
        nSubtype = GetEffectSubType(eEffect);
        nType = GetEffectType(eEffect);

        if (oCreator == oTarget &&
            nSubtype == SUBTYPE_SUPERNATURAL &&
            nType == EFFECT_TYPE_SPELL_FAILURE) {
                RemoveEffect(oTarget, eEffect); }

    eEffect = GetNextEffect(oTarget); }
}

void OOCLoungeStoreData(object oTarget, int nOnOrOff)
{
    string sName = GetName(oTarget);
    location lLoc = GetLocation(oTarget);
    object oRecorder = GetWaypointByTag(OOC_LOUNGE_PORT_IN);
    string sFlag = "FLAG_" + sName;
    string sLocation = "LOC_" + sName;

    if (nOnOrOff) {
        SetLocalInt(oRecorder, sFlag, 1);
        SetLocalLocation(oRecorder, sLocation, lLoc);
        return; }
    if (!nOnOrOff) {
        DeleteLocalInt(oRecorder, sFlag);
        DeleteLocalLocation(oRecorder, sLocation);
        return; }
}

int OOCLoungeGetFlag(object oTarget)
{
    string sName = GetName(oTarget);
    object oRecorder = GetWaypointByTag(OOC_LOUNGE_PORT_IN);
    string sFlag = "FLAG_" + sName;
    int nReturn = GetLocalInt(oRecorder, sFlag);
    return nReturn;
}

void OOCLoungePort(object oTarget)
{
    object oPortIn = GetObjectByTag(OOC_LOUNGE_PORT_IN);
    location lPortIn = GetLocation(oPortIn);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(OOC_LOUNGE_VISUAL_EFFECT), oTarget);
    FloatingTextStringOnCreature(OOC_LOUNGE_PORT_IN_MESSAGE, oTarget, FALSE);
    AssignCommand(oTarget, ClearAllActions());
    AssignCommand(oTarget, JumpToLocation(lPortIn));
}

void OOCLoungeReturn(object oTarget)
{
    string sName = GetName(oTarget);
    object oRecorder = GetWaypointByTag(OOC_LOUNGE_PORT_IN);
    location lReturn = GetLocalLocation(oRecorder, "LOC_" + sName);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(OOC_LOUNGE_VISUAL_EFFECT), oTarget);
    FloatingTextStringOnCreature(OOC_LOUNGE_PORT_OUT_MESSAGE, oTarget, FALSE);
    AssignCommand(oTarget, ClearAllActions());
    AssignCommand(oTarget, JumpToLocation(lReturn));
}

void OOCLoungeActivate(object oActivator, object oItem)
{
    int nFlag = OOCLoungeGetFlag(oActivator);

    if (!nFlag)
    {
        OOCLoungeStoreData(oActivator, 1);
        if (OOC_LOUNGE_SPELLCASTING_OFF)
            AssignCommand(oActivator, OOCLoungeApplyEffect(oActivator));
        DelayCommand(0.5, OOCLoungePort(oActivator));
        return;
    }

    if (nFlag) {
        if (OOC_LOUNGE_SPELLCASTING_OFF) AssignCommand(oActivator, OOCLoungeClearEffect(oActivator));
        DelayCommand(0.5, OOCLoungeReturn(oActivator));
        DelayCommand(1.0, OOCLoungeStoreData(oActivator, 0));
        return; }
}

int OOCLoungeGetHasEffect(object oActivator)
{
    effect eEffect;
    object oCreator;
    int nSubtype;
    int nType;

    eEffect = GetFirstEffect(oActivator);

    while (GetIsEffectValid(eEffect)) {
        oCreator = GetEffectCreator(eEffect);
        nSubtype = GetEffectSubType(eEffect);
        nType = GetEffectType(eEffect);

        if (nSubtype == SUBTYPE_SUPERNATURAL &&
            oCreator == oActivator &&
            nType == EFFECT_TYPE_SPELL_FAILURE) {
                return TRUE; }

    eEffect = GetNextEffect(oActivator); }

    return FALSE;
}

void OOCLoungeOnEnter(object oEnteringObject)
{
    if (!OOC_LOUNGE_SPELLCASTING_OFF) return;
    if (!GetIsPC(oEnteringObject)) return;
    if (GetIsDM(oEnteringObject)) return;

    int nCheck = OOCLoungeGetHasEffect(oEnteringObject);

    if (!nCheck) return;

    AssignCommand(oEnteringObject, OOCLoungeApplyEffect(oEnteringObject));
}







