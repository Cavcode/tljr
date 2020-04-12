void main()
{
    SetListening(OBJECT_SELF, FALSE);

    int iNewApp = StringToInt(GetLocalString(OBJECT_SELF, "tlr_Spoken"));
    if (iNewApp < 0) iNewApp = 0;

    SetCreatureBodyPart(CREATURE_PART_HEAD, iNewApp, OBJECT_SELF);
}
