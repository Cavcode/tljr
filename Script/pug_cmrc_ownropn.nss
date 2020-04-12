void main()
{
SetLocked(GetObjectByTag("chest_"+GetTag(OBJECT_SELF)), FALSE);
OpenInventory(GetObjectByTag("chest_"+GetTag(OBJECT_SELF)), GetPCSpeaker() );
OpenInventory(GetPCSpeaker(), GetObjectByTag("chest_"+GetTag(OBJECT_SELF)) );
AssignCommand(GetPCSpeaker(), DoPlaceableObjectAction(GetObjectByTag("chest_"+GetTag(OBJECT_SELF)), PLACEABLE_ACTION_USE));
}
