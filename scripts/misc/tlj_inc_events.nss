// This is a library for various events

#include "tlj_inc_generic"

////////////////////////////////////////////////////////////////////////////////
// CONSTANTS ///////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

const int EVENT_SECURITY_BREACH = 8356;
const int EVENT_SECURITY_BREACH_OVER = 8357;

const string EVENT_OBJECT_FLAG_ATTACK_TARGET = "ATTACK_TARGET";
const string EVENT_OBJECT_FLAG_ALARM = "ALARM";

// These are used for faction reputations very much like
// the STANDARD_FACTION_* constants.
const int CUSTOM_FACTION_EMPIRE = 1;
const int CUSTOM_FACTION_REBEL = 2;
const int CUSTOM_FACTION_NEUTRAL = 3;

// These are not to be confused with the CUSTOM_FACTION_* constants.
// They're used for determining what faction a certain object belongs to.
const int FACTION_IMPERIAL = 1;
const int FACTION_ALLIANCE = 2;
const int FACTION_CORUSCANT = 3;
const int FACTION_TATOOINE = 4;
const int FACTION_BESPIN = 5;
const int FACTION_CORELLIA = 6;
const int FACTION_NAR_SHADDAA = 7;
const int FACTION_SERENNO = 8;
const int FACTION_MUSTAFAR = 9;
const int FACTION_BASTION = 10;
const int FACTION_TANIS = 11;
const int FACTION_KASHYYYK = 12;
const int FACTION_BAKURA = 13;
const int FACTION_DANTOOINE = 14;
const int FACTION_ABRIDON = 15;
const int FACTION_RYLOTH = 16;
const int FACTION_NABOO = 17;
const int FACTION_DURO = 18;
const int FACTION_NOVA_RYLOS = 19;
const int FACTION_YAVIN = 20;

////////////////////////////////////////////////////////////////////////////////
// FUNCTION DECLARATIONS ///////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

// Find out how nCustomFaction feels about oCreature.
// - nCustomFaction: CUSTOM_FACTION_*
// - oPC
// Returns -1 on an error.
// Returns 0-100 based on the standing of oPC within the faction nCustomFaction.
// 0-10   :  Hostile.
// 11-89  :  Neutral.
// 90-100 :  Friendly.
int GetCustomFactionReputation(int nCustomFaction, object oPC=OBJECT_SELF);

// Set how nCustomFaction feels about oPC.
// - nCustomFaction: CUSTOM_FACTION_*
// - nNewReputation: 0-100 (inclusive)
// - oPC
void SetCustomFactionReputation(int nCustomFaction, int nNewReputation, object oPC=OBJECT_SELF);

// This returns one of the FACTION_* constants.
int GetFaction(object oObject=OBJECT_SELF);

// This saves oTarget to oArea for easier access.
void FlagEventObject(object oTarget, string sFlagType, object oArea=OBJECT_SELF, int bRemoveFlag=FALSE);

// This retrieves
object GetEventObject(string sFlagType, object oArea=OBJECT_SELF);

// This returns TRUE if one of the EVENT_* constants is active on oArea.
int IsEventActive(int nEvent, object oArea=OBJECT_SELF);

void SetActiveEvent(int nEvent, int bActive, object oArea=OBJECT_SELF);

// Returns TRUE if there are no enemies in oArea.
// NOTE: This will return -1 if oArea has not been assigned a faction.
int IsAreaClearOfEnemies(object oArea=OBJECT_SELF);

// Get a waypoint number suffix, padded if necessary
string GetWaypointSuffix(int n);

////////////////////////////////////////////////////////////////////////////////
// FUNCTION DEFINITIONS ////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

int GetCustomFactionReputation(int nCustomFaction, object oPC=OBJECT_SELF) {
    // Add more custom factions here in addition to the constants above
    switch (nCustomFaction) {
        case CUSTOM_FACTION_EMPIRE: return GetReputation(GetObjectByTag("SITH_IMPERIAL_FACTION"), oPC);
        case CUSTOM_FACTION_REBEL: return GetReputation(GetObjectByTag("JEDI_REBEL_FACTION"), oPC);
        case CUSTOM_FACTION_NEUTRAL: return GetReputation(GetObjectByTag("NEUTRAL_FACTION"), oPC);
    }
    return -1;
}

