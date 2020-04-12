#include "sfcraft_include"
void main()
{
    SetLocalString(OBJECT_SELF, "IPTYPE", IntToString(ITEM_PROPERTY_KEEN));
    SF_SetLocalItemProperty();
}
