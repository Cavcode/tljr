void main()//<CUSTOM40405909>
{
object oTrader = GetNextPC();
SetLocalObject(GetPCSpeaker(), "CMRC_VIEW_PERSON", oTrader);
while (GetIsPC(oTrader) == TRUE && GetIsObjectValid(oTrader)==TRUE && GetIsObjectValid(GetItemPossessedBy(oTrader, "TraderBadge"))!=TRUE)
    {
    oTrader = GetNextPC();
    SetLocalObject(GetPCSpeaker(), "CMRC_VIEW_PERSON", oTrader);
    }
if (GetIsObjectValid(oTrader) == TRUE)
    {
    SetCustomToken(40405909, "What would you like to do with "+GetName(oTrader)+"?");
    }
else
    {
    SetCustomToken(40405909, "There are no more members currently available");
    }
}
