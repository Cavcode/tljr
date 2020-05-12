#include "nwnx_area"

// Tag-Based Item Script - Skeleton Template
//:://////////////////////////////////////////////////////////
#include "x2_inc_switches"

void portToInstance(object oPC, object oArea, string sWPtag, float fDelay);

// This is the main function for the tag-based script.
void main()
{ switch( GetUserDefinedItemEventNumber())
   {
     case X2_ITEM_EVENT_ACTIVATE:
         { // The item's CastSpell Activate or CastSpell UniquePower was just activated.
            object     oItemUser  = GetItemActivator();
            object     oItem          = GetItemActivated();
            object     oTarget      = GetItemActivatedTarget();
            location  lTarget      = (GetIsObjectValid( oTarget) ? GetLocation( oTarget) : GetItemActivatedTargetLocation());
            int         bFound = FALSE;
            if( !GetIsObjectValid( oItemUser) || !GetIsObjectValid( oItem))
            { SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_CONTINUE);
               return;
            }
            object oArea = CreateArea("qx_test_instance");
            SendMessageToPC(oItemUser, "Area created. Searching for entrance waypoint in 30 seconds.");
            //DelayCommand(30.0, portToInstance(oItemUser, oArea, "qx_wp_instancetest1", 30.0));
         }
         SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_END);
         return;
   }
   SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_CONTINUE);
}

void portToInstance(object oPC, object oArea, string sWPtag, float fDelay)
{
            object oWP = GetFirstObjectInArea(oArea);
            location lLoc;
            int bFound;
            while (oWP != OBJECT_INVALID)
            {
                SendMessageToPC(oPC, ".....");
                if (GetTag(oWP) == sWPtag)
                {
                    lLoc = GetLocation(oWP);
                    SendMessageToPC(oPC, "Waypoint found, teleporting in 5 seconds.");
                    bFound = TRUE;
                    DelayCommand(5.0, AssignCommand(oPC, ActionJumpToLocation(lLoc)));
                    oWP = OBJECT_INVALID;
                }
                else
                {
                    oWP = GetNextObjectInArea(oArea);
                }
            }
            if (!bFound)
            {
                SendMessageToPC(oPC, "Entrance waypoint could not be found.");
            }

}
