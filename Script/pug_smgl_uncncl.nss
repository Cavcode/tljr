void ResetSmuggle(object oPC)
{
DeleteLocalString(oPC, "SMUGGLE_STOP");
}

void main()
{
DelayCommand(300.0, ResetSmuggle(OBJECT_SELF));
}
