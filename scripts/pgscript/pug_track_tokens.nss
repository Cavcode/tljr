
const int RACE_SIZE = 5;//this is the max number of people in one race

void main()
{
object oMaster = OBJECT_SELF;
object oRacer;
string sTrack = GetTag(oMaster);
int nMaxLap = GetLocalInt(oMaster, "RACE_MAXLAP");
int nToken = 956000;
int x = 1;

for (x = 1; x < (RACE_SIZE+1); x++)
    {
    oRacer = GetLocalObject(oMaster, sTrack+"_pos_"+IntToString(x));
    if (GetIsObjectValid(oRacer))
        {
        SetCustomToken(nToken+x, "Position "+IntToString(x)+": "+GetName(oRacer));
        }
    else if (GetIsObjectValid(oRacer) == FALSE)
        {
        SetCustomToken(nToken+x, "Position "+IntToString(x)+": Empty");
        }
    }
string sMsg;
if (nMaxLap == 0)
    {
    nMaxLap = 3;
    SetLocalInt(oMaster, "RACE_MAXLAP", 3);
    }
if (nMaxLap == 1)
    {sMsg = "This race will be 1 lap.";}
else
    {sMsg = "This race will be "+IntToString(nMaxLap)+" laps.";}
SetCustomToken(957000, sMsg);
}
