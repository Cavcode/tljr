
#include "qx_inc_spells"

void main()
{
    //Get the first object in the persistant AOE
    object oTarget;
    oTarget = GetFirstInPersistentObject();
    while(GetIsObjectValid(oTarget))
    {
        QXspellsStinkingCloud(d4(2), oTarget);
        //Get the next target in the AOE
        oTarget = GetNextInPersistentObject();
    }
}
