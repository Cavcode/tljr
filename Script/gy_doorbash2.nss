void main()
{
    int nHP,nMaxHP;
    object oDoor = OBJECT_SELF;

    object oPC = GetLastDamager();
    SendMessageToPC(oPC,"The gate is weakened.");
    if (GetIsPC(oPC))
    {
        SetPlotFlag(oDoor,FALSE);
        effect eDam  = EffectDamage(1);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eDam,OBJECT_SELF);
        SetPlotFlag(oDoor,TRUE);
        nHP = GetCurrentHitPoints(oDoor);
        nMaxHP = GetMaxHitPoints(oDoor);
        //object oPC = GetFirstPC();

        if (nHP ==(nMaxHP-nMaxHP/4))
        {
            FloatingTextStringOnCreature("The gate creaks and begins to crack under the force of your assault.",oPC);
        }
        if (nHP <(nMaxHP/2+1))
        {
            SetLocked(oDoor,FALSE);
            oPC = GetLastAttacker();
            AssignCommand(oPC,ClearAllActions(TRUE));
            AssignCommand(oPC,ActionOpenDoor(oDoor));
            effect eHeal = EffectHeal(nMaxHP);
            ApplyEffectToObject (DURATION_TYPE_PERMANENT,eHeal,oDoor);
        }
    }
}
