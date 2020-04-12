void main()
{
SetListenPattern(OBJECT_SELF, "**", 828);
SetListening(OBJECT_SELF, TRUE);
SetLocalString(OBJECT_SELF, "RECORDER", GetName(GetPCSpeaker()));
}
