void main()
{
object oPC = GetClickingObject();

if(GetIsObjectValid(GetItemPossessedBy(oPC, "TraderBadge"))==TRUE && GetCampaignInt("cmrcgld", "CMRC_RANK", oPC) > 3 && GetCampaignString("cmrcgld", "CMRC_PRESIDENT") == GetName(oPC) )
    {
    ActionOpenDoor(OBJECT_SELF);
    DelayCommand(8.0, ActionCloseDoor(OBJECT_SELF));
    }
}
