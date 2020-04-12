// Sets colors to 1
void main()
{
    SetLocalInt(OBJECT_SELF, "ColorToDye", 1);

    ExecuteScript("tlr_dyeskin", OBJECT_SELF);
}
