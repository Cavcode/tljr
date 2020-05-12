void main()
{
object oPC = GetLastUsedBy();
object oBomb = OBJECT_SELF;
int nStr = GetLocalInt(OBJECT_SELF, "BOMB_STR");
int nDisable = GetSkillRank(2, oPC, FALSE);
int nBombRoll = d20(1);
int nInt = GetAbilityModifier(ABILITY_INTELLIGENCE ,oPC);

if (nBombRoll == 1)
    {
    DestroyObject(oBomb);
    FloatingTextStringOnCreature("Success", oPC, FALSE);
    }
else if (nBombRoll == 20)
    {
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE), oBomb);
    FloatingTextStringOnCreature("The bomb has detonated", oPC, FALSE);
    }
else if ( (nBombRoll+nStr) - (nDisable+nInt) > 0 && (nBombRoll+nStr) - (nDisable+nInt) < 4)
    {
    FloatingTextStringOnCreature("Attempt Failed", oPC, FALSE);
    }
else if ( (nBombRoll+nStr) - (nDisable+nInt) > 4)
    {
    FloatingTextStringOnCreature("Attempt Failed", oPC, FALSE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE), oBomb);
    FloatingTextStringOnCreature("The bomb has detonated", oPC, FALSE);
    }
else
    {
    DestroyObject(oBomb);
    FloatingTextStringOnCreature("Success", oPC, FALSE);
    }

}
