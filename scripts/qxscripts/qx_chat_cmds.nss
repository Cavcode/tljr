///////////// talk commands !crawl ////////////////
#include "qx_inc_db"
const int PHENO_CRAWLING = 9;

void chat_togglecrawl(object oPC)
{
    ///////////// !crawl ////////////////
        // Don't allow crawling if robe equipped.
        int iPassed = 0;
        //if(GetLevelByClass(CLASS_TYPE_MONK, GetPCSpeaker()) >= 6)
        if(GetItemAppearance(GetItemInSlot(INVENTORY_SLOT_CHEST, oPC), ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_ROBE) == 0 && GetPhenoType(oPC) != 22)
            iPassed = 1;
        if(iPassed)
        {
            int nPheno = GetPhenoType(oPC);
            int nPhenoTo;
            int nStr = GetAbilityModifier(ABILITY_STRENGTH , oPC);
            int nDex = GetAbilityModifier(ABILITY_DEXTERITY , oPC);
            int nSpeedDec = 90 - (nDex/2 + nStr);
            int nAC = 3;
            effect eMove = EffectMovementSpeedDecrease(nSpeedDec);
            effect eAC = EffectACIncrease(nAC);
            effect eMS = EffectSkillIncrease(SKILL_MOVE_SILENTLY,5);
            effect eLink = EffectLinkEffects(eMove, eAC);
            eLink = EffectLinkEffects(eLink,eMS);

            nPhenoTo = PHENO_CRAWLING;

            if (nPheno == PHENOTYPE_NORMAL)
            {
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oPC);
                SendMessageToPC(oPC, "You kneel down and start crawling on the ground. Movement speed decreased by %" + IntToString(nSpeedDec) + " and AC increased by " + IntToString(nAC) + ".");
                SetPhenoType(nPhenoTo,oPC);
            }
            else
            {
                SetPhenoType(PHENOTYPE_NORMAL,oPC);

                effect eEffect = GetFirstEffect(oPC);
                while (GetIsEffectValid(eEffect) == TRUE)
                {
                    if (GetEffectType(eEffect) == EFFECT_TYPE_AC_INCREASE || GetEffectType(eEffect) == EFFECT_TYPE_MOVEMENT_SPEED_DECREASE)
                    {
                        RemoveEffect(oPC, eEffect);
                    }
                    eEffect = GetNextEffect(oPC);
                }
                SendMessageToPC(oPC, "You stand up.");
            }
        }
}

void chat_givexp(object oPC, int nAmount)
{
    GiveXPToCreature(oPC, nAmount);
}

void chat_givegold(object oPC, int nAmount)
{
    GiveGoldToCreature(oPC, nAmount);
}

void chat_giveitem(object oPC, string sResRef)
{
    if (CreateItemOnObject(sResRef, oPC) == OBJECT_INVALID)
        SendMessageToPC(oPC,"Item: " + sResRef + " is not in the palette.");
}

void chat_uptime(object oPC)
{
    int nUptime = GetLocalInt(GetModule(), "uptime");
    int nResetTime = GetLocalInt(GetModule(), "reset_seconds");

    string sMessage = GetUptimeText( nUptime, nResetTime);
    SendMessageToPC(oPC, sMessage);
}

