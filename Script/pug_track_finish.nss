void main()
{
string sTrack = GetStringLeft(GetTag(OBJECT_SELF), GetStringLength(GetTag(OBJECT_SELF))-7);
object oWinner = GetEnteringObject();
object oMaster = GetObjectByTag(sTrack);
object oArea = GetArea(oWinner);
int nRace = GetLocalInt(oMaster, "RACE_BUSY");
int nInRace = GetLocalInt(oWinner, "RACING");
object oOther = GetFirstPC();
int nCheck = GetLocalInt(oWinner, "CHECKPOINT");
int nLap = GetLocalInt(oWinner, "RACE_LAP");
int nMaxLap = GetLocalInt(oMaster, "RACE_MAXLAP");

if (nRace == 1 && nInRace == TRUE && nCheck >= 3 && nLap == nMaxLap-1)
    {
    SetLocalInt(oMaster, "RACE_BUSY", FALSE);
    SetLocalInt(oWinner, "RACE_LAP", 0);
    SetLocalInt(oWinner, "CHECKPOINT", 0);
    while (GetIsObjectValid(oOther) == TRUE)
        {
        if (GetArea(oOther) == oArea)
            {
            FloatingTextStringOnCreature(GetName(oWinner)+" has won the race!", oOther, FALSE);
            SetLocalInt(oOther, "RACING", FALSE);
            }
        oOther = GetNextPC();
        }
    SetLocalInt(oArea, "START", FALSE);
    SetCampaignInt("swraces", "WINS", GetCampaignInt("swraces", "WINS", oWinner)+1, oWinner);
    DelayCommand(7.0, ExecuteScript("clearactions", oWinner));
    DelayCommand(7.5, AssignCommand(oWinner, ActionJumpToLocation(GetLocation(GetObjectByTag(sTrack)))));
    }
else if (nRace == 1 && nInRace == TRUE && nCheck >= 3 && nLap < nMaxLap)
    {
    SetLocalInt(oWinner, "CHECKPOINT", 0);
    SetLocalInt(oWinner, "RACE_LAP", nLap+1);
    FloatingTextStringOnCreature("Lap "+IntToString(nLap+1)+" out of "+IntToString(nMaxLap), oWinner, FALSE);
    }
else if(nRace == 0)
    {
    SetLocalInt(oWinner, "CHECKPOINT", 0);
    DelayCommand(4.0, ExecuteScript("clearactions", oWinner));
    DelayCommand(4.5, AssignCommand(oWinner, ActionJumpToLocation(GetLocation(GetObjectByTag(sTrack)))));
    }


}
