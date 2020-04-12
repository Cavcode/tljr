#include "pug_inc"

int StartingConditional()
{
    int nSkill = GetLocalInt(GetPCSpeaker(), "CONVO_SKILL");
    int nDif = GetLocalInt(GetPCSpeaker(), "CONVO_DC");
    int nRank = GetSkillRank(nSkill, GetPCSpeaker(), FALSE)-GetLocalInt(OBJECT_SELF, IntToString(nSkill)+"_RANK");
    // Perform skill checks

    if(CustomSkillCheck(nDif, nRank, GetPCSpeaker()) == TRUE)
        {return TRUE;}
    else
        {return FALSE;}
}
