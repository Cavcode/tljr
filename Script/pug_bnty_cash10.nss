void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(GetPCSpeaker(), "CONVO_LEVEL", 10);

if (GetLocalString(oPC, "BOUNTY_STATUS_"+IntToString(GetLocalInt(GetPCSpeaker(), "CONVO_LEVEL"))) == "dead")
    {
    SetCustomToken(97800, "Excellent, here is the bounty you have been promissed!");
    }

else if (GetLocalString(oPC, "BOUNTY_STATUS_"+IntToString(GetLocalInt(GetPCSpeaker(), "CONVO_LEVEL"))) == "alive")
    {
    SetCustomToken(97800, "I see you have brought the target in alive! You will receive a bonus for this!");
    }
}
