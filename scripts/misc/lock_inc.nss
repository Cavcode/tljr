//**///////////////////////////////////////////////////////////////////////////
//** LOCK!NESS v1.02 - Include File
//**///////////////////////////////////////////////////////////////////////////
//**
//** This is the include which contains all the created functions for LOCK.
//** Do not modify unless you know what you are doing.
//**
//**///////////////////////////////////////////////////////////////////////////
//** Last modification: 02/27/2006
//** Created by Firya'nis & Ex Tempus.
//**///////////////////////////////////////////////////////////////////////////

//**///////////////////////////////////////////////////////////////////////////
//** LOCK_SpawnCreature()
//**///////////////////////////////////////////////////////////////////////////
//** int RW           : Auto Random Walk.
//** int SD           : Auto Sit Down.
//** int AA           : Auto Animation.
//** location lLoc    : Location of the spawn WP.
//** string sTAG      : TAG of the creature to spawn.
//** string sNewTag   : Assign a new TAG to the creature after the spawn.
//** string sAutoConv : Resref of the dialog to execute after the spawn.
//**///////////////////////////////////////////////////////////////////////////
void LOCK_SpawnCreature(int RW, int SD, int AA, location lLoc, string sTAG, string sNewTag="", string sAutoConv="");

//**///////////////////////////////////////////////////////////////////////////
//** LOCK_SpawnPlaceable()
//**///////////////////////////////////////////////////////////////////////////
//** location lLoc    : Location of the spawn WP.
//** string sTAG      : TAG of the placeable to spawn.
//** string sNewTag   : Assign a new TAG to the placeable after the spawn.
//**///////////////////////////////////////////////////////////////////////////
void LOCK_SpawnPlaceable(location lLoc, string sTAG, string sNewTag="");

//**///////////////////////////////////////////////////////////////////////////
//** LOCK_SpawnObject()
//**///////////////////////////////////////////////////////////////////////////
//** object oPC       : Player which is entering the area.
//** location lLoc    : Location of the spawn WP.
//** string sTAG      : TAG of the item to spawn.
//** string sNewTag   : Assign a new TAG to the item after the spawn.
//**///////////////////////////////////////////////////////////////////////////
void LOCK_SpawnObject(object oPC, location lLoc, string sTAG, string sNewTag="");

//**///////////////////////////////////////////////////////////////////////////
//** LOCK_CleanArea()
//**///////////////////////////////////////////////////////////////////////////
//**
//** This is used to clean the area when the timer reach its limit and nobody
//** entered the area before that.
//**
//**///////////////////////////////////////////////////////////////////////////
void LOCK_CleanArea(object oArea);

//**///////////////////////////////////////////////////////////////////////////
//** LOCK_CleaningTimer()
//**///////////////////////////////////////////////////////////////////////////
//**
//** This is used to countdown the time since the moment the last PC exit from
//** the area to the moment the despawn should occurs.
//**
//**///////////////////////////////////////////////////////////////////////////
void LOCK_CleaningTimer(object oArea, float fDelay=60.0);

//**///////////////////////////////////////////////////////////////////////////
//** LOCK_InitCleaningTimer()
//**///////////////////////////////////////////////////////////////////////////
//**
//** This is used to init the cleaning timer and to execute
//** the LOCK_CleaningTimer() function.
//**
//**///////////////////////////////////////////////////////////////////////////
void LOCK_InitCleaningTimer(object oArea, float fDelay=60.0);

//**///////////////////////////////////////////////////////////////////////////
//** LOCK_ResetCleaningTimer()
//**///////////////////////////////////////////////////////////////////////////
//**
//** This is used to reset the cleaning timer and not start it again.
//**
//**///////////////////////////////////////////////////////////////////////////
void LOCK_ResetCleaningTimer(object oArea);

//**///////////////////////////////////////////////////////////////////////////
//** LOCK_Debug()
//**///////////////////////////////////////////////////////////////////////////
//**
//** Activate/Deactivate Debug Mode (1 = Activated / 0 = Deactivated)
//**
//**///////////////////////////////////////////////////////////////////////////
void LOCK_Debug(string sDebug="");

//**///////////////////////////////////////////////////////////////////////////
//** GDSL_DaySpawns()
//**///////////////////////////////////////////////////////////////////////////
//**
//** This function is used to spawn ONLY if the time IG is on the day.
//**
//**///////////////////////////////////////////////////////////////////////////
void GDSL_DaySpawns();

