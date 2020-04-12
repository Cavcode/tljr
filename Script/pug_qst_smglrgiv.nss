#include "nw_i0_tool"

void main()
{
        object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "SmuglRing");
    if (GetIsObjectValid(oItemToTake) == TRUE)
        {
        // Give the speaker some gold
        GiveGoldToCreature(GetPCSpeaker(), 50);

        // Give the speaker some XP
        RewardPartyXP(100, GetPCSpeaker());


        // Remove items from the player's inventory

        if(GetIsObjectValid(oItemToTake) != 0)
            DestroyObject(oItemToTake);
        // Set the variables
        SetLocalInt(GetPCSpeaker(), "QUEST_SMUGGLERS", GetLocalInt(GetPCSpeaker(), "QUEST_SMUGGLERS")+1);
        SendMessageToPC(GetPCSpeaker(), IntToString(GetLocalInt(GetPCSpeaker(),"QUEST_SMUGGLERS")) + "/5 signet rings turned in.");
        }
}
