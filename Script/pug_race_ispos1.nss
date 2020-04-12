int StartingConditional()
{
int x = 1;
string sTrack = GetTag(OBJECT_SELF);
    // Inspect local variables
    if(!(GetIsObjectValid(GetLocalObject(OBJECT_SELF, sTrack+"_pos_"+IntToString(x)))))
        return FALSE;

    return TRUE;
}
