//::///////////////////////////////////////////////
//:: FileName pug_race_ifrare
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 24/04/2008 10:43:09 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "Raceallowed"))
		return FALSE;

	return TRUE;
}
