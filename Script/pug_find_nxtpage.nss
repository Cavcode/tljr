void main() //CUSTOM654001
{
object oPC = GetPCSpeaker();
object oPerson = GetFirstPC();
int x = 1;
int nPage = GetLocalInt(OBJECT_SELF, "INFO_PAGE")+5;
while (GetIsObjectValid(oPerson) == TRUE)
    {
    if (GetIsDM(oPC)==FALSE)
        {
        SetLocalObject(OBJECT_SELF, "INFO_PERSON_"+IntToString(x), oPerson);
        x++;
        }
    oPerson = GetNextPC();
    }
SetCustomToken(654001, GetName(GetLocalObject(OBJECT_SELF, "INFO_PERSON_"+IntToString(1+nPage))));
SetCustomToken(654002, GetName(GetLocalObject(OBJECT_SELF, "INFO_PERSON_"+IntToString(2+nPage))));
SetCustomToken(654003, GetName(GetLocalObject(OBJECT_SELF, "INFO_PERSON_"+IntToString(3+nPage))));
SetCustomToken(654004, GetName(GetLocalObject(OBJECT_SELF, "INFO_PERSON_"+IntToString(4+nPage))));
SetCustomToken(654005, GetName(GetLocalObject(OBJECT_SELF, "INFO_PERSON_"+IntToString(5+nPage))));
SetLocalInt(OBJECT_SELF, "INFO_PAGE", nPage);
}
