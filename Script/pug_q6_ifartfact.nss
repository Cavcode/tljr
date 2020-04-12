//::///////////////////////////////////////////////
//:: FileName pug_q6_ifartfact
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 26/05/2009 5:40:21 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

	// Make sure the PC speaker has these items in their inventory
	if(!HasItem(GetPCSpeaker(), "pug_q6_artifact"))
		return FALSE;

	return TRUE;
}
