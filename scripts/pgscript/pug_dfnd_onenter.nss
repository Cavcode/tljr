#include "pug_inc"
void main()
{
int nDefenders = GetLocalInt(OBJECT_SELF, "DEFENDERS");
if (nDefenders == 0){nDefenders = 10;}
if (GetIsObjectValid(GetWaypointByTag(GetTag(OBJECT_SELF)+"_SPAWN")) && GetLocalInt(OBJECT_SELF, "SETUP") == FALSE)
    {
    SetLocalInt(OBJECT_SELF, "SETUP", TRUE);
    DelayCommand(12.0, SetUpBase(GetTag(OBJECT_SELF), nDefenders));
    }
}
