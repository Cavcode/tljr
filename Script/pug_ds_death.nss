void main()
{
effect eExplode = EffectVisualEffect(464);
ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, GetLocation(OBJECT_SELF));
DestroyObject(OBJECT_SELF);
}
