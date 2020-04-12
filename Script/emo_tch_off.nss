void main()
{
    object oPC = GetLastSpeaker();;

    //turns off touching

   // Apply Ghost Effect/etc
    effect eGhost = EffectCutsceneGhost();
    eGhost = SupernaturalEffect( eGhost );
    RemoveEffect(oPC, eGhost);

}
