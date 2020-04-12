void main()
{
object oPC = GetClickingObject();
string sHouse = GetStringRight(GetTag(OBJECT_SELF), GetStringLength(GetTag(OBJECT_SELF))-5);
string sName = GetCampaignString("swhouses", "OWNER_NAME_"+sHouse);
string sID = GetCampaignString("swhouses", "OWNER_ID_"+sHouse);

if( GetPCPlayerName(oPC) == sID && GetName(oPC) == sName)
    {
    ActionOpenDoor(OBJECT_SELF);
    DelayCommand(8.0, ActionCloseDoor(OBJECT_SELF));
    }
}
