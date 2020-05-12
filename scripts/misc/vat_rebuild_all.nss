//vat_rebuild_all
//strip char to level 1 & restore xp for total level rebuild

void main()
{
    object oPC = GetPCSpeaker();

    //apply visual effect to PC
    //ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_DECK), oPC);

    //zap and restore xp for rebuild
    int iXP = GetXP(oPC);
    SetXP(oPC, 0);
    SetXP(oPC, iXP);
}
