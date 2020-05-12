#include "nw_i0_tool"
void main()
{
    object oPC = GetPCSpeaker();
    object oItem10 = GetObjectByTag("bullionbond10");
    object oItem25 = GetObjectByTag("bullionbond25");
    object oItem50 = GetObjectByTag("bullionbond50");

    if (HasItem(oPC, "bullionbond10") || HasItem(oPC, "bullionbond25") || HasItem(oPC, "bullionbond50"))
    {
        if (HasItem(GetPCSpeaker(), "bullionbond10"))
        {
        DestroyObject(oItem10);
        GiveGoldToCreature(GetPCSpeaker(), 10000);
        SpeakString("Thank you.  Here is your gold.");
        }
        if (HasItem(GetPCSpeaker(), "bullionbond25"))
        {
        DestroyObject(oItem25);
        GiveGoldToCreature(GetPCSpeaker(), 25000);
        SpeakString("Thank you.  Here is your gold.");
        }
        if (HasItem(GetPCSpeaker(), "bullionbond50"))
        {
        DestroyObject(oItem50);
        GiveGoldToCreature(GetPCSpeaker(), 50000);
        SpeakString("Thank you.  Here is your gold.");
        }
        return;
    }
    else
    {
    SpeakString("You must have a bullion bond note in order to redeem one!");
    }
}
