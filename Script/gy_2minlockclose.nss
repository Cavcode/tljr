void main()
{
   DelayCommand(120.0, ActionCloseDoor(OBJECT_SELF));
   SetLocked(OBJECT_SELF, TRUE);
}
