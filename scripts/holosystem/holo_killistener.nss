void main()
{
object oListener = GetNearestObjectByTag("holo_listen", OBJECT_SELF, 1);

if (GetArea(oListener) == GetArea(OBJECT_SELF))
    {
        DestroyObject(oListener);
    }

}
