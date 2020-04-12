void main()
{
object oPC = GetPCSpeaker();

SetLocalInt(OBJECT_SELF, "HAK_ATTEMPTS", GetLocalInt(OBJECT_SELF, "HAK_ATTEMPTS")-1);
}
