void main() //CUSTOM654001
{
object oPC = GetPCSpeaker();
object oPerson = GetFirstPC();
int x = 1;

while (GetIsObjectValid(oPerson) == TRUE)
    {
    if (GetIsDM(oPC)==FALSE)
        {
        SetLocalObject(OBJECT_SELF, "INFO_PERSON_"+IntToString(x), oPerson);
        x++;
        }
    oPerson = GetNextPC();
    }
SetCustomToken(654001, GetName(GetLocalObject(OBJECT_SELF, "INFO_PERSON_1")));
SetCustomToken(654002, GetName(GetLocalObject(OBJECT_SELF, "INFO_PERSON_2")));
SetCustomToken(654003, GetName(GetLocalObject(OBJECT_SELF, "INFO_PERSON_3")));
SetCustomToken(654004, GetName(GetLocalObject(OBJECT_SELF, "INFO_PERSON_4")));
SetCustomToken(654005, GetName(GetLocalObject(OBJECT_SELF, "INFO_PERSON_5")));
SetLocalInt(OBJECT_SELF, "INFO_PAGE", 0);
}
