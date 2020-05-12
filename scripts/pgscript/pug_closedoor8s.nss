void main()
{
   DelayCommand(8.0, ActionCloseDoor(OBJECT_SELF));
   ActionLockObject(OBJECT_SELF);
}
