// Sets colors to 5
void main()
{
    SetLocalInt(OBJECT_SELF, "ColorToDye", 5);

    ExecuteScript("tlr_dyeskin", OBJECT_SELF);
}
