#include "sfcraft_include"
void main()
{
    SetLocalString(OBJECT_SELF, "IPAMOUNT", IntToString(IP_CONST_DAMAGEBONUS_2d6));
    SF_SetLocalItemProperty();
}
