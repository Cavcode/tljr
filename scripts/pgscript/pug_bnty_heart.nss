void main()
{
/*int x = d20(2)-1;
string sLevel = GetStringRight(GetTag(OBJECT_SELF), 2);
string sLocation = GetLocalString(GetObjectByTag("bnty_master"), "TARGET_LOCATION_"+sLevel);

if (x < 6 && GetIsInCombat(OBJECT_SELF) == FALSE && IsInConversation(OBJECT_SELF) == FALSE)
    {
    ClearAllActions(FALSE);
    AssignCommand(OBJECT_SELF, ActionForceMoveToObject(GetWaypointByTag("BOUNTY_"+sLocation+"_"+IntToString(x)), FALSE));
    ActionForceMoveToObject(GetWaypointByTag("BOUNTY_"+sLocation+"_"+IntToString(x)), FALSE);
    }
/*if (x > 15 && GetIsInCombat(OBJECT_SELF) == FALSE && IsInConversation(OBJECT_SELF) == FALSE)
    {
    ClearAllActions(FALSE);
    ActionRandomWalk();
    }
*/
}
