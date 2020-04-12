// Sets colors to 3
void main()
{
    SetLocalInt(OBJECT_SELF, "ColorToDye", 3);

    ExecuteScript("tlr_dyeskin", OBJECT_SELF);
}
