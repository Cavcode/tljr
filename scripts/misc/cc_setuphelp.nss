/*
Thanks for help from PASSWORD PROTECTED DOOR by mod_urn@yahoo.com
*/

#include "nw_i0_generic"

void main()
{
    int iListen = GetListenPatternNumber();
    string sNewName;

    if(iListen == 777) // listen pattern set in s_listener
    {
        sNewName = GetMatchedSubstring(0);

        if (GetLocalInt(OBJECT_SELF, "iListenFlag") == TRUE)
        {
            //SpeakString("Echo = " + sNewName);
            object oPortal = GetNearestObjectByTag("PV_EXITPORTAL");
            //SetLocalString(oPortal, "sSelectablePortalLink", sNewName);
            SetCampaignString("PGC3_DATA", "sSelectablePortalLink", sNewName);
            SpeakString("The Selectable Portal Link is " + sNewName + ".");
        }
    }

    else if (iListen == -1)
    {
        // Not a match -- start an ordinary conversation
        if (GetCommandable(OBJECT_SELF))
        {
            ClearActions(CLEAR_NW_C2_DEFAULT4_29);
            BeginConversation();
        }
     }

}

