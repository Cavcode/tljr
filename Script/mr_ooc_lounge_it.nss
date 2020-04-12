//OOC lounge teleporting back and forth script
//Written by Anatheme on 25/09/2007 after getting crazy trying to fix Madrabbit's one.

//okay, first lets see if i can set a few constants right.
//Change this to alter the visual effect associated with porting back and forth
//Default = VFX_FNF_SMOKE_PUFF
const int OOC_LOUNGE_VISUAL_EFFECT = VFX_FNF_SMOKE_PUFF;
//Tag of waypoint for porting
//Default = "mr_wp_ooc_lounge"
const string OOC_LOUNGE_PORT_IN = "mr_wp_ooc_lounge";
//Tag of the actual OOC Lounge area
//Default = "mr_ooc_lounge"
const string OOC_LOUNGE_TAG = "mr_ooc_lounge";
//Tag of the OOC Tunnel, to consider it like the OOC Lounge.
const string OOC_TUNNEL_TAG = "OOCEmergencyTunnel";
//This is the message sent to the player when he ports to the OOC Lounge
const string OOC_LOUNGE_PORT_IN_MESSAGE = "You have entered the OOC Lounge. All Actions are now considered OOC.";
//Same as above, but when the player leaves the OOC Lounge
const string OOC_LOUNGE_PORT_OUT_MESSAGE = "You have left the OOC Lounge. All Actions are now considered IC.";
// afterall these two functions used to work, so...
void OOCLoungeApplyEffect(object oTarget)
{
    effect eSpellCasting = SupernaturalEffect(EffectSpellFailure(100, SPELL_SCHOOL_GENERAL));
    AssignCommand(oTarget, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSpellCasting, oTarget));

}

void OOCLoungeClearEffect(object oTarget)
{
    effect eEffect = GetFirstEffect(oTarget);
    object oCreator;
    int nSubtype;
    int nType;
// scan thru all the current effects on PC
    while (GetIsEffectValid(eEffect))
    {
        oCreator = GetEffectCreator(eEffect);
        nSubtype = GetEffectSubType(eEffect);
        nType = GetEffectType(eEffect);
//until we find the one we're looking for
        if (oCreator == oTarget &&
            nSubtype == SUBTYPE_SUPERNATURAL &&
            nType == EFFECT_TYPE_SPELL_FAILURE)
            {
//and remove it
            RemoveEffect(oTarget, eEffect);
            }
// this is the loop to keep searching
    eEffect = GetNextEffect(oTarget);
    }
}
//include this because i've no idea what it is exactly
#include "x2_inc_switches"
void main()
{
//nor do i know what the fuck is that, but i'll just leave it be
int nEvent =GetUserDefinedItemEventNumber();
    // * This code runs when the Unique Power property of the item is used
    // * Note that this event fires PCs only
//yeah right.
    if (nEvent ==X2_ITEM_EVENT_ACTIVATE)
    {
// PC i'm bugging with
        object oPC   = GetItemActivator();
// my PC's name, for futur use (to make the tags and record their loc)
        string sName = GetName(oPC);
// Where's my PC?
        object oArea = GetArea(oPC);
// no, i mean i need the Area's tag
        string sArea = GetTag(oArea);
// while i'm at it, i might aswell get their actual loc even if it's useless ressource hogging when they're just porting out
        location lLoc = GetLocation(oPC);
// meet the waypoint which is recording everyone's IC loc
        object oRecorder = GetWaypointByTag(OOC_LOUNGE_PORT_IN);
//if my PC is in the ooc lounge or in the ooc tunnel, i'll send them back to hell
        if (sArea == OOC_LOUNGE_TAG | sArea == OOC_TUNNEL_TAG)
        {
// First, remove the infamous spellfailure!
        AssignCommand(oPC, OOCLoungeClearEffect(oPC));
//then torture the waypoint recorder until it talks and spits out the PC's original loc
        location lReturn = GetLocalLocation(oRecorder, "LOC_" + sName);
//make light, yell at PC, kick them back into hell. without giving them a chance to react
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(OOC_LOUNGE_VISUAL_EFFECT), oPC);
        FloatingTextStringOnCreature(OOC_LOUNGE_PORT_OUT_MESSAGE, oPC, FALSE);
//        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, JumpToLocation(lReturn));
        }
//end of the "if pc is in the ooc area"
//else it means they're out somewhere and are trying to get to the ooc lounge
        else
        {
//so, first thing is to plague them with the infamous spellfailure!
        AssignCommand(oPC, OOCLoungeApplyEffect(oPC));
//Next, record where they are!
//this will be the name of the local variable recording their IC loc
        string sLocation = "LOC_" + sName;
//Do it!
        SetLocalLocation(oRecorder, sLocation, lLoc);
//grab the loc of the lounge's waypoint
        location lPortIn = GetLocation(oRecorder);
//And kick them all the way into the ooc area, with light, puffs and all...
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(OOC_LOUNGE_VISUAL_EFFECT), oPC);
        FloatingTextStringOnCreature(OOC_LOUNGE_PORT_IN_MESSAGE, oPC, FALSE);
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, JumpToLocation(lPortIn));
        }
    }
}
