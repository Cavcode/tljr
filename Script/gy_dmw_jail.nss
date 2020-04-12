void main()
{
    int bWasStunned;
    object oPC = GetPCSpeaker();
    object oTarget = GetLocalObject(oPC,"gy_dmwandTarget");
    object oJail = GetWaypointByTag("OOCJail");

    AssignCommand(oTarget, JumpToObject(oJail));
    effect eTest = GetFirstEffect(oTarget);
    while (GetIsEffectValid(eTest))
    {
            if  (GetEffectType(eTest) == 29)
            {
                RemoveEffect(oTarget,eTest);
                bWasStunned = TRUE;
            }
            eTest = GetNextEffect(oTarget);
    }
    if (!bWasStunned)
    {
        effect eStun = EffectStunned();
        eStun = SupernaturalEffect(eStun);
        DelayCommand(2.0,ApplyEffectToObject(DURATION_TYPE_PERMANENT,eStun,oTarget));
    }
}
