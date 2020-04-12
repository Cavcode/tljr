void main()
{
if (GetLocalInt(OBJECT_SELF, "HAK_ATTEMPTS") == 0)
    {
    SetLocalInt(OBJECT_SELF, "HAK_ATTEMPTS", 4);
    }
AssignCommand(GetLastUsedBy(), ActionStartConversation (OBJECT_SELF, "pug_msn_computer", TRUE, FALSE));
}
