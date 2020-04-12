//Inspired from zep_openclose script, a general script to put in the "on use"
//event of placeable doors and trapdoors, which will transport the players to
//waypoints tagged "WP_"+door's tag.
//It still uses CEP_L_GATEBLOCK to block passage thru placeable doors.
//written by Anatheme 26/09/2007
#include "zep_inc_scrptdlg"
void main()
{
    string sGateBlock = GetLocalString(OBJECT_SELF, "CEP_L_GATEBLOCK");
    location lSelfLoc = GetLocation(OBJECT_SELF);
    int nIsOpen = GetIsOpen(OBJECT_SELF);
    object oPC = GetLastUsedBy();
    string sGateName = GetTag(OBJECT_SELF);
//if the object is locked, it cannot be opened or closed
    if (GetLocked(OBJECT_SELF) == 1)
    {
        string sLockedMSG = GetStringByStrRef(nZEPDoorLocked,GENDER_MALE);
        SpeakString(sLockedMSG);
    }
//else, it's open, so...
    else
    {
//...check if it's a door or something else.
// if the item is not a door, we won't have any gateblock to mess with
        if (sGateBlock == "")
        {
//so if it's not open...
            if (nIsOpen == 0)
            {
//open it and move the player to the corresponding WP_
            PlayAnimation(ANIMATION_PLACEABLE_OPEN);
            DelayCommand(2.0, AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_" + sGateName)))));
//oh, and... have the gate re-run it's own script to close itself 4 seconds later.
            DelayCommand(4.0, ExecuteScript("ana_doors_onuse", OBJECT_SELF));
            }
//otherwise, just close it.
            else
            {
            PlayAnimation(ANIMATION_PLACEABLE_CLOSE);
            }
        }
//else it's a door, so we'll have to do the same thing, except including gateblock manipulation
        else
        {
            if (nIsOpen == 0)
            {
            PlayAnimation(ANIMATION_PLACEABLE_OPEN);
            DelayCommand(2.0, AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_" + sGateName)))));
            DelayCommand(4.0, ExecuteScript("ana_doors_onuse", OBJECT_SELF));
//take care of the gateblock. If it exists, nuke it and inform the gate you did it.
                if (GetLocalObject(OBJECT_SELF, "GateBlock")!= OBJECT_INVALID)
                {
                DestroyObject(GetLocalObject(OBJECT_SELF, "GateBlock"));
                SetLocalObject(OBJECT_SELF, "GateBlock", OBJECT_INVALID);
                }
            }
//else close it and put the gateblock back into place.
            else
            {
            PlayAnimation(ANIMATION_PLACEABLE_CLOSE);
            SetLocalObject(OBJECT_SELF, "GateBlock", CreateObject(OBJECT_TYPE_PLACEABLE, sGateBlock, lSelfLoc));
            }

        }
    }
}




