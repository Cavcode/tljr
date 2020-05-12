//::///////////////////////////////////////////////
//:: FileName pug_ifbntyhntr
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/04/2008 10:47:07 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "BountyHunterBadge"))
		return FALSE;

	return TRUE;
}
