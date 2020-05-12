void main()//654006
{
int nAmount = 1000;
object oPC = GetPCSpeaker();
int nChoice = GetLocalInt(GetPCSpeaker(), "CONVO_CHOICE");
int nPage = GetLocalInt(OBJECT_SELF, "INFO_PAGE");
object oTarget = GetLocalObject(OBJECT_SELF, "INFO_PERSON_"+IntToString(nChoice+nPage));

if (GetGold(oPC) < nAmount)
    {
    SetCustomToken(654006, "You don't even have that many credits. Is there anything else?");
    }
else if (GetIsObjectValid(oTarget) == TRUE && GetIsObjectValid(GetArea(oTarget)) == TRUE && GetGold(oPC) >= nAmount)
    {
    SetCustomToken(654006, GetName(oTarget)+"'s current location is "+GetName(GetArea(oTarget))+". Is there anything else?");
    TakeGoldFromCreature(nAmount, oPC, TRUE);
    }
else if (GetIsObjectValid(oTarget) == TRUE && GetIsObjectValid(GetArea(oTarget)) == FALSE && GetGold(oPC) >= nAmount)
    {
    SetCustomToken(654006, "I don't know "+GetName(oTarget)+"'s current location. Is there anything else?");
    }
}
