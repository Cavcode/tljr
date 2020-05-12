void main()
{
object oItem = GetFirstItemInInventory(OBJECT_SELF);

while (GetIsObjectValid(oItem) == TRUE)
    {
    DestroyObject(oItem);
    oItem = GetNextItemInInventory(OBJECT_SELF);
    }
}
