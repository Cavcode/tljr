void main()
{
    int nThisQuest = GetLocalInt(OBJECT_SELF, "QUEST");
    // Set the variables
    SetLocalInt(GetPCSpeaker(), "Q"+IntToString(nThisQuest)+"_STARTED", 1);

}