//**///////////////////////////////////////////////////////////////////////////
//** GDSL_NightSpawns()
//**///////////////////////////////////////////////////////////////////////////
//**
//** This function is used to spawn ONLY if the time IG is on the night.
//**
//**///////////////////////////////////////////////////////////////////////////
void GDSL_NightSpawns();


void LOCK_SpawnCreature(int RW, int SD, int AA, location lLoc, string sTAG, string sNewTag="", string sAutoConv="")
{
    // Spawn of the creature.
    string sResref = GetStringLowerCase(sTAG);
    object oObject = CreateObject(OBJECT_TYPE_CREATURE, sResref, lLoc, FALSE, sNewTag);

    // We assign variables on the creature for the Auto Respawn.
    SetLocalLocation(oObject, "LOCK_LOCATION", lLoc);
    SetLocalInt(oObject, "LOCK_RESPAWN", 1);

    // Condition to activate the Auto Random Walk.
    if (RW != 0)
    {
        SetLocalInt(oObject, "LOCK_RW", 1);
        AssignCommand(oObject, ActionRandomWalk());
    }
    // Condition to activate the Auto Sit Down. (Look for "Chair" TAG)
    if (SD != 0)
    {
        SetLocalInt(oObject, "LOCK_SD", 1);
        AssignCommand(oObject, ActionSit(GetNearestObjectByTag("Chair", oObject)));
    }
    // Condition to activate the Auto Animation. (Fixed lenght: 1h)
    // Warning: FIRE&FORGET (100 and after...) animations do not last !
    if (AA != 0)
    {
        SetLocalInt(oObject, "LOCK_AA", 1);
        AssignCommand(oObject, ActionPlayAnimation(AA, 1.0, 3600.0));
    }
    // Check if we must start a dialog after the spawn.
    if (sAutoConv != "") AssignCommand(oObject, SpeakOneLinerConversation(sAutoConv));
}

void LOCK_SpawnPlaceable(location lLoc, string sTAG, string sNewTag="")
{
    // Spawn of the placeable.
    string sResref = GetStringLowerCase(sTAG);
    object oObject = CreateObject(OBJECT_TYPE_PLACEABLE, sResref, lLoc, FALSE, sNewTag);

    // If the placeable is the GDSL manager waypoint, execute its heartbeat script immediately.
    if (sResref == "um_gdsl") ExecuteScript("lock_gdsl_hb", oObject);

    // If we don't mark it, it won't be destroyed on the cleaning.
    SetLocalInt(oObject, "LOCK_DESPAWN", 1);
}

void LOCK_SpawnObject(object oPC, location lLoc, string sTAG, string sNewTag="")
{
    // Spawn of the item.
    string sResref = GetStringLowerCase(sTAG);
    object oObject = CreateObject(OBJECT_TYPE_ITEM, sResref, lLoc, FALSE, sNewTag);

    // If we don't mark it, it won't be destroyed on the cleaning.
    SetLocalInt(oObject, "LOCK_DESPAWN", 1);
}

void LOCK_CleanArea(object oArea)
{
    int iObject;
    object oObject = GetFirstObjectInArea(oArea);
    while (GetIsObjectValid(oObject))
    {
        iObject = GetObjectType(oObject);
        if (GetIsPC(oObject))
        {
            WriteTimestampedLogEntry("**/!\** Joueur: " + GetName(oObject) + " present dans la zone" + GetName(OBJECT_SELF) + " lors du nettoyage **/!\**");
            return;
        }
        if (iObject == OBJECT_TYPE_CREATURE && !GetIsPC(oObject) && GetLocalInt(oObject, "LOCK_NODESPAWN") == 0)
        {
            LOCK_Debug("** Créature effacée: " + GetName(oObject));
            SetPlotFlag(oObject,0);
            AssignCommand(oObject, SetIsDestroyable(TRUE, FALSE));
            DestroyObject(oObject);
        }
        else if (iObject == OBJECT_TYPE_PLACEABLE && GetLocalInt(oObject, "LOCK_DESPAWN") == 1)
        {
            LOCK_Debug("** Plc effacé: " + GetName(oObject));
            SetPlotFlag(oObject,0);
            AssignCommand(oObject, SetIsDestroyable(TRUE, FALSE));
            DestroyObject(oObject);
        }
        else if (iObject == OBJECT_TYPE_PLACEABLE && GetTag(oObject) == "BodyBag")
        {
            if (GetHasInventory(oObject)) // security.
            {
                object oDelInv = GetFirstItemInInventory(oObject);
                while (GetIsObjectValid(oDelInv)) // Emptying the lootbag.
                {
                    LOCK_Debug("*** Contenu Lootbag effacé: " + GetName(oDelInv));
                    SetPlotFlag(oDelInv,0);
                    AssignCommand(oDelInv, SetIsDestroyable(TRUE, FALSE));
                    DestroyObject(oDelInv);
                    oDelInv = GetNextItemInInventory(oObject);
                }
            }
            LOCK_Debug("** Lootbag effacé");
            SetPlotFlag(oObject,0);   // Destroying the lootbag.
            AssignCommand(oObject, SetIsDestroyable(TRUE, FALSE));
            DestroyObject(oObject);
        }
        else if (iObject == OBJECT_TYPE_ITEM && GetLocalInt(oObject, "LOCK_DESPAWN") == 1)
        {
            SetPlotFlag(oObject,0);
            AssignCommand(oObject, SetIsDestroyable(TRUE, FALSE));
            DestroyObject(oObject);
        }

        oObject = GetNextObjectInArea(oArea);
    } // End of WHILE

    // The area has been cleaned.
    DeleteLocalInt(oArea, "LOCK_SPAWN_ENTER");
}

