// Sets colors to 0
void main()
{
    SetLocalInt(OBJECT_SELF, "ColorToDye", 0);

    ExecuteScript("tlr_dyeskin", OBJECT_SELF);
}
