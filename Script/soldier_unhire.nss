void main()
{
RemoveHenchman(GetPCSpeaker(), OBJECT_SELF);
SetLocalObject(OBJECT_SELF, "LEADER", OBJECT_INVALID);
int nHas = GetLocalInt(GetPCSpeaker(),"HENCHMAN_HAS");

SetLocalInt(GetPCSpeaker(), "HENCHMAN_HAS", nHas-1);
}
