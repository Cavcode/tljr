//::///////////////////////////////////////////////
//:: FileName grey_isrebel
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 18/08/2008 8:43:18 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "RebelAllianceID"))
		return FALSE;

	return TRUE;
}
