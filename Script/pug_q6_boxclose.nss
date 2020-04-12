#include "nw_i0_tool"
void main()
{
if (HasItem(OBJECT_SELF, "pug_q6_artifact"))
    {DestroyObject(GetItemPossessedBy(OBJECT_SELF, "pug_q6_artifact"));}
SetLocked(OBJECT_SELF, TRUE);
}
