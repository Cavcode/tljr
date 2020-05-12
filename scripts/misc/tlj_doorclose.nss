void main() {
    SetLocked(OBJECT_SELF, TRUE);
    DelayCommand(6.0, ActionCloseDoor(OBJECT_SELF));
}