void LOCK_CleaningTimer(object oArea, float fDelay=60.0)
{
    int TIMER = GetLocalInt(oArea, "LOCK_TIMER");

    if (TIMER == -1) // One PC entered the area... no cleaning !
    {
        SetLocalInt(oArea, "LOCK_TIMER", 0);
        LOCK_Debug("* TIMER -1 => TIMER = 0");
    }
    else if (TIMER == 1) // Time to clean area !
    {
        LOCK_CleanArea(oArea);
        SetLocalInt(oArea, "LOCK_TIMER", 0);
        LOCK_Debug("* CleanArea()");
        LOCK_Debug("* TIMER = 0");
    }
    else // The countdown is running...
    {
        TIMER = TIMER - 1;
        SetLocalInt(oArea, "LOCK_TIMER", TIMER);
        DelayCommand(fDelay, LOCK_CleaningTimer(oArea, fDelay));
        LOCK_Debug("* DelayCommand(CleaningTimer())");
        LOCK_Debug("* TIMER = " + IntToString(TIMER));
    }
}

void LOCK_InitCleaningTimer(object oArea, float fDelay=60.0)
{
    SetLocalInt(oArea, "LOCK_TIMER", 5);
    DelayCommand(fDelay, LOCK_CleaningTimer(oArea, fDelay));
    LOCK_Debug("* InitCleaningTimer()");
    LOCK_Debug("* TIMER = 5");
}

void LOCK_ResetCleaningTimer(object oArea)
{
    SetLocalInt(oArea, "LOCK_TIMER", 5);
    LOCK_Debug("* ResetCleaningTimer()");
    LOCK_Debug("* TIMER = 5");
}

void LOCK_Debug(string sDebug="")
{
    int iDebug = 0; // Set to 1 to activate the debug mode.
    if (iDebug == 1) WriteTimestampedLogEntry(sDebug);
}

