// Sets colors to 7
void main()
{
    SetLocalInt(OBJECT_SELF, "ColorToDye", 7);

    ExecuteScript("tlr_dyeskin", OBJECT_SELF);
}
