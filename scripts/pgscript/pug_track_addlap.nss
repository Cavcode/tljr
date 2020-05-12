void main()
{
object oMaster = OBJECT_SELF;

SetLocalInt(oMaster, "RACE_MAXLAP", GetLocalInt(oMaster, "RACE_MAXLAP")+1);

int nMaxLap =GetLocalInt(oMaster, "RACE_MAXLAP");
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
