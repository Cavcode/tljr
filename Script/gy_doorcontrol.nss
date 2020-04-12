void main()
{
    PlayAnimation( ANIMATION_PLACEABLE_ACTIVATE  );
    object oDoor = GetNearestObject(OBJECT_TYPE_DOOR);
    int bLocked = GetLocked(oDoor);
    SetLocked(oDoor,!bLocked);
    if (!bLocked)
    {
        AssignCommand(oDoor,ActionCloseDoor(oDoor));
//        AssignCommand(oDoor,ActionSpeakString("Locking"));
    }
    else
    {
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
//      AssignCommand(oDoor,ActionSpeakString("Unlocking"));
    }
    DelayCommand(1.0,PlayAnimation( ANIMATION_PLACEABLE_DEACTIVATE  ));
}
