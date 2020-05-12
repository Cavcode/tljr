#include "nw_i0_tool"

void main()
{
        object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "WampaHide");
    if (GetIsObjectValid(oItemToTake) == TRUE)
    {
        // Give the speaker some gold
        GiveGoldToCreature(GetPCSpeaker(), 175);

        // Give the speaker some XP
        RewardPartyXP(500, GetPCSpeaker());


        // Remove items from the player's inventory

        if(GetIsObjectValid(oItemToTake) != 0)
            DestroyObject(oItemToTake);
        // Set the variables
        SetLocalInt(GetPCSpeaker(), "QUEST_HIDES", GetLocalInt(GetPCSpeaker(), "QUEST_HIDES")+1);
        SendMessageToPC(GetPCSpeaker(), IntToString(GetLocalInt(GetPCSpeaker(),"QUEST_HIDES")) + "/5 hides turned in.");
    }
}
