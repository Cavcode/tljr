void main()
{
int nHas = GetLocalInt(GetMaster(OBJECT_SELF),"HENCHMAN_HAS");

SetLocalInt(GetMaster(OBJECT_SELF), "HENCHMAN_HAS", nHas-1);
}