void GDSL_DaySpawns()
{
    object oWP = GetNearestObject(OBJECT_TYPE_WAYPOINT);
    int i = 1;

    while (GetIsObjectValid(oWP))
    {
        string sWP = GetStringLeft(GetTag(oWP), 5);
        if (sWP == "GDSL_")
        {
            location lLoc = GetLocation(oWP);

            sWP = GetTag(oWP);
            int iWP = GetStringLength(sWP);
            iWP = iWP - 5;
            string sResRef = GetStringRight(sWP, iWP);

            int DN            = GetLocalInt(oWP, "DN");
            int PLC           = GetLocalInt(oWP, "PLC");
            int RW            = GetLocalInt(oWP, "RW");
            int SD            = GetLocalInt(oWP, "SD");
            int AA            = GetLocalInt(oWP, "AA");
            string NEWTAG     = GetLocalString(oWP, "NEWTAG");
            string AUTOCONV   = GetLocalString(oWP, "AUTOCONV");
            object SPAWN_DONE = GetLocalObject(oWP, "LOCK_SPAWN_DONE");

            if (( DN == 1 || DN == 3 ) && (GetCurrentHitPoints(SPAWN_DONE) <= 0))
            {
                if (PLC == 1)
                {
                    sResRef = GetStringLowerCase(sResRef);
                    object oObject = CreateObject(OBJECT_TYPE_PLACEABLE, sResRef, lLoc, FALSE, NEWTAG);
                    SetLocalInt(oObject, "LOCK_DESPAWN", 1); // To allow despawn.
                    SetLocalObject(oWP, "LOCK_SPAWN_DONE", oObject);
                }
                else
                {
                    sResRef = GetStringLowerCase(sResRef);
                    object oObject = CreateObject(OBJECT_TYPE_CREATURE, sResRef, lLoc, FALSE, NEWTAG);
                    if (AUTOCONV != "") AssignCommand(oObject, SpeakOneLinerConversation(AUTOCONV));
                    SetLocalObject(oWP, "LOCK_SPAWN_DONE", oObject);

                    // Condition to activate Auto Random Walk.
                    if (RW == 1)
                    {
                        SetLocalInt(oObject, "LOCK_RW", 1);
                        AssignCommand(oObject, ActionRandomWalk());
                    }
                    // Condition to activate the Auto Sit Down. (Look for "Chair" TAG)
                    if (SD != 0)
                    {
                        AssignCommand(oObject, ActionSit(GetNearestObjectByTag("Chair", oObject)));
                        SetLocalInt(oObject, "LOCK_SD", 1);
                    }
                    // Condition to activate the Auto Animation. (Fixed lenght: 1h)
                    // Warning: FIRE&FORGET (100 and after...) animations do not last !
                    if (AA != 0)
                    {
                        SetLocalInt(oObject, "LOCK_AA", 1);
                        AssignCommand(oObject, ActionPlayAnimation(AA, 1.0, 3600.0));
                    }
                }
            }
            else if ( DN == 4 )
            {
                if(!GetIsDMPossessed(SPAWN_DONE))
                {
                    if (GetIsObjectValid(SPAWN_DONE) && PLC == 1)
                    {
                        DestroyObject(SPAWN_DONE);
                    }
                    else if (GetIsObjectValid(SPAWN_DONE))
                    {
                        AssignCommand(SPAWN_DONE, ActionSpeakString("It is time to leave..."));
                        SetPlotFlag(SPAWN_DONE,0);
                        AssignCommand(SPAWN_DONE, SetIsDestroyable(TRUE, FALSE));

                        object oDoor = GetNearestObject(OBJECT_TYPE_DOOR, SPAWN_DONE);

                        if (GetIsObjectValid(oDoor))
                        {
                            // ActionForceMoveToLocation() because ActionMoveToObject() is cheesy !
                            location lDoor = GetLocation(oDoor);
                            AssignCommand(SPAWN_DONE, ClearAllActions());
                            AssignCommand(SPAWN_DONE, ActionForceMoveToLocation(lDoor));
                            AssignCommand(SPAWN_DONE, ActionDoCommand(DestroyObject(SPAWN_DONE)));
                            AssignCommand(SPAWN_DONE, DelayCommand(30.0, DestroyObject(SPAWN_DONE)));
                        }
                        else
                        {
                            DestroyObject(SPAWN_DONE);
                        }
                    }
                    DeleteLocalObject(oWP, "SPAWN_DONE");
                }
            }
        }
        i++;
        oWP = GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, i);
    }
    ///////////////////////////////////////////////////////////////////////////
    //:: FOR THE DOORS (SHOPS, ...)
    ///////////////////////////////////////////////////////////////////////////
    object oDoor = GetNearestObject(OBJECT_TYPE_DOOR);
    i = 1;

    while (GetIsObjectValid(oDoor))
    {
        int nLock = GetLocalInt(oDoor, "GDSL_DOOR");
        if (nLock > 0) // If it exists, we open door on day...
        {
            if (GetLocked(oDoor))
            {
                SetLocked(oDoor, FALSE);
                AssignCommand(oDoor, PlaySound("gui_picklockopen"));
            }
        }
        i++;
        oDoor = GetNearestObject(OBJECT_TYPE_DOOR, OBJECT_SELF, i);
    }
}

