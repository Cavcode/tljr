void main()
{
    object choppah = GetObjectByTag("Battlefield001",0);


    if (GetLocalInt(choppah,"NW_L_AMION") == 0)
    {
        object oSelf = choppah;
        AssignCommand(choppah,PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
        //DelayCommand(0.4,SetPlaceableIllumination(oSelf, TRUE));
        SetLocalInt(choppah,"NW_L_AMION",1);
        //DelayCommand(0.5,RecomputeStaticLighting(GetArea(oSelf)));
        effect eLight = EffectVisualEffect(VFX_DUR_LIGHT_YELLOW_20);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLight, oSelf);
    }
    else
    {
        object oSelf = choppah;
        AssignCommand(choppah,PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
        //DelayCommand(0.4,SetPlaceableIllumination(oSelf, FALSE));
        SetLocalInt(choppah,"NW_L_AMION",0);
        //DelayCommand(0.9,RecomputeStaticLighting(GetArea(oSelf)));
        effect eEffect = GetFirstEffect(oSelf);
        while (GetIsEffectValid(eEffect) == TRUE)
        {
            if (GetEffectType(eEffect) == EFFECT_TYPE_VISUALEFFECT)
                RemoveEffect(oSelf, eEffect);
            eEffect = GetNextEffect(oSelf);
        }

    }
}
