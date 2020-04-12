int StartingConditional()
{
int x = 1;
int nMax = 5;
string sTrack = GetTag(OBJECT_SELF);
object oRacer;
int nCount;
for (x = 1; x < (nMax+1); x++)
    {
    oRacer = GetLocalObject(OBJECT_SELF, sTrack+"_pos_"+IntToString(x));

    if (GetIsObjectValid(oRacer))
        {
        nCount++;
        }
    }

    // Inspect local variables
    if(!(GetLocalObject(OBJECT_SELF, sTrack+"_pos_1") == GetPCSpeaker() && nCount > 1))
        return FALSE;

    return TRUE;
}
