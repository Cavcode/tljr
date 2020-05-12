#include "nw_i0_tool"

void main()
{
    // Give the speaker some XP
    RewardPartyXP(100, GetPCSpeaker());

    // Give the speaker the items
    CreateItemOnObject("yt2400transport", GetPCSpeaker(), 1);

    // Set the variables
    SetCampaignInt("starwars", "QUEST_SHIP_DONE", TRUE, GetPCSpeaker());


}
