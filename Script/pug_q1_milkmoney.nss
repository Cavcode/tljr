#include "nw_i0_tool"
void main()
{
    object oPC = GetPCSpeaker();

    if(HasItem(GetPCSpeaker(), "pug_q1_fullbucke"))
        {
        if(GetLocalInt(oPC,"bucket") == 0 )
        {
            // Give the speaker some gold
            GiveGoldToCreature(GetPCSpeaker(), 25);
            // Give the speaker some XP
            GiveXPToCreature(GetPCSpeaker(), 50);
        }
        SetLocalInt(oPC,"bucket",1);

        ActionTakeItem(GetItemPossessedBy(oPC, "pug_q1_fullbucke"), oPC);
        }

}
