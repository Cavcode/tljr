#include "qx_leto_func"
void main()
{
    object oPC = OBJECT_SELF;
    string sSubrace = GetSubRace(oPC);
    int iSubrace = GetSubRaceInt(sSubrace);

    if (iSubrace == 5)
    {
        object oRace = CreateItemOnObject("subrace", oPC);
        AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyRegeneration(1), oRace);
        AssignCommand(oPC, ActionEquipItem(oRace, INVENTORY_SLOT_CARMOUR));
    }
}
