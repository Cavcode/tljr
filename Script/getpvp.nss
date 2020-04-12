void main()
{
    object oPC = OBJECT_SELF;
    object oKiller = GetLastKiller();
    if (oKiller == OBJECT_INVALID)
    {  // well be invalid if character is only bleeding and not yet dead
        oKiller = GetLastHostileActor();
    }
    if (oKiller == OBJECT_INVALID)
    {  //
        oKiller = GetLastDamager();
    }
    if (oKiller == OBJECT_INVALID)
    {  //
        oKiller = GetLastAttacker();
    }
    if (!GetIsObjectValid(oKiller))
    {
        FloatingTextStringOnCreature("DEBUG: No killer found, PVP invalid",oPC,FALSE);
    }

    FloatingTextStringOnCreature("Killer is "+ GetName(oKiller),oPC);
    if (!GetLocalInt(oPC,"gy_PVP"))
    {
        if (GetIsPC(oKiller) || GetIsPC(GetMaster(oKiller)))
        {
            FloatingTextStringOnCreature("PvP is TRUE",oPC);
            SetLocalInt(oPC,"gy_PVP",TRUE);
        }
        else
        {
            FloatingTextStringOnCreature("PvP is FALSE",oPC);
            SetLocalInt(oPC,"gy_PVP",FALSE);
        }
    }
}
