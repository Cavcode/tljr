void main()
{
    object oPC = GetPCSpeaker();
    object oTarget = GetLocalObject(oPC,"gy_dmwandTarget");
    BootPC(oTarget);
}
