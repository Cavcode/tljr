
void main()
{
    // Get Last Speaker
    object oPC = GetLastSpeaker();
    // Assign Animation
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, 60000.0f));
}
