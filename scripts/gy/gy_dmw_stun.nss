void main()
{
    int bWasStunned;
    object oPC = GetPCSpeaker();
    object oTarget = GetLocalObject(oPC,"gy_dmwandTarget");
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
