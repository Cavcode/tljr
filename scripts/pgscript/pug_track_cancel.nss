
const int RACE_SIZE = 5;//this is the max number of people in one race

void main()
{
object oMaster = OBJECT_SELF;
object oRacer;
string sTrack = GetTag(oMaster);
int nToken = 956000;
int x = 1;

for (x = 1; x < (RACE_SIZE+1); x++)
    {
    DeleteLocalObject(oMaster, sTrack+"_pos_"+IntToString(x));
    SetCustomToken(nToken+x, "Position "+IntToString(x)+": Empty");
    }
}