void GDSL_NightSpawns()
{
    object oWP = GetNearestObject(OBJECT_TYPE_WAYPOINT);
    int i = 1;

    while (GetIsObjectValid(oWP))
    {
        string sWP = GetStringLeft(GetTag(oWP), 5);
        if (sWP == "GDSL_")
        {
            location lLoc = GetLocation(oWP);

            sWP = GetTag(oWP);
            int iWP = GetStringLength(sWP);
            iWP = iWP - 5;
            string sResRef = GetStringRight(sWP, iWP);

            int DN            = GetLocalInt(oWP, "DN");
            int PLC           = GetLocalInt(oWP, "PLC");
            int RW            = GetLocalInt(oWP, "RW");
            int SD            = GetLocalInt(oWP, "SD");
            int AA            = GetLocalInt(oWP, "AA");
            string NEWTAG     = GetLocalString(oWP, "NEWTAG");
            string AUTOCONV   = GetLocalString(oWP, "AUTOCONV");
            object SPAWN_DONE = GetLocalObject(oWP, "LOCK_SPAWN_DONE");

            if (( DN == 2 || DN == 4 ) && (GetCurrentHitPoints(SPAWN_DONE) <= 0) )
            {
                if (PLC == 1)
                {
                    sResRef = GetStringLowerCase(sResRef);
                    object oObject = CreateObject(OBJECT_TYPE_PLACEABLE, sResRef, lLoc, FALSE, NEWTAG);
                    SetLocalInt(oObject, "LOCK_DESPAWN", 1);
                    SetLocalObject(oWP, "LOCK_SPAWN_DONE", oObject);

                }
                else
                {
                    sResRef = GetStringLowerCase(sResRef);
                    object oObject = CreateObject(OBJECT_TYPE_CREATURE, sResRef, lLoc, FALSE, NEWTAG);
                    if (AUTOCONV != "") AssignCommand(oObject, SpeakOneLinerConversation(AUTOCONV));
                    SetLocalObject(oWP, "LOCK_SPAWN_DONE", oObject);

                    // Condition to activate Auto Random Walk.
                    if (RW == 1)
                    {
                        SetLocalInt(oObject, "LOCK_RW", 1);
                        AssignCommand(oObject, ActionRandomWalk());
                    }
                    // Condition to activate the Auto Sit Down. (Look for "Chair" TAG)
                    if (SD != 0)
                    {
                        SetLocalInt(oObject, "LOCK_SD", 1);
                        AssignCommand(oObject, ActionSit(GetNearestObjectByTag("Chair", oObject)));
                    }
                    // Condition to activate the Auto Animation. (Fixed lenght: 1h)
                    // Warning: FIRE&FORGET (100 and after...) animations do not last !
                    if (AA != 0)
                    {
                        SetLocalInt(oObject, "LOCK_AA", 1);
                        AssignCommand(oObject, ActionPlayAnimation(AA, 1.0, 3600.0));
                    }
                }
            }
            else if ( DN == 3 )
            {
                if(!GetIsDMPossessed(SPAWN_DONE))
                {
                    if (GetIsObjectValid(SPAWN_DONE) && PLC == 1)
                    {
                        DestroyObject(SPAWN_DONE);
                    }
                    else if (GetIsObjectValid(SPAWN_DONE))
                    {
                        AssignCommand(SPAWN_DONE, ActionSpeakString("It is time to leave..."));
                        SetPlotFlag(SPAWN_DONE,0);
                        AssignCommand(SPAWN_DONE, SetIsDestroyable(TRUE, FALSE));

                        object oDoor = GetNearestObject(OBJECT_TYPE_DOOR, SPAWN_DONE);

                        if (GetIsObjectValid(oDoor))
                        {
                            location lDoor = GetLocation(oDoor);
                            AssignCommand(SPAWN_DONE, ClearAllActions());
                            AssignCommand(SPAWN_DONE, ActionForceMoveToLocation(lDoor));
                            AssignCommand(SPAWN_DONE, ActionDoCommand(DestroyObject(SPAWN_DONE)));
                            AssignCommand(SPAWN_DONE, DelayCommand(30.0, DestroyObject(SPAWN_DONE)));
                        }
                        else
                        {
                            DestroyObject(SPAWN_DONE);
                        }
                    }
                    DeleteLocalObject(oWP, "SPAWN_DONE");
                }
            }
        }
        i++;
        oWP = GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, i);
    }

    ///////////////////////////////////////////////////////////////////////////
    //:: FOR THE DOORS (SHOPS, ...)
    ///////////////////////////////////////////////////////////////////////////
    object oDoor = GetNearestObject(OBJECT_TYPE_DOOR);
    i = 1;

    while (GetIsObjectValid(oDoor))
    {
        int nLock = GetLocalInt(oDoor, "GDSL_DOOR");
        if (nLock > 0) // If it exists, we close door on night...
        {
            if (!GetLocked(oDoor))
            {
                SetLocked(oDoor, TRUE);
                AssignCommand(oDoor, PlaySound("gui_picklockopen"));
            }
        }
        i++;
        oDoor = GetNearestObject(OBJECT_TYPE_DOOR, OBJECT_SELF, i);
    }
}

