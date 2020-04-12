#include "nwnx_creature"
void main()
{

    object oPC = OBJECT_SELF;

    object oDicebag = GetItemPossessedBy(oPC, "dmfi_pc_dicebag");

    if(oDicebag == OBJECT_INVALID)
    {
        oDicebag = CreateItemOnObject("dmfi_pc_dicebag",oPC);
    }

}
