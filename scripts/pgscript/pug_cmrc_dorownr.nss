void main()
{
object oPC = GetClickingObject();
string sTag = GetStringRight(GetTag(OBJECT_SELF), GetStringLength(GetTag(OBJECT_SELF))-7);
if (GetCampaignInt("cmrcgld", "CMRC_RANK", oPC) > 1 && GetCampaignString("cmrcgld", "OWNER_"+sTag) == GetName(oPC) )
    {
    ActionOpenDoor(OBJECT_SELF);
    DelayCommand(8.0, ActionCloseDoor(OBJECT_SELF));
    }
}
