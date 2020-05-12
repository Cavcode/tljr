void main()
{
int nLevel = GetLocalInt(GetPCSpeaker(), "CONVO_LEVEL");

SetLocalString(GetPCSpeaker(), "TARGET_"+IntToString(nLevel), GetName(GetObjectByTag("bnty_"+IntToString(nLevel))));
}
