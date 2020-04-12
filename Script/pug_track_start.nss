void StartCountdownTimer(object oTrack, string sTrack, int nTime, object oPC);

void main()
{
string sTrack = GetStringLeft(GetTag(OBJECT_SELF), GetStringLength(GetTag(OBJECT_SELF))-6);
object oPC = GetEnteringObject();
object oMaster = GetObjectByTag(sTrack);
object oArea = GetArea(oPC);
int nRace = GetLocalInt(oMaster, "RACE_BUSY");
int nInRace = GetLocalInt(oPC, "RACING");

int nTimer = GetLocalInt(oMaster, "TIMER");
int nStart = GetLocalInt(oArea, "START");

if (nRace == 1 && nInRace == TRUE && nStart == FALSE && nTimer == 0)
    {
    SetLocalInt(oMaster, "TIMER", 15);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectParalyze(), oPC, 80.0);
    FloatingTextStringOnCreature("The countdown to begin when all racers are in position", oPC, FALSE);
    StartCountdownTimer(oMaster, sTrack, 15, oPC);

    }
else if (nRace == 1 && nInRace == TRUE && nStart == FALSE && nTimer > 0)
    {
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectParalyze(), oPC, 80.0);
    FloatingTextStringOnCreature("The countdown to begin will start shortly", oPC, FALSE);
    SetLocalInt(oMaster, "TIMER", 15);
    }
else if (nRace == 2 && nInRace == TRUE && nStart == FALSE)
    {
    FloatingTextStringOnCreature("Begin when you are ready, the timer will start when you leave the starting area.", oPC, FALSE);
    }
}

void StartCountdownTimer(object oTrack, string sTrack, int nTime, object oPC)
{
int nClock = GetLocalInt(oTrack, "TIMER");

if (nClock > nTime){nTime = nClock;}
if (nTime > 8)
    {
    SetLocalInt(oTrack, "TIMER", nTime-1);
    DelayCommand(1.0, StartCountdownTimer(oTrack, sTrack, nTime-1, oPC));
    }
else if (nTime == 0)
    {
    object oOther = GetFirstPC();
        while (GetIsObjectValid(oOther) == TRUE)
        {
        if (GetArea(oOther) == GetArea(oPC))
            {
            FloatingTextStringOnCreature("GO!", oOther, FALSE);
            }

            effect eStop = GetFirstEffect(oOther);
            while (GetIsEffectValid(eStop))
                {
                if (GetEffectType(eStop) == EFFECT_TYPE_PARALYZE)
                    {
                    RemoveEffect(oOther, eStop);
                    }
                eStop = GetNextEffect(oOther);
                }
        oOther = GetNextPC();
        }
    SetLocalInt(GetArea(oPC), "START", 1);
    SetLocalInt(oTrack, "TIMER", 0);
    }
else if (nTime <= 8)
    {
    SetLocalInt(oTrack, "TIMER", nTime-1);
    object oOther = GetFirstPC();

        while (GetIsObjectValid(oOther) == TRUE)
        {
        if (GetArea(oOther) == GetArea(oPC))
            {
            FloatingTextStringOnCreature(IntToString(nTime), oOther, FALSE);
            }
        oOther = GetNextPC();
        }
    DelayCommand(1.0, StartCountdownTimer(oTrack, sTrack, nTime-1, oPC));
    }
}
