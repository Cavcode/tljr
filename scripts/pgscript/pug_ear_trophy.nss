void main()
{
object oPC = GetPCSpeaker();
string sChoice = GetLocalString(GetPCSpeaker(), "EAR_CHOICE");
object oItem = GetLocalObject(oPC, "EAR_TRADE_"+sChoice);

object oEar = CreateItemOnObject("pug_ear", oPC, 1, "trophy_ear");
SetName(oEar, "Trophy: "+GetName(oItem));
DestroyObject(oItem);
if (GetDroppableFlag(oEar) == FALSE)
    {
    SetDroppableFlag(oEar, TRUE);
    }
}
