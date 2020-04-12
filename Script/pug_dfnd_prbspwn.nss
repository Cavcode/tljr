const int EVENT_USER_DEFINED_PRESPAWN = 1510;
const int EVENT_USER_DEFINED_POSTSPAWN = 1511;


#include "x2_inc_switches"
void main()
{
    // User defined OnSpawn event requested?
    int nSpecEvent = GetLocalInt(OBJECT_SELF,"X2_USERDEFINED_ONSPAWN_EVENTS");

    int nCount =0;
    object oBase = GetObjectByTag(GetTag(GetArea(OBJECT_SELF)),nCount);

   /* while (oBase == GetArea(OBJECT_SELF))
        {
        nCount=nCount+1;
        oBase = GetObjectByTag(GetTag(GetArea(OBJECT_SELF)),nCount);
        }

    if (GetTag(OBJECT_SELF) == GetTag(GetArea(OBJECT_SELF))+"_PROBE_1")
        {
        AssignCommand(OBJECT_SELF, ActionMoveToLocation(GetLocation(oBase), TRUE));
        DelayCommand(30.0, ActionRandomWalk());
        }

    if (GetTag(OBJECT_SELF) == GetTag(GetArea(OBJECT_SELF))+"_PROBE_2")
        {
        ActionRandomWalk();
        }
     */
    ActionRandomWalk();
    // Pre Spawn Event requested
    if (nSpecEvent == 1  || nSpecEvent == 3  )
    {
    SignalEvent(OBJECT_SELF,EventUserDefined(EVENT_USER_DEFINED_PRESPAWN ));
    }

    /*  Fix for the new golems to reduce their number of attacks */

    int nNumber = GetLocalInt(OBJECT_SELF,CREATURE_VAR_NUMBER_OF_ATTACKS);
    if (nNumber >0 )
    {
        SetBaseAttackBonus(nNumber);
    }

    // Execute default OnSpawn script.
    ExecuteScript("nw_c2_default9", OBJECT_SELF);


    //Post Spawn event requeste
    if (nSpecEvent == 2 || nSpecEvent == 3)
    {
    SignalEvent(OBJECT_SELF,EventUserDefined(EVENT_USER_DEFINED_POSTSPAWN));
    }

}
