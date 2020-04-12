#include "nw_i0_plot"

// IDs
const string sRebelSoldierIDTag      = "RebelAllianceID";   // the tag of the Rebel Soldier ID
const string sRebelSoldierIDResRef   = "rebelallianceid";          // the resref of the Rebel Soldier ID
const string sRebelJediIDTag      = "JediSignet";   // the tag of the Rebel Jedi ID
const string sRebelJediIDResRef   = "jedisignet";         // the resref of the Rebel Jedi ID
const string sEmpireStormtrooperIDTag      = "StormtrooperBadge";   // the tag of the Empire Stormtrooper ID
const string sEmpireStormtrooperIDResRef   = "stormtrooperbad";         // the resref of the Empire Stormtrooper ID
const string sEmpireSithIDTag      = "SithSignet";   // the tag if the Empire Sith ID
const string sEmpireSithIDResRef   = "sithsignet";         // the resref if the Empire Sith ID
const string sEmpireCivilianIDTag      = "GalaticEmpireID";   // the tag of the Empire Civilian ID
const string sEmpireCivilianIDResRef   = "galaticempireid";          // the resref of the Empire Civilian ID
const string sFringeIDTag      = "FringeID";   // the tag of the Fringe ID
const string sFringeIDResRef   = "fringeid";          // the resref of the Fringe ID
const string sFringeBountyHunterIDTag      = "BountyHunterBadge";   // the tag of the Fringe Bounty Hunter ID
const string sFringeBountyHunterIDResRef   = "bountyhunterba";          // the resref of the Fringe Bounty Hunter ID
const string sFringeTraderIDTag      = "TraderBadge";   // the tag of the Fringe Trader ID
const string sFringeTraderIDResRef   = "traderbadge";          // the resref of the Fringe Trader ID

//starting locations

const string sStormtrooperStartTag = "StormtrooperStart"; // the Tag of the object that the Stormtrooper members are to start/port to
const string sRebelStartTag = "RebelStart"; // the Tag of the object that the Rebel/Jedi members are to start/port to
const string sSithStartTag = "SithStart"; // the Tag of the object that the Sith members are to start/port to
const string sCivilianStartTag = "CivilianStart"; // the Tag of the object that the Civilian members are to start/port to
const string sBountyHunterStartTag = "BountyHunterStart"; // the Tag of the object that the Bounty Hunter/Mercenary members are to start/port to
const string sSpacerStartTag = "SpacerStart"; // the Tag of the object that the Spacer/Grey Jedi members are to start/port to
const string sTraderStartTag = "TraderStart"; // the Tag of the object that the Trader members are to start/port to



// ooc jump to locations
const string sOCCTag = "OOCJumpTo";

//messages
// this is the string that will be displayed when the pc does not have some sort of id on them.
const string sNoJumpIDfound = "Unable to port you to your starting location.  You must talk to the NPC before you are allowed to enter the mod.";

