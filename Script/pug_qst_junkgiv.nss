#include "nw_i0_tool"

void main()
{
        object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "DroidParts");
    if (GetIsObjectValid(oItemToTake) == TRUE)
        {
        // Give the speaker some gold
        GiveGoldToCreature(GetPCSpeaker(), 75);

        // Give the speaker some XP
        RewardPartyXP(200, GetPCSpeaker());


        // Remove items from the player's inventory

        if(GetIsObjectValid(oItemToTake) != 0)
            DestroyObject(oItemToTake);
        // Set the variables
        SetLocalInt(GetPCSpeaker(), "QUEST_JUNK", GetLocalInt(GetPCSpeaker(), "QUEST_JUNK")+1);
        SendMessageToPC(GetPCSpeaker(), IntToString(GetLocalInt(GetPCSpeaker(),"QUEST_JUNK")) + "/5 droid parts turned in.");
        }
}
