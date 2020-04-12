void main()
{
RemoveHenchman(GetPCSpeaker(), OBJECT_SELF);
SetLocalObject(OBJECT_SELF, "LEADER", OBJECT_INVALID);
int nHas = GetLocalInt(GetPCSpeaker(),"HENCHMAN_HAS");

SetLocalInt(GetPCSpeaker(), "HENCHMAN_HAS", nHas-1);
AssignCommand(OBJECT_SELF, ActionMoveAwayFromObject(GetPCSpeaker(), FALSE, 10.0));

DelayCommand(4.1, DestroyObject(OBJECT_SELF));
}
