void main()
{
object oNPC = GetEnteringObject();

if (GetStringRight(GetTag(oNPC), 6) == "jumper" && GetIsObjectValid(GetWaypointByTag(GetTag(oNPC)+"_TARGET"))==TRUE)
    {
    AssignCommand(oNPC, ClearAllActions(TRUE));
    //AssignCommand(oNPC, ActionSpeakString(GetTag(OBJECT_SELF)+"_TARGET",TALKVOLUME_TALK));
    AssignCommand(oNPC, ActionJumpToLocation(GetLocation(GetWaypointByTag(GetTag(oNPC)+"_TARGET"))));
    }
//AssignCommand(oNPC, ActionSpeakString(GetTag(OBJECT_SELF),TALKVOLUME_TALK));
}