void SetCustomFactionReputation(int nCustomFaction, int nNewReputation, object oPC=OBJECT_SELF) {
    object oFactionSource;
    // Add more custom factions here in addition to the constants above
    switch (nCustomFaction) {
        case CUSTOM_FACTION_EMPIRE: oFactionSource = GetObjectByTag("SITH_IMPERIAL_FACTION"); break;
        case CUSTOM_FACTION_REBEL: oFactionSource = GetObjectByTag("JEDI_REBEL_FACTION"); break;
        case CUSTOM_FACTION_NEUTRAL: oFactionSource = GetObjectByTag("NEUTRAL_FACTION"); break;
    }
    // Cycle through the faction members and reset their reputation towards oCreature
    AdjustReputation(oPC, oFactionSource, nNewReputation);
    object oClear = GetFirstFactionMember(oFactionSource, FALSE);
    while (GetIsObjectValid(oClear)) {
        ClearPersonalReputation(oPC, oClear);
        oClear = GetNextFactionMember(oFactionSource, FALSE);
    }
}

int GetFaction(object oObject=OBJECT_SELF) {
    return GetLocalInt(oObject, "FACTION");
}

void FlagEventObject(object oTarget, string sFlagType, object oArea=OBJECT_SELF, int bRemoveFlag=FALSE) {
    string sFlag = "EVENT_OBJECT_" + sFlagType;
    if (bRemoveFlag) {
        DeleteLocalObject(oArea, sFlag);
    }
    else {
        SetLocalObject(oArea, sFlag, oTarget);
    }
}

object GetEventObject(string sFlagType, object oArea=OBJECT_SELF) {
    string sFlag = "EVENT_OBJECT_" + sFlagType;
    return GetLocalObject(oArea, sFlag);
}

int IsEventActive(int nEvent, object oArea=OBJECT_SELF) {
    string sEvent = "ACTIVE_EVENT_" + IntToString(nEvent);
    return GetLocalInt(oArea, sEvent);
}

void SetActiveEvent(int nEvent, int bActive, object oArea=OBJECT_SELF) {
    string sEvent = "ACTIVE_EVENT_" + IntToString(nEvent);
    if (!bActive) {
        DeleteLocalInt(oArea, sEvent);
    }
    else {
        SetLocalInt(oArea, sEvent, TRUE);
    }
}

int IsAreaClearOfEnemies(object oArea=OBJECT_SELF) {
    int nFactionSource;
    int nFaction = GetFaction(oArea);
    switch (nFaction) {
        // Alliance
        case FACTION_ABRIDON:
        case FACTION_ALLIANCE:
        case FACTION_BAKURA:
        case FACTION_NABOO:
        case FACTION_YAVIN: nFactionSource = CUSTOM_FACTION_REBEL; break;
        // Empire
        case FACTION_IMPERIAL:
        case FACTION_BASTION:
        case FACTION_CORUSCANT:
        case FACTION_DURO:
        case FACTION_KASHYYYK:
        case FACTION_MUSTAFAR:
        case FACTION_RYLOTH:
        case FACTION_SERENNO:
        case FACTION_TANIS: nFactionSource = CUSTOM_FACTION_EMPIRE; break;
        // Neutral
        case FACTION_BESPIN:
        case FACTION_CORELLIA:
        case FACTION_DANTOOINE:
        case FACTION_NAR_SHADDAA:
        case FACTION_NOVA_RYLOS:
        case FACTION_TATOOINE: nFactionSource = CUSTOM_FACTION_NEUTRAL; break;
        default: return -1;
    }
    object oCreature = GetFirstObjectInArea(oArea);
    while (GetIsObjectValid(oCreature)) {
        if (GetObjectType(oCreature) == OBJECT_TYPE_CREATURE) {
            if (!GetIsDead(oCreature) && GetCustomFactionReputation(nFactionSource, oCreature) <= 10) {
                return FALSE;
            }
        }
        oCreature = GetNextObjectInArea(oArea);
    }
    return TRUE;
}

string GetWaypointSuffix(int n) {
    return GetNumberSuffix(n);
}

//void main() {}
