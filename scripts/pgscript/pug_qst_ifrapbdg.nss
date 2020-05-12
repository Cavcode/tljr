//::///////////////////////////////////////////////
//:: FileName pug_qst_ifrapbdg
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 21/09/2008 8:23:40 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "RaptorBadge"))
		return FALSE;

	return TRUE;
}
