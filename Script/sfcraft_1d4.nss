#include "sfcraft_include"
void main()
{
    SetLocalString(OBJECT_SELF, "IPAMOUNT", IntToString(IP_CONST_DAMAGEBONUS_1d4));
    SF_SetLocalItemProperty();
}
