void main()
{
    object oPC = GetEnteringObject();
    string descrip = GetLocalString(OBJECT_SELF, "descrip");
    string flag = GetLocalString(OBJECT_SELF, "flag");
    string flagPC = GetLocalString(oPC, "flag");

    if (!(flag == flagPC))
    {
        SendMessageToPC(oPC, "<c þþ>" + descrip + "</c>");
        SendMessageToAllDMs(descrip);
    }
}
