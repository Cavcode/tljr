void main()
{
    // do nothing when turret triggered
    object oPC = GetEnteringObject();
    SendMessageToPC(oPC, "Turret Triggered");
}
