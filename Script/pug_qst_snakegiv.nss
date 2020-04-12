#include "nw_i0_tool"

void main()
{
        object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "SnakeVenom");
    if (GetIsObjectValid(oItemToTake) == TRUE)
        {
        // Give the speaker some gold
        GiveGoldToCreature(GetPCSpeaker(), 25);

        // Give the speaker some XP
        RewardPartyXP(25, GetPCSpeaker());


        // Remove items from the player's inventory

        if(GetIsObjectValid(oItemToTake) != 0)
            DestroyObject(oItemToTake);
        // Set the variables
        SetLocalInt(GetPCSpeaker(), "QUEST_SNAKES", GetLocalInt(GetPCSpeaker(), "QUEST_SNAKES")+1);
        SendMessageToPC(GetPCSpeaker(), IntToString(GetLocalInt(GetPCSpeaker(),"QUEST_SNAKES")) + "/5 snake venoms turned in.");
        }
}
