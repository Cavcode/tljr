#include "sfcraft_include"
void main()
{
    SetLocalString(OBJECT_SELF, "IPAMOUNT", IntToString(IP_CONST_DAMAGEBONUS_2d10));
    SF_SetLocalItemProperty();
}
