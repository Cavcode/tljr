//::///////////////////////////////////////////////
//:: FileName pug_race_ifmrare
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 24/04/2008 10:46:17 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Add the gender restrictions
	if(GetGender(GetPCSpeaker()) != GENDER_MALE)
		return FALSE;

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "Raceallowed"))
		return FALSE;

	return TRUE;
}
