void main()
{
if (GetIsSkillSuccessful(GetLastUsedBy(), SKILL_OPEN_LOCK, 30) )
    {
    AssignCommand(OBJECT_SELF, ActionSpeakString("Classified: Pick up and deliver Cargo to Grand Chancellor Palpatine", TALKVOLUME_TALK));
    }
}
