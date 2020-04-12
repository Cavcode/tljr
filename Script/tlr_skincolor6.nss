// Sets colors to 6
void main()
{
    SetLocalInt(OBJECT_SELF, "ColorToDye", 6);

    ExecuteScript("tlr_dyeskin", OBJECT_SELF);
}
