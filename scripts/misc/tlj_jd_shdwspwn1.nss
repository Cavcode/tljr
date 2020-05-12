
void main()
{
    effect eVFX;
    object oSelf = OBJECT_SELF;


    // Apply a visual effect.
    eVFX = SupernaturalEffect(EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR));
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oSelf);
}

