
void main()
{
    int nMatch = GetListenPatternNumber();
    object oShouter = GetLastSpeaker();

    if (nMatch == 1337 && GetName(oShouter) == GetLocalString(OBJECT_SELF, "RECORDER"))
        {
            string sMessage = GetMatchedSubstring(0);

            SetLocalString(GetNearestObjectByTag("GalacticHoloNetTerminal", OBJECT_SELF, 1), "MESSAGE", sMessage);
        }

}
