#include "x0_i0_anims"
//#include "x0_i0_walkway"
#include "x0_i0_treasure"
void main()
{
int nApp;
int x = Random(4)+1;

if (x==1) {nApp = 10058;}
if (x==2) {nApp = 10055;}
if (x==3) {nApp = 10056;}
if (x==4) {nApp = 10057;}
if (x==5) {nApp = 2158;}

SetCreatureAppearanceType(OBJECT_SELF, nApp);

if (GetTag(OBJECT_SELF) == "droid_wander")
    {DelayCommand(3.0, ActionRandomWalk());}
else if (GetTag(OBJECT_SELF) == "droid_sitter")
    {
    object oChair = GetNearestObjectByTag("Sit", OBJECT_SELF);
    DelayCommand(3.0, AssignCommand(OBJECT_SELF, ActionSit(oChair)));
    //AssignCommand(OBJECT_SELF, ActionSit(GetObjectByTag("sitonme")));
    }
else {WalkWayPoints(FALSE, 3.0);}
}
