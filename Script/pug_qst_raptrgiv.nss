#include "nw_i0_tool"

void main()
{
        object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "RaptorBadge");
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
        SetLocalInt(GetPCSpeaker(), "QUEST_RAPTOR", GetLocalInt(GetPCSpeaker(), "QUEST_RAPTOR")+1);
        SendMessageToPC(GetPCSpeaker(), IntToString(GetLocalInt(GetPCSpeaker(),"QUEST_RAPTOR")) + "/5 raptor badges turned in.");
        }
}
