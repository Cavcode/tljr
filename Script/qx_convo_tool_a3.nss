//::///////////////////////////////////////////////
//:: FileName qx_convo_tool_a2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/4/2008 3:34:52 AM
//:://////////////////////////////////////////////
const int PHENO_CRAWLING = 9;

void main()
{

    object oPC = GetPCSpeaker();
    int nPheno = GetPhenoType(oPC);
    int nPhenoTo;
    int nStr = GetAbilityModifier(ABILITY_STRENGTH , oPC);
    int nDex = GetAbilityModifier(ABILITY_DEXTERITY , oPC);
    int nSpeedDec = 90 - (nDex/2 + nStr);
    int nAC = 3;
    effect eMove = EffectMovementSpeedDecrease(nSpeedDec);
    effect eAC = EffectACIncrease(nAC);
    effect eLink = EffectLinkEffects(eMove, eAC);

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
