

void main()
{
    // Get Last Speaker
    object oPC = GetLastSpeaker();
    // Assign Animation
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 60000.0f));
}
