#include "nwnx_creature"
void main()
{
object oPC = OBJECT_SELF;
object oItem = GetItemPossessedBy(oPC, "speederblaster1");
string sOwner = GetLocalString(oPC, "BIKE_OWNER");
if (GetIsObjectValid(oItem)==TRUE)
    {
        if (GetPhenoType(oPC) == 22 || GetPhenoType(oPC) == 23)
            {
            int nPheno = GetLocalInt(oPC, "PHENO");
            SetCreatureTailType(CREATURE_TAIL_TYPE_NONE, oPC);
            SetPhenoType(nPheno, oPC);
            }
        SetLocalInt(oPC,"BIKE", 0);

        NWNX_Creature_SetMovementRate(oPC, GetLocalInt(oPC,"SPEED"));

        effect ePolymorph = GetFirstEffect(oPC);
            while (GetIsEffectValid(ePolymorph))
            {
                if (GetEffectType(ePolymorph) == EFFECT_TYPE_MOVEMENT_SPEED_INCREASE)
                {
                RemoveEffect(oPC, ePolymorph);
                }
                if (GetEffectType(ePolymorph) == EFFECT_TYPE_HASTE)
                {
                    RemoveEffect(oPC, ePolymorph);
                }
                ePolymorph = GetNextEffect(oPC);
            }
        DestroyObject(oItem, 0.1);
        if (sOwner == GetName(oPC))
            {
            SetLocalInt(oPC, "SPEEDER_BIKE", FALSE);
            }
        else
            {
            object oOther = GetFirstPC();
            while (GetIsObjectValid(oOther) == TRUE)
                {
                if (sOwner == GetName(oOther))
                    {
                    SetLocalInt(oOther, "SPEEDER_BIKE", FALSE);
                    }
                oOther = GetNextPC();
                }
            }
    }
}
