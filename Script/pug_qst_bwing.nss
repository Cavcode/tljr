#include "nw_i0_tool"

void main()
{
    // Give the speaker some XP
    RewardPartyXP(100, GetPCSpeaker());

    // Give the speaker the items
    CreateItemOnObject("bwingpermit", GetPCSpeaker(), 1);

    // Set the variables
    SetCampaignInt("starwars", "QUEST_SHIP_DONE", TRUE, GetPCSpeaker());


}
