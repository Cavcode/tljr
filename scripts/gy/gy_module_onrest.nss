/*
gy_module_onrest  module on rest works with generic triggers to allow restsin certain areas only
also starts conversation from rest button
*/
#include "pug_points"
void NerfSkills(object oPC);

void main()
{


    object oPC = GetLastPCRested();
    int bAllow = GetLocalInt(oPC,"restallow");
    int bReallyResting = GetLocalInt(oPC,"GY_ReallyResting");
    int nResting = GetLocalInt(oPC, "REST");
    int iRestType =   GetLastRestEventType();

    ExecuteScript("jedi_oprest", oPC);
    SetLocalInt(oPC, "SHIP_FLYING", FALSE);
    SetLocalInt(oPC, "DEAD", FALSE);
    ApplyPoints();
    if  (iRestType == REST_EVENTTYPE_REST_STARTED)
    {
        SendMessageToPC(oPC,"Rest Started");
        if   ( (bAllow == 0)&& (nResting == FALSE)) // not allowed and not wanting to rest so start conversation
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand (oPC, ActionStartConversation (oPC, "mod_rest", TRUE,FALSE));
        }

        else if ((bAllow == 0)&&  (nResting == TRUE))
        {
            //AssignCommand(oPC, ClearAllActions());
            //SendMessageToPC(oPC,"You may not rest here, find a bed or camp.");
            SetLocalInt(oPC,"REST",FALSE);
        }
       /* else if ( (bAllow == 1) &&  (nResting == TRUE))
        {
            SetLocalInt(oPC,"GY_ReallyResting",FALSE);
        }
        else  // allowed but not really resting so start conversation
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand (oPC, ActionStartConversation (oPC, "mod_rest", TRUE,FALSE));
        } */

    }
    else
    {
        SetLocalInt(oPC,"GY_ReallyResting",FALSE);
        //NerfSkills(oPC);
    }

}

void NerfSkills(object oPC)
{
    effect  eSkillPenalty;
    if (GetHasSkill(SKILL_PICK_POCKET, oPC))
    {
        eSkillPenalty  = EffectSkillDecrease(SKILL_PICK_POCKET, 100);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSkillPenalty, oPC);
    }
}
