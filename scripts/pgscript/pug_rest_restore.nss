void main()
{
string nDescription = GetLocalString(GetPCSpeaker(), "CURRENT_DESCRIPTION");
SetDescription(GetPCSpeaker(), nDescription, TRUE);
}
