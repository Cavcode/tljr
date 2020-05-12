void main()
{
object oPC = GetClickingObject();

if(GetIsObjectValid(GetItemPossessedBy(oPC, "TraderBadge"))==TRUE )
    {
    ActionOpenDoor(OBJECT_SELF);
    DelayCommand(8.0, ActionCloseDoor(OBJECT_SELF));
    }
}
