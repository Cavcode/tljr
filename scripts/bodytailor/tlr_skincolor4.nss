// Sets colors to 4
void main()
{
    SetLocalInt(OBJECT_SELF, "ColorToDye", 4);

    ExecuteScript("tlr_dyeskin", OBJECT_SELF);
}
