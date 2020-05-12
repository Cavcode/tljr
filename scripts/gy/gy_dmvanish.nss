void main()
{ object oPC = GetPCSpeaker();
object oTarget; oTarget = oPC;
effect eEffect; eEffect = EffectPolymorph(POLYMORPH_TYPE_NULL_HUMAN);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oTarget);
}
