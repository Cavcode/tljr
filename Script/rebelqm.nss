#include "nw_i0_plot"
void main()
{
    object oStore = GetNearestObjectByTag("RebelStore");
    if (GetObjectType(oStore) == OBJECT_TYPE_STORE)
    {
        gplotAppraiseOpenStore(oStore, GetPCSpeaker());
    }
    else
    {
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
    }
}