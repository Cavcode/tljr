#include "nw_i0_tool"

void main()
{
        object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "ShyrackWing");
    if (GetIsObjectValid(oItemToTake) == TRUE)
        {
        // Give the speaker some gold
        GiveGoldToCreature(GetPCSpeaker(), 150);

        // Give the speaker some XP
        RewardPartyXP(450, GetPCSpeaker());


        // Remove items from the player's inventory

        if(GetIsObjectValid(oItemToTake) != 0)
            DestroyObject(oItemToTake);
        // Set the variables
        SetLocalInt(GetPCSpeaker(), "QUEST_WINGS", GetLocalInt(GetPCSpeaker(), "QUEST_WINGS")+1);
        SendMessageToPC(GetPCSpeaker(), IntToString(GetLocalInt(GetPCSpeaker(),"QUEST_WINGS")) + "/5 shyrack wings turned in.");
        }
}
