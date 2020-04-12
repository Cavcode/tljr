void main()
{
    object oPC = GetLastSpeaker();;

    //allows characters to get close to each othere

   // Apply Ghost Effect/etc
    effect eGhost = EffectCutsceneGhost();
    eGhost = SupernaturalEffect( eGhost );
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eGhost,oPC);

}
