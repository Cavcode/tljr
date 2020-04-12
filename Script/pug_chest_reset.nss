void ResetChest(object oChest)
{
SetLocalInt(oChest, "RESETTING", 0);
}
void main()
{
SetLocked(OBJECT_SELF, TRUE);
object oItem = GetFirstItemInInventory(OBJECT_SELF);
int nCount = 0;
string sTag = GetTag(OBJECT_SELF);
int nReset = GetLocalInt(OBJECT_SELF, "RESETTING");

while (GetIsObjectValid(oItem) == TRUE)
    {
    nCount++;
    oItem = GetNextItemInInventory(OBJECT_SELF);
    }
if (nCount == 0 && nReset == FALSE)
    {
    DelayCommand(1200.0, ResetChest(OBJECT_SELF));
    }
}
