#include "nw_i0_plot"
void main()
{
    string storeName = GetLocalString(OBJECT_SELF,"store");
    string storeName2 = GetLocalString(OBJECT_SELF,"store2");
    string storeName3 = GetLocalString(OBJECT_SELF,"store3");
    string storeName4 = GetLocalString(OBJECT_SELF,"store4");

    object oStore = GetNearestObjectByTag(storeName);
    if (GetObjectType(oStore) == OBJECT_TYPE_STORE)
    {
        OpenStore(oStore, GetPCSpeaker());
    }
    else
    {
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
    }
}
