// Sets colors to 2
void main()
{
    SetLocalInt(OBJECT_SELF, "ColorToDye", 2);

    ExecuteScript("tlr_dyeskin", OBJECT_SELF);
}
