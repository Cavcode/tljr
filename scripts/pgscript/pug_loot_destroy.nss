void main()
{
if (GetIsObjectValid(GetFirstItemInInventory(OBJECT_SELF)) == FALSE)
    {
    DestroyObject(OBJECT_SELF);
    }
}
