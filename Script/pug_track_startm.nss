
const int RACE_SIZE = 5;//this is the max number of people in one race

void main()
{
object oMaster = OBJECT_SELF;
string sTrack = GetTag(oMaster);
object oRacer; int x;

AssignCommand(oMaster, ActionSpeakString("The race will now begin!", TALKVOLUME_TALK));

for (x = 1; x < (RACE_SIZE+1); x++)
    {
    oRacer = GetLocalObject(oMaster, sTrack+"_pos_"+IntToString(x));

    if (GetIsObjectValid(oRacer))
        {
        ExecuteScript("clearactions", oRacer);
        FloatingTextStringOnCreature("Your race is starting", oRacer, FALSE);
        SetLocalInt(oRacer, "RACING", TRUE);
        SetLocalInt(oRacer, "RACE_LAP", 0);
        SetLocalInt(oRacer, "CHECKPOINT", 0);
        SetLocalInt(oMaster, "TIMER", 0);
        DelayCommand(2.1, AssignCommand(oRacer,ActionJumpToLocation(GetLocation(GetWaypointByTag(sTrack+"_start_"+IntToString(x))))));
        }
    }
SetLocalInt(OBJECT_SELF, "RACE_BUSY", TRUE);
ExecuteScript("pug_track_cancel", OBJECT_SELF);


}
