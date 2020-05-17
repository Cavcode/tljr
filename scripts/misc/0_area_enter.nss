// Universal Area enter script

//include "tlj_inc_events"

void main()
{
    // Grab the entering object. If it's a DM or NPC then exit out.
    object oPC = GetEnteringObject();
    if (!GetIsPC(oPC) || GetIsDM(oPC) || GetIsDMPossessed(oPC)) return;

    // Variable declaration
    string sAreaTag = GetStringUpperCase(GetTag(OBJECT_SELF));

    // Do we reveal the map for this area?
    ExploreAreaForPlayer(GetArea(oPC), oPC, TRUE);

    // Is this area underwater?
//  if (IsAreaUnderwater()) {
//      AssignCommand(oPC, UnderwaterRound());
    }

    //////////////////////////////////////////////////////////////////////////
    // Individual area scripts. We go by area tag.
    //////////////////////////////////////////////////////////////////////////

//}
