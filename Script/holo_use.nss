void main()
{
 int nInUse = GetLocalInt(OBJECT_SELF, "INUSE");
 object oHolo = GetLocalObject(OBJECT_SELF, "HOLOGRAM");

    if (GetIsObjectValid(oHolo) == FALSE)
        {
            ActionStartConversation(GetLastUsedBy(), "holonetnew", TRUE, FALSE);
        }

    if (GetIsObjectValid(oHolo) == TRUE)
        {
            SpeakString("Hologram In Use", TALKVOLUME_TALK);
        }
}
