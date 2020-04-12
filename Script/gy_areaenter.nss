#include "nw_i0_plot"


void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC))
    {
        object oArea = GetArea(oPC);
        string sTag = GetLocalString(oArea,"AreaExplorerTag"); // set this variable on the area to the tag of the factionId item  that area will be explored for
        if (HasItem(oPC,sTag))
        {
            ExploreAreaForPlayer(OBJECT_SELF,oPC,TRUE);
        }
    }
}
